import 'dart:io';

import 'package:flutter/material.dart';

import 'package:in_app_purchase/in_app_purchase.dart';

import 'package:kubenav/services/sponsor_service.dart';
import 'package:kubenav/utils/logger.dart';

/// [productIDs] is a set of product ids which are configured in the Google Play
/// Console and in App Store Connect. The set contains all the sponsoring levels
/// which can be used by a user.
const Set<String> productIDs = {'monthly_sponsor', 'yearly_sponsor'};

/// [periods] contains the renew period for all configured [productIDs]. At the
/// moment we are supporting a monthly and a yearly sponsorship.
const Map<String, String> periods = {
  'monthly_sponsor': 'per Month',
  'yearly_sponsor': 'per Year',
};

/// [titles] contains the titles for all configured [productIDs].
const Map<String, String> titles = {
  'monthly_sponsor': 'Monthly Sponsor',
  'yearly_sponsor': 'Yearly Sponsor',
};

/// The [SponsorRepositoryStatus] enum value contains all statuses for the
/// [SponsorRepository]. The status can be [done] or [pending]. Normally the
/// status is always [done] and only [pending] for the time between the user
/// clicks on the subscribe button and finishes the payment.
enum SponsorRepositoryStatus { pending, done }

/// The [SponsorRepository] handles the sponsoring of the project via In-App
/// Purchases for iOS and Android. It is responsible for fetching all available
/// products and for validating the purchase stream to check if the user has a
/// valid subscription.
///
/// Some helpful links for handling In-App Purchase on Android and iOS:
///   - https://help.apple.com/app-store-connect/#/devb57be10e7
///   - https://github.com/flutter/plugins/blob/main/packages/in_app_purchase/in_app_purchase/example/README.md
///   - https://medium.com/bosc-tech-labs-private-limited/how-to-implement-subscriptions-in-app-purchase-in-flutter-7ce8906e608a
///   - https://fluffy.es/in-app-purchase-receipt-local/
///   - https://qonversion.io/blog/the-ultimate-guide-to-subscription-testing-on-android/
class SponsorRepository with ChangeNotifier {
  SponsorRepository() {
    _init();
  }

  final InAppPurchase _iap = InAppPurchase.instance;

  SponsorRepositoryStatus _status = SponsorRepositoryStatus.done;
  bool _isAvailable = false;
  bool _isSponsor = false;
  List<ProductDetails> _products = [];
  final List<PurchaseDetails> _purchases = [];

  SponsorRepositoryStatus get status => _status;
  bool get isAvailable => _isAvailable;
  bool get isSponsor => _isSponsor;
  List<ProductDetails> get products => _products;

