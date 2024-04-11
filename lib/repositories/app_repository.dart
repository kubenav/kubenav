import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:local_auth/local_auth.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/storage.dart';

/// The [AppRepository] is responsible for managing the users app settings and
/// some global values for the current user session, like the active tab for the
/// bottom navigation bar ([_currentPageIndex]) and if the user
/// [isAuthenticated]. The [isAuthenticated] parameter is also used to check if
/// the repository was initialized, because it will also be set to `true` when
/// the user has no authentication enabled.
///
/// The settings of the user are stored via the Flutter Secure Storage package
/// and must be loaded by calling the [init] function as early as possible.
class AppRepository with ChangeNotifier {
  int _currentPageIndex = Constants.pageIndexHome;
  bool _isAuthenticated = false;
  bool _showClusters = true;
  AppRepositorySettings _settings = AppRepositorySettings.fromDefault();

  int get currentPageIndex => _currentPageIndex;
  bool get isAuthenticated => _isAuthenticated;
  bool get showClusters => _showClusters;
  AppRepositorySettings get settings => _settings;

  /// [setCurrentPageIndex] sets the [_currentPageIndex] value to the provided
  /// [index]. The current page index is used to highlight the active item in
  /// the bottom navigation bar of the app.
  void setCurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  /// [_save] writes the users settings via the Flutter Secure Storage package
  /// and should be callled every time the user changes his app settings.
  Future<void> _save() async {
    try {
      await Storage().write(
        'kubenav-settings',
        json.encode(_settings.toJson()),
      );
    } catch (err) {
      Logger.log(
        'AppRepository _save',
        'Could not save settings',
        err,
      );
    }
  }

  /// [init] Loads the users app settings via the Flutter Secure Storage
  /// package. This function should be called as early as possible (e.g. when
  /// the splash screen of the app is still visible).
  ///
  /// When the user has enabled the authentication via Face ID / Touch ID it
  /// will also call the [authenticate] function to ensure that the user is
  /// authenticated before he can continue using the app.
  ///
  /// When a user did not enabled the [_settings.isShowClustersOnStart] option
  /// we set the [_showClusters] option to false, to directly show the overview
  /// page and not the clusters page on the home screen.
  Future<void> init() async {
    try {
      final data = await Storage().read('kubenav-settings');
      if (data != null) {
        _settings = AppRepositorySettings.fromJson(json.decode(data));
      }

      if (_settings.isAuthenticationEnabled) {
        await authenticate();
        _isAuthenticated = true;
      } else {
        _isAuthenticated = true;
      }

      if (!_settings.isShowClustersOnStart) {
        _showClusters = false;
      }

      notifyListeners();
    } catch (err) {
      Logger.log(
        'AppRepository _init',
        'Could not load settings',
        err,
      );
    }
  }

  /// [toogleAuthentication] enables / disables the authentication via Face ID
  /// or Touch ID in the app. If the user disables the authentication we just
  /// have to change the corresponding [_settings.isAuthenticationEnabled]
  /// setting. If the user enables the authentication we have to check that the
  /// device is enrollred into the biometrics authentication and that the device
  /// has supports biometric authentication before we can change the setting.
  Future<void> toogleAuthentication() async {
    try {
      if (_settings.isAuthenticationEnabled) {
        _settings.isAuthenticationEnabled = false;
        await _save();
        notifyListeners();
      } else {
        final LocalAuthentication auth = LocalAuthentication();
        final bool canAuthenticateWithBiometrics =
            await auth.canCheckBiometrics;
        final bool canAuthenticate =
            canAuthenticateWithBiometrics || await auth.isDeviceSupported();

        if (canAuthenticate) {
          final List<BiometricType> availableBiometrics =
              await auth.getAvailableBiometrics();

          if (availableBiometrics.isNotEmpty) {
            _settings.isAuthenticationEnabled = true;
            await _save();
            notifyListeners();
          } else {
            Logger.log(
              'Enable / disable Authentication failed',
              'Authentication could not be enabled, because the device hasn\'t any biometrics enrolled.',
            );
            throw Exception(
              'Authentication could not be enabled, because the device hasn\'t any biometrics enrolled.',
            );
          }
        } else {
          Logger.log(
            'Enable / disable Authentication failed',
            'Authentication could not be enabled, because the device is not supported.',
          );
          throw Exception(
            'Authentication could not be enabled, because the device is not supported.',
          );
        }
      }
    } catch (err) {
      Logger.log(
        'Enable / disable Authentication failed',
        err.toString(),
      );
      rethrow;
    }
  }

