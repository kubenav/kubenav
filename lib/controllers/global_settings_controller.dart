import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// The [GlobalSettingsController] is responsible for handling user defined settings in the app.
class GlobalSettingsController extends GetxController {
  RxBool isDarkTheme = false.obs;

  /// [onInit] is used to initialize the settings. For that we are looking if the value is already saved in the storage.
  /// If this is the case we are reusing the saved value. If we could not found saved values we are using the default.
  ///
  /// Besides that we are also using the [ever] function so that all changes to the settings are saved back to the
  /// storage.
  @override
  void onInit() {
    bool? storedIsDarkTheme = GetStorage().read<bool>('settings.isDarkTheme');
    isDarkTheme.value = storedIsDarkTheme ?? false;
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);

    ever(isDarkTheme, (_) {
      Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
      GetStorage().write('settings.isDarkTheme', isDarkTheme.value);
    });

    super.onInit();
  }
}