  /// [_init] initializes the repository, by listining to the purchase steam,
  /// loading all products and restoring the users old purchases.
  ///
  /// While listining to the purchases stream we adjust the [_status] variable
  /// and set it to `done` or `pending`, depending on the `PurchaseStatus`. If
  /// the status is `PurchaseStatus.purchased` we set the [_isSponsor] to `true`
  /// or if the `PurchaseStatus.restored` we also set the [_isSponsor] variable
  /// to `true` when the corresponding verification succeeds (via [_verify]
  /// function).
  Future<void> _init() async {
    try {
      _isAvailable = await _iap.isAvailable();

      if (_isAvailable) {
        _iap.purchaseStream.listen(
          (data) async {
            Logger.log(
              'SponsorRepository _init',
              'Received purchase stream data',
              data,
            );

            bool skipVerify = false;
            for (final purchaseDetails in data) {
              Logger.log(
                'SponsorRepository _init',
                'Purchase details for received purchase stream data',
                'ProductID: ${purchaseDetails.productID}, PurchaseID: ${purchaseDetails.purchaseID}, Status: ${purchaseDetails.status}, Error: ${purchaseDetails.error.toString()}',
              );
              try {
                if (purchaseDetails.status == PurchaseStatus.pending) {
                  _status = SponsorRepositoryStatus.pending;
                  notifyListeners();
                } else {
                  if (purchaseDetails.status == PurchaseStatus.error) {
                    Logger.log(
                      'SponsorRepository _init',
                      'PurchaseDetails status is error',
                      'Source: ${purchaseDetails.error?.source}, Code: ${purchaseDetails.error?.code}, Message: ${purchaseDetails.error?.message}, Details: ${purchaseDetails.error?.details}',
                    );
                    _status = SponsorRepositoryStatus.done;
                    notifyListeners();
                  } else if (purchaseDetails.status ==
                      PurchaseStatus.purchased) {
                    _isSponsor = true;
                    _status = SponsorRepositoryStatus.done;
                    notifyListeners();
                  } else if (purchaseDetails.status ==
                      PurchaseStatus.restored) {
                    if (_isSponsor == false && skipVerify == false) {
                      if (await _verify() == true) {
                        _isSponsor = true;
                      }
                    }
                    _status = SponsorRepositoryStatus.done;
                    notifyListeners();
                    skipVerify = true;
                  }

                  if (purchaseDetails.pendingCompletePurchase) {
                    await _iap.completePurchase(purchaseDetails);
                    _status = SponsorRepositoryStatus.done;
                    notifyListeners();
                  }
                }
              } catch (err) {
                Logger.log(
                  'SponsorRepository _init',
                  'An unknown error occured while listining to purchase stream',
                  err,
                );
              }
            }

            _purchases.addAll(data);
            notifyListeners();
          },
          onDone: () {
            Logger.log(
              'SponsorRepository _init',
              'Listen to purchase stream is done',
            );
          },
          onError: (err) {
            Logger.log(
              'SponsorRepository _init',
              'An error occured while listining to the purchase stream',
              err,
            );
          },
        );

        await _getProducts();
        await _iap.restorePurchases();
      }
    } catch (err) {
      Logger.log(
        'SponsorRepository _init',
        'Could not initalize repository',
        err,
      );
    }
  }

  /// [_getProducts] lists all products for the set of [productIDs]. The
  /// retrieved products are then stored in the [_products] variable.
  Future<void> _getProducts() async {
    ProductDetailsResponse response = await _iap.queryProductDetails(
      productIDs,
    );
    Logger.log(
      'SponsorRepository _getProducts',
      'Get products',
      'Not Found IDs: ${response.notFoundIDs}, Products: ${response.productDetails}, Error: ${response.error.toString()}',
    );

    for (final product in response.productDetails) {
      Logger.log(
        'SponsorRepository _getProducts',
        'Product details',
        'ID: ${product.id}, Title: ${product.title}, Price: ${product.price}',
      );
    }

    _products = response.productDetails;
    notifyListeners();
  }

  /// [_verify] verifies that a user has a valid subscription.
  ///
  /// On iOS we are verify the purchase by using the
  /// https://github.com/tikhop/TPInAppReceipt Swift package. We call the
  /// required function via the [KubenavMobile] platform channels. If the
  /// returned data is `true` the verification was successfull. If it is `false`
  /// the verification failed.
  ///
  /// On Android we do not have to verify the returned purchases, since we only
  /// receive purchase for an active subscription, so that we can always return
  /// `true`.
  Future<bool> _verify() async {
    try {
      if (Platform.isIOS) {
        final result = await SponsorService().verifyIAP();
        if (result == 'true') {
          return true;
        }
        return false;
      } else {
        return true;
      }
    } catch (err) {
      Logger.log(
        'SponsorRepository _verify',
        'Could not verify subscriptions',
        err,
      );
      return false;
    }
  }

  /// [subscribe] let a user subscribe to the provided [product]. This just
  /// initializes the subscription process and we have to listen to the purchase
  /// stream to check if the user completes the purchase or if he cancels the
  /// subscription.
  Future<void> subscribe(ProductDetails product) async {
    try {
      if (_isAvailable) {
        final PurchaseParam purchaseParam = PurchaseParam(
          productDetails: product,
        );
        await _iap.buyNonConsumable(purchaseParam: purchaseParam);
      }
    } catch (err) {
      Logger.log(
        'SponsorRepository subscribe',
        'An error occured, while subscription was created',
        err,
      );
      rethrow;
    }
  }

  Future<void> restorePurchases() async {
    try {
      if (_isAvailable) {
        await _iap.restorePurchases();
      }
    } catch (err) {
      Logger.log(
        'SponsorRepository restorePurchases',
        'An error occured, while restoring purchases',
        err,
      );
      rethrow;
    }
  }
}