  /// [authenticate] authenticates the user via the [LocalAuthentication]
  /// package. We do not check if the [_settings.isAuthenticationEnabled] is set
  /// to `true` within the function so that must be done before we call it.
  Future<void> authenticate() async {
    while (true) {
      try {
        final LocalAuthentication auth = LocalAuthentication();
        final bool canAuthenticateWithBiometrics =
            await auth.canCheckBiometrics;
        final bool canAuthenticate =
            canAuthenticateWithBiometrics || await auth.isDeviceSupported();

        if (canAuthenticate) {
          final List<BiometricType> availableBiometrics =
              await auth.getAvailableBiometrics();

          if (availableBiometrics.isNotEmpty) {
            final bool didAuthenticate = await auth.authenticate(
              localizedReason: 'Authenticate to access your clusters',
              options: const AuthenticationOptions(useErrorDialogs: false),
            );

            if (didAuthenticate) {
              break;
            } else {
              Logger.log(
                'Authentication Failed',
                'You could not be authenticated, please try again',
              );
            }
          } else {
            break;
          }
        } else {
          break;
        }
      } catch (err) {
        Logger.log(
          'Authentication Failed',
          err.toString(),
        );
      }
    }
  }

  /// [addNamespace] adds the provided [value] to the list of the users favorite
  /// namespaces.
  Future<void> addNamespace(String value) async {
    if (_settings.namespaces.where((e) => e == value).toList().isEmpty) {
      _settings.namespaces.add(value);
      await _save();
      notifyListeners();
    }
  }

  /// [deleteNamespace] deletes the namespace with the provided [value] from the
  /// list of the users favorite namespaces.
  Future<void> deleteNamespace(String value) async {
    _settings.namespaces = _settings.namespaces
        .where(
          (e) => e != value,
        )
        .toList();
    await _save();
    notifyListeners();
  }

  /// [reorderNamespaces] can be used to change the order of the namespaces
  /// (e.g. via ReorderableListView).
  ///
  /// We have to check if the user drags a namespace from top to bottom ([start]
  /// is lower then [current]) or from the bottom to the top ([start] is greater
  /// then [current]), to apply a different logic for the reordering.
  Future<void> reorderNamespaces(int start, int current) async {
    try {
      if (start < current) {
        int end = current - 1;
        String startItem = _settings.namespaces[start];
        int i = 0;
        int local = start;
        do {
          _settings.namespaces[local] = _settings.namespaces[++local];
          i++;
        } while (i < end - start);
        _settings.namespaces[end] = startItem;
      } else if (start > current) {
        String startItem = _settings.namespaces[start];
        for (int i = start; i > current; i--) {
          _settings.namespaces[i] = _settings.namespaces[i - 1];
        }
        _settings.namespaces[current] = startItem;
      }

      await _save();
      notifyListeners();
    } catch (_) {}
  }

  /// [setEditorFormat] sets the editor format to the provided [value]. The
  /// editor format can be `yaml` or `json`. By default all manifests in a code
  /// editor are displayed as `yaml` documents.
  Future<void> setEditorFormat(String value) async {
    try {
      _settings.editorFormat = value;
      await _save();
      notifyListeners();
    } catch (_) {}
  }

  /// [setProxy] changes the users proxy setting to the provided [value]. The
  /// provided proxy is then used for all Kubernetes API requests.
  Future<void> setProxy(String value) async {
    try {
      _settings.proxy = value;
      await _save();
      notifyListeners();
    } catch (_) {}
  }

  /// [setTimeout] sets the timeout for all Kubernetes API requests to the
  /// provided [value]. A timeout value of `0` means that we do not apply a
  /// timeout for the Kubernetes API requests.
  Future<void> setTimeout(int value) async {
    try {
      _settings.timeout = value;
      await _save();
      notifyListeners();
    } catch (_) {}
  }

