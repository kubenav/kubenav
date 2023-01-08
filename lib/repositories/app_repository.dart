import 'dart:convert';
import 'dart:io';

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
  AppRepositorySettings _settings = AppRepositorySettings.fromDefault();

  int get currentPageIndex => _currentPageIndex;
  bool get isAuthenticated => _isAuthenticated;
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
  Future<void> init() async {
    try {
      final data = await Storage().read('kubenav-settings');
      if (data != null) {
        _settings = AppRepositorySettings.fromJson(json.decode(data));
      }

      if ((Platform.isAndroid || Platform.isIOS) &&
          _settings.isAuthenticationEnabled) {
        await authenticate();
        _isAuthenticated = true;
      } else {
        _isAuthenticated = true;
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
              'Enable Authentication failed',
              'Authentication could not be enabled, because the device hasn\'t any biometrics enrolled.',
            );
            throw Exception(
              'Authentication could not be enabled, because the device hasn\'t any biometrics enrolled.',
            );
          }
        } else {
          Logger.log(
            'Enable Authentication failed',
            'Authentication could not be enabled, because the device is not supported.',
          );
          throw Exception(
            'Authentication could not be enabled, because the device is not supported.',
          );
        }
      }
    } catch (err) {
      Logger.log(
        'Enable Authentication failed',
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
    _settings.namespaces.add(value);
    await _save();
    notifyListeners();
  }

  /// [deleteNamespace] deletes the namespace with the provided [index] from the
  /// list of the users favorite namespaces.
  Future<void> deleteNamespace(int index) async {
    _settings.namespaces.removeAt(index);
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
}

/// The [AppRepositorySettings] model represents all the app settings which can
/// be set by a user.
class AppRepositorySettings {
  List<String> namespaces;
  bool isAuthenticationEnabled;
  String editorFormat;
  String proxy;
  int timeout;
  AppRepositorySettingsPrometheus prometheus;

  AppRepositorySettings({
    required this.namespaces,
    required this.isAuthenticationEnabled,
    required this.editorFormat,
    required this.proxy,
    required this.timeout,
    required this.prometheus,
  });

  factory AppRepositorySettings.fromDefault() {
    return AppRepositorySettings(
      namespaces: [],
      isAuthenticationEnabled: false,
      editorFormat: 'yaml',
      proxy: '',
      timeout: 0,
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
      editorFormat:
          data.containsKey('editorFormat') && data['editorFormat'] != null
              ? data['editorFormat']
              : 'yaml',
      proxy: data.containsKey('proxy') && data['proxy'] != null
          ? data['proxy']
          : '',
      timeout: data.containsKey('timeout') && data['timeout'] != null
          ? data['timeout']
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
      'editorFormat': editorFormat,
      'proxy': proxy,
      'timeout': timeout,
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
    };
  }
}
