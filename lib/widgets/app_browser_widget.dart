import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';

/// [AppBrowserController] is the controller for the [AppBrowserWidget] widget. It contains the [WebViewController] and
/// the value for the [url] input field. It is also responsible for loading the url provided by the user via the input
/// field.
class AppBrowserController extends GetxController {
  AppBrowserController({this.webViewController});

  WebViewController? webViewController;
  final url = TextEditingController();

  void setWebViewController(WebViewController wvc) async {
    webViewController = wvc;
  }

  /// [changeUrl] is called when a user triggers the submit action of the [url] input field in the [AppBrowserWidget].
  /// When the [webViewController] was initialized we call the `loadUrl` function to go to the new url provided by the
  /// user.
  void changeUrl(String url) async {
    if (webViewController != null) {
      await webViewController!.loadUrl(url);
    }
  }
}

/// [AppBrowserWidget] is a simple in app browser widget. It should be displayed within a bottom sheet and can be
/// created as follows:
///
/// ```
/// Get.bottomSheet(
///   BottomSheet(
///     shape: RoundedRectangleBorder(
///       borderRadius:
///           BorderRadius.circular(Constants.sizeBorderRadius),
///     ),
///     onClosing: () {},
///     enableDrag: false,
///     builder: (builder) {
///       return AppBrowserWidget(
///         initialUrl: 'https://github.com/sponsors/ricoberger',
///         onClosePressed: () {
///           finish(context);
///         },
///       );
///     },
///   ),
///   isScrollControlled: true,
/// );
/// ```
class AppBrowserWidget extends StatelessWidget {
  AppBrowserWidget({
    Key? key,
    required this.initialUrl,
    required this.onClosePressed,
  }) : super(key: key);

  final String initialUrl;
  final void Function() onClosePressed;

  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };

  @override
  Widget build(BuildContext context) {
    AppBrowserController controller = Get.put(
      AppBrowserController(),
    );

    return Container(
      height: MediaQuery.of(context).size.height,
      color: Constants.colorAppBarBackground,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: Constants.spacingLarge * 2,
              bottom: Constants.spacingMiddle,
              left: Constants.spacingMiddle,
              right: Constants.spacingMiddle,
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: controller.url,
                            onSubmitted: (value) {
                              controller.changeUrl(value);
                            },
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.url,
                            autocorrect: false,
                            enableSuggestions: false,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close_outlined,
                            color: Colors.white,
                          ),
                          onPressed: onClosePressed,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: WebView(
              initialUrl: initialUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                controller.setWebViewController(webViewController);
              },
              onPageFinished: (String url) {
                controller.url.text = url;
              },
              gestureNavigationEnabled: true,
              gestureRecognizers: gestureRecognizers,
            ),
          ),
          const NavigationControls(),
        ],
      ),
    );
  }
}

/// [NavigationControls] is a widget, which provides some basic navigation features for our in app browser in a bottom
/// navigation bar. This allows a user to go back or forward, to reload the current page or to open the page in the
/// systems default browser.
class NavigationControls extends StatelessWidget {
  const NavigationControls({
    Key? key,
  }) : super(key: key);

  void goBack(WebViewController? controller) async {
    if (await controller!.canGoBack()) {
      await controller.goBack();
    } else {
      Logger.log(
        'NavigationControls goBack',
        'Can not go back',
      );
      return;
    }
  }

  void goForward(WebViewController? controller) async {
    if (await controller!.canGoForward()) {
      await controller.goForward();
    } else {
      Logger.log(
        'NavigationControls goForward',
        'Can not go forward',
      );
      return;
    }
  }

  void openInBrowser(WebViewController? controller) async {
    final url = await controller!.currentUrl();
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      Logger.log(
        'NavigationControls goForward',
        'Can not open url $url in browser',
      );
      return;
    }
  }

  void reload(WebViewController? controller) async {
    await controller!.reload();
  }

  @override
  Widget build(BuildContext context) {
    AppBrowserController controller = Get.put(
      AppBrowserController(),
    );

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Constants.colorPrimary,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        switch (value) {
          case 0:
            goBack(controller.webViewController);
            break;
          case 1:
            goForward(controller.webViewController);
            break;
          case 2:
            openInBrowser(controller.webViewController);
            break;
          case 3:
            reload(controller.webViewController);
            break;
          default:
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Back',
          icon: Icon(Icons.arrow_back_ios),
        ),
        BottomNavigationBarItem(
          label: 'Forward',
          icon: Icon(Icons.arrow_forward_ios),
        ),
        BottomNavigationBarItem(
          label: 'Browser',
          icon: Icon(Icons.open_in_browser),
        ),
        BottomNavigationBarItem(
          label: 'Reload',
          icon: Icon(Icons.refresh),
        ),
      ],
    );
  }
}