  /// [setPrometheus] changes the users Prometheus configuration to the provided
  /// [value].
  Future<void> setPrometheus(AppRepositorySettingsPrometheus value) async {
    try {
      _settings.prometheus = value;
      await _save();
      notifyListeners();
    } catch (_) {}
  }

  /// [setIsShowClustersOnStart] sets the [_settings.isShowClustersOnStart]
  /// option to the provided [value]. The [_settings.isShowClustersOnStart]
  /// controlls if we display the [HomeOverview] widget or the [HomeClusters]
  /// widget when the app is started.
  ///
  /// When the value is toggled we also set the [_showClusters] value to `false`
  /// to no show the [HomeClusters] widget when the user goes back to the home
  /// page (This could happen if the option is enabled during startup, but the
  /// user hasn't added any clusters yet).
  Future<void> setIsShowClustersOnStart(bool value) async {
    try {
      _settings.isShowClustersOnStart = value;
      _showClusters = false;
      await _save();
      notifyListeners();
    } catch (_) {}
  }

  /// [disableShowClusters] sets the [_showClusters] property to `false`, so
  /// that the [HomeClusters] widget is not shown again. The widget is only
  /// shown when [_showClusters] is `true` and the list of clusters is not
  /// empty.
  Future<void> disableShowClusters() async {
    try {
      _showClusters = false;
      notifyListeners();
    } catch (_) {}
  }

  /// [setSponsorReminder] sets the sponsor reminder to the provided [value].
  /// The value must be a unix timestamp in milliseconds which is in the future.
  Future<void> setSponsorReminder(int value) async {
    try {
      _settings.sponsorReminder = value;
      await _save();
      notifyListeners();
    } catch (_) {}
  }

  /// [setFullHeightModals] enables or disables full height modals. When the
  /// [value] is `true` full height modals will be enabled. If the [value] is
  /// `false` the will be disabled.
  Future<void> setFullHeightModals(bool value) async {
    try {
      _settings.fullHeightModals = value;
      await _save();
      notifyListeners();
    } catch (_) {}
  }

  /// [setClassicMode] enables or disables the classic navigation mode known
  /// from version 3. When the [value] is `true` classic mode will be enabled.
  /// If the [value] is `false` it will be disabled.
  Future<void> setClassicMode(bool value) async {
    try {
      _settings.classicMode = value;
      await _save();
      notifyListeners();
    } catch (_) {}
  }
}

/// The [AppRepositorySettings] model represents all the app settings which can
/// be set by a user.
class AppRepositorySettings {
  List<String> namespaces;
  bool isAuthenticationEnabled;
  bool isShowClustersOnStart;
  String editorFormat;
  bool fullHeightModals;
  bool classicMode;
  String proxy;
  int timeout;
  int sponsorReminder;
  AppRepositorySettingsPrometheus prometheus;

  AppRepositorySettings({
    required this.namespaces,
    required this.isAuthenticationEnabled,
    required this.isShowClustersOnStart,
    required this.editorFormat,
    required this.fullHeightModals,
    required this.classicMode,
    required this.proxy,
    required this.timeout,
    required this.sponsorReminder,
    required this.prometheus,
  });

  factory AppRepositorySettings.fromDefault() {
    return AppRepositorySettings(
      namespaces: [],
      isAuthenticationEnabled: false,
      isShowClustersOnStart: false,
      editorFormat: 'yaml',
      fullHeightModals: false,
      classicMode: false,
      proxy: '',
      timeout: 0,
      sponsorReminder: 0,
      prometheus: AppRepositorySettingsPrometheus.fromDefault(),
    );
  }

