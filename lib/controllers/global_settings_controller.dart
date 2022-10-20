import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';

import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';

/// The [GlobalSettingsController] is responsible for handling user defined settings in the app.
class GlobalSettingsController extends GetxController {
  RxList<String> namespaces = <String>[].obs;
  RxBool isAuthenticationEnabled = false.obs;
  RxBool isDarkTheme = false.obs;
  RxString editorFormat = 'yaml'.obs;
  RxString proxy = ''.obs;
  RxInt timeout = 0.obs;

  RxBool prometheusEnabled = false.obs;
  RxString prometheusAddress = ''.obs;
  RxString prometheusNamespace = ''.obs;
  RxString prometheusLabelSelector = ''.obs;
  RxString prometheusContainer = ''.obs;
  RxInt prometheusPort = 0.obs;
  RxString prometheusUsername = ''.obs;
  RxString prometheusPassword = ''.obs;
  RxString prometheusToken = ''.obs;

  /// [onInit] is used to initialize the settings. For that we are looking if the value is already saved in the storage.
  /// If this is the case we are reusing the saved value. If we could not found saved values we are using the default.
  ///
  /// Besides that we are also using the [ever] function so that all changes to the settings are saved back to the
  /// storage.
  @override
  void onInit() {
    /// Namespaces: A manual configured list of namespaces, which are displayed on top of the namespaces bottom sheet,
    /// to allow faster access. This list can also be used when a user does not have the privilege to list all
    /// namespaces in a cluster.
    String? storedNamespaces = GetStorage().read<String>('settings.namespaces');
    namespaces.value = storedNamespaces != null && storedNamespaces != ''
        ? storedNamespaces.split(',')
        : [];

    ever(namespaces, (_) {
      GetStorage().write('settings.namespaces', namespaces.toList().join(','));
    });

    /// Authentication: Can be used to enable / disable authentication in the mobile version of kubenav. If enabled the
    /// user must authenticate using Touch ID or Face ID, before he can access the app.
    bool? storedIsAuthenticationEnabled =
        GetStorage().read<bool>('settings.isAuthenticationEnabled');
    isAuthenticationEnabled.value = storedIsAuthenticationEnabled ?? false;

    ever(isAuthenticationEnabled, (_) {
      GetStorage().write(
          'settings.isAuthenticationEnabled', isAuthenticationEnabled.value);
    });

    /// Theme: Can be used to enable / disable the darm mode.
    bool? storedIsDarkTheme = GetStorage().read<bool>('settings.isDarkTheme');
    isDarkTheme.value = storedIsDarkTheme ?? false;
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);

    ever(isDarkTheme, (_) {
      Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
      GetStorage().write('settings.isDarkTheme', isDarkTheme.value);
    });

    /// Editor format: By default we are showing all manifests in YAML format, but the user can also switch to JSON.
    /// Then all manifests are rendered as JSON document instead of YAML.
    String? storedEditorFormat =
        GetStorage().read<String>('settings.editorFormat');
    editorFormat.value = storedEditorFormat ?? 'yaml';

    ever(editorFormat, (_) {
      GetStorage().write('settings.editorFormat', editorFormat.value);
    });

    /// Proxy: Can be used to configure a proxy for all Kubernetes API requests.
    String? storedProxy = GetStorage().read<String>('settings.proxy');
    proxy.value = storedProxy ?? '';

    ever(proxy, (_) {
      GetStorage().write('settings.proxy', proxy.value);
    });

    /// Timeout: Allows the user to specify a timeout for all Kubernetes API requests. A value of `0` means that the
    /// requests have no timeout.
    int? storedTimeout = GetStorage().read<int>('settings.timeout');
    timeout.value = storedTimeout ?? 0;

    ever(timeout, (_) {
      GetStorage().write('settings.timeout', timeout.value);
    });

    /// Prometheus: Can be used to configure a Prometheus instance, to show metrics for workloads like Pods,
    /// Deployments, StatefulSets, etc.
    ///
    /// The following settings can be configured for Prometheus: [prometheusEnabled], [prometheusAddress],
    /// [prometheusNamespace], [prometheusLabelSelector], [prometheusContainer], [prometheusPort], [prometheusUsername],
    /// [prometheusPassword], [prometheusToken].
    bool? storedPrometheusEnabled =
        GetStorage().read<bool>('settings.prometheusEnabled');
    prometheusEnabled.value = storedPrometheusEnabled ?? false;

    ever(prometheusEnabled, (_) {
      GetStorage().write('settings.prometheusEnabled', prometheusEnabled.value);
    });

