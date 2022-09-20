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

  /// [onInit] is used to initialize the settings. For that we are looking if the value is already saved in the storage.
  /// If this is the case we are reusing the saved value. If we could not found saved values we are using the default.
  ///
  /// Besides that we are also using the [ever] function so that all changes to the settings are saved back to the
  /// storage.
  @override
  void onInit() {
    String? storedNamespaces = GetStorage().read<String>('settings.namespaces');
    namespaces.value = storedNamespaces != null && storedNamespaces != ''
        ? storedNamespaces.split(',')
        : [];

    ever(namespaces, (_) {
      GetStorage().write('settings.namespaces', namespaces.toList().join(','));
    });

    bool? storedIsAuthenticationEnabled =
        GetStorage().read<bool>('settings.isAuthenticationEnabled');
    isAuthenticationEnabled.value = storedIsAuthenticationEnabled ?? false;

    ever(isAuthenticationEnabled, (_) {
      GetStorage().write(
          'settings.isAuthenticationEnabled', isAuthenticationEnabled.value);
    });

    bool? storedIsDarkTheme = GetStorage().read<bool>('settings.isDarkTheme');
    isDarkTheme.value = storedIsDarkTheme ?? false;
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);

    ever(isDarkTheme, (_) {
      Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
      GetStorage().write('settings.isDarkTheme', isDarkTheme.value);
    });

    String? storedEditorFormat =
        GetStorage().read<String>('settings.editorFormat');
    editorFormat.value = storedEditorFormat ?? 'yaml';

    ever(editorFormat, (_) {
      GetStorage().write('settings.editorFormat', editorFormat.value);
    });

    String? storedProxy = GetStorage().read<String>('settings.proxy');
    proxy.value = storedProxy ?? '';

    ever(proxy, (_) {
      GetStorage().write('settings.proxy', proxy.value);
    });

    int? storedTimeout = GetStorage().read<int>('settings.timeout');
    timeout.value = storedTimeout ?? 0;

    ever(timeout, (_) {
      GetStorage().write('settings.timeout', timeout.value);
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
}