  factory AppRepositorySettings.fromJson(Map<String, dynamic> data) {
    return AppRepositorySettings(
      namespaces: data.containsKey('namespaces') && data['namespaces'] != null
          ? (json.decode(data['namespaces']) as List<dynamic>).cast<String>()
          : [],
      isAuthenticationEnabled: data.containsKey('isAuthenticationEnabled') &&
              data['isAuthenticationEnabled'] != null
          ? data['isAuthenticationEnabled']
          : false,
      isShowClustersOnStart: data.containsKey('isShowClustersOnStart') &&
              data['isShowClustersOnStart'] != null
          ? data['isShowClustersOnStart']
          : false,
      editorFormat:
          data.containsKey('editorFormat') && data['editorFormat'] != null
              ? data['editorFormat']
              : 'yaml',
      fullHeightModals: data.containsKey('fullHeightModals') &&
              data['fullHeightModals'] != null
          ? data['fullHeightModals']
          : false,
      classicMode:
          data.containsKey('classicMode') && data['classicMode'] != null
              ? data['classicMode']
              : false,
      proxy: data.containsKey('proxy') && data['proxy'] != null
          ? data['proxy']
          : '',
      timeout: data.containsKey('timeout') && data['timeout'] != null
          ? data['timeout']
          : 0,
      sponsorReminder:
          data.containsKey('sponsorReminder') && data['sponsorReminder'] != null
              ? data['sponsorReminder']
              : 0,
      prometheus: data.containsKey('prometheus') && data['prometheus'] != null
          ? AppRepositorySettingsPrometheus.fromJson(data['prometheus'])
          : AppRepositorySettingsPrometheus.fromDefault(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'namespaces': json.encode(namespaces),
      'isAuthenticationEnabled': isAuthenticationEnabled,
      'isShowClustersOnStart': isShowClustersOnStart,
      'editorFormat': editorFormat,
      'fullHeightModals': fullHeightModals,
      'classicMode': classicMode,
      'proxy': proxy,
      'timeout': timeout,
      'sponsorReminder': sponsorReminder,
      'prometheus': prometheus.toJson(),
    };
  }
}

/// The [AppRepositorySettingsPrometheus] model represents all the
/// configurations which can be set by a user for the Prometheus plugin.
class AppRepositorySettingsPrometheus {
  bool enabled;
  String address;
  String namespace;
  String labelSelector;
  String container;
  int port;
  String path;
  String username;
  String password;
  String token;
  String certificate;

  AppRepositorySettingsPrometheus({
    required this.enabled,
    required this.address,
    required this.namespace,
    required this.labelSelector,
    required this.container,
    required this.port,
    required this.path,
    required this.username,
    required this.password,
    required this.token,
    required this.certificate,
  });

  factory AppRepositorySettingsPrometheus.fromDefault() {
    return AppRepositorySettingsPrometheus(
      enabled: false,
      address: '',
      namespace: 'monitoring',
      labelSelector: 'app=prometheus',
      container: 'prometheus',
      port: 9090,
      path: '',
      username: '',
      password: '',
      token: '',
      certificate: '',
    );
  }

  factory AppRepositorySettingsPrometheus.fromJson(Map<String, dynamic> data) {
    return AppRepositorySettingsPrometheus(
      enabled: data.containsKey('enabled') && data['enabled'] != null
          ? data['enabled']
          : false,
      address: data.containsKey('address') && data['address'] != null
          ? data['address']
          : '',
      namespace: data.containsKey('namespace') && data['namespace'] != null
          ? data['namespace']
          : 'monitoring',
      labelSelector:
          data.containsKey('labelSelector') && data['labelSelector'] != null
              ? data['labelSelector']
              : 'app=prometheus',
      container: data.containsKey('container') && data['container'] != null
          ? data['container']
          : 'prometheus',
      port: data.containsKey('port') && data['port'] != null
          ? data['port']
          : 9090,
      path:
          data.containsKey('path') && data['path'] != null ? data['path'] : '',
      username: data.containsKey('username') && data['username'] != null
          ? data['username']
          : '',
      password: data.containsKey('password') && data['password'] != null
          ? data['password']
          : '',
      token: data.containsKey('token') && data['token'] != null
          ? data['token']
          : '',
      certificate:
          data.containsKey('certificate') && data['certificate'] != null
              ? data['certificate']
              : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'address': address,
      'namespace': namespace,
      'labelSelector': labelSelector,
      'container': container,
      'port': port,
      'path': path,
      'username': username,
      'password': password,
      'token': token,
      'certificate': certificate,
    };
  }
}