    String? storedPrometheusAddress =
        GetStorage().read<String>('settings.prometheusAddress');
    prometheusAddress.value = storedPrometheusAddress ?? '';

    ever(prometheusAddress, (_) {
      GetStorage().write('settings.prometheusAddress', prometheusAddress.value);
    });

    String? storedPrometheusNamespace =
        GetStorage().read<String>('settings.prometheusNamespace');
    prometheusNamespace.value = storedPrometheusNamespace ?? '';

    ever(prometheusNamespace, (_) {
      GetStorage()
          .write('settings.prometheusNamespace', prometheusNamespace.value);
    });

    String? storedPrometheusLabelSelector =
        GetStorage().read<String>('settings.prometheusLabelSelector');
    prometheusLabelSelector.value = storedPrometheusLabelSelector ?? '';

    ever(prometheusLabelSelector, (_) {
      GetStorage().write(
          'settings.prometheusLabelSelector', prometheusLabelSelector.value);
    });

    String? storedPrometheusContainer =
        GetStorage().read<String>('settings.prometheusContainer');
    prometheusContainer.value = storedPrometheusContainer ?? '';

    ever(prometheusContainer, (_) {
      GetStorage()
          .write('settings.prometheusContainer', prometheusContainer.value);
    });

    int? storedPrometheusPort =
        GetStorage().read<int>('settings.prometheusPort');
    prometheusPort.value = storedPrometheusPort ?? 0;

    ever(prometheusPort, (_) {
      GetStorage().write('settings.prometheusPort', prometheusPort.value);
    });

    String? storedPrometheusUsername =
        GetStorage().read<String>('settings.prometheusUsername');
    prometheusUsername.value = storedPrometheusUsername ?? '';

    ever(prometheusUsername, (_) {
      GetStorage()
          .write('settings.prometheusUsername', prometheusUsername.value);
    });

    String? storedPrometheusPassword =
        GetStorage().read<String>('settings.prometheusPassword');
    prometheusPassword.value = storedPrometheusPassword ?? '';

    ever(prometheusPassword, (_) {
      GetStorage()
          .write('settings.prometheusPassword', prometheusPassword.value);
    });

    String? storedPrometheusToken =
        GetStorage().read<String>('settings.prometheusToken');
    prometheusToken.value = storedPrometheusToken ?? '';

    ever(prometheusToken, (_) {
      GetStorage().write('settings.prometheusToken', prometheusToken.value);
    });

    super.onInit();
  }

  void toogleAuthentication() async {
    try {
      if (isAuthenticationEnabled.value) {
        isAuthenticationEnabled.value = false;
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
            isAuthenticationEnabled.value = true;
          } else {
            Logger.log(
              'Enable Authentication failed',
              'Authentication could not be enabled, because the device hasn\'t any biometrics enrolled.',
            );
            snackbar(
              'Enable Authentication failed',
              'Authentication could not be enabled, because the device hasn\'t any biometrics enrolled.',
            );
          }
        } else {
          Logger.log(
            'Enable Authentication failed',
            'Authentication could not be enabled, because the device is not supported.',
          );
          snackbar(
            'Enable Authentication failed',
            'Authentication could not be enabled, because the device is not supported.',
          );
        }
      }
    } catch (err) {
      Logger.log(
        'Enable Authentication failed',
        err.toString(),
      );
      snackbar(
        'Enable Authentication failed',
        err.toString(),
      );
    }
  }

  Map<String, dynamic> getPrometheusConfiguration() {
    return {
      'address': prometheusAddress.value,
      'namespace': prometheusNamespace.value,
      'labelSelector': prometheusLabelSelector.value,
      'container': prometheusContainer.value,
      'port': prometheusPort.value,
      'username': prometheusUsername.value,
      'password': prometheusPassword.value,
      'token': prometheusToken.value,
    };
  }

  /// [reorderNamespaces] can be used to change the order of the namespaces (e.g. via ReorderableListView).
  ///
  /// We have to check if the user drags a namespace from top to bottom ([start] is lower then [current]) or from the
  /// bottom to the top ([start] is greater then [current]), to apply a different logic for the reordering.
  void reorderNamespaces(int start, int current) {
    if (start < current) {
      int end = current - 1;
      String startItem = namespaces[start];
      int i = 0;
      int local = start;
      do {
        namespaces[local] = namespaces[++local];
        i++;
      } while (i < end - start);
      namespaces[end] = startItem;
    } else if (start > current) {
      String startItem = namespaces[start];
      for (int i = start; i > current; i--) {
        namespaces[i] = namespaces[i - 1];
      }
      namespaces[current] = startItem;
    }
  }
}
