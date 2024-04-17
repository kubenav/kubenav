import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/storage.dart';

/// [ThemeName] is a enum value which contains all available themes for the app.
/// All defined themes must also have a [ThemeSettings] object which is returned
/// for the specified theme name in the [ThemeRepository.theme] getter.
enum ThemeName {
  auto,
  light,
  dark,
}

/// [ResourceScopeExtension] defines all extensions for the [ThemeName] enum
/// value.
extension ResourceScopeExtension on ThemeName {
  /// [toShortString] returns the shortname of an enum value, which can be
  /// stored in our storage and read via the [getThemeNameFromString] function.
  String toShortString() {
    return toString().split('.').last;
  }
}

/// [getThemeNameFromString] returns the [ThemeName] for the provided [theme]
/// value. The [theme] value could be generated via the [toShortString]
/// extension on the enum value.
ThemeName getThemeNameFromString(String? theme) {
  if (theme?.toLowerCase() == 'dark') {
    return ThemeName.dark;
  }

  if (theme?.toLowerCase() == 'light') {
    return ThemeName.light;
  }

  return ThemeName.auto;
}

bool isDarkTheme() {
  return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.dark;
}

/// The [ThemeRepository] handles all theme related function of the app. A users
/// theme changes are handled via the repository and the repository is also
/// responsible for returneing hte correct [ThemeSettings] for the users
/// selected theme.
class ThemeRepository with ChangeNotifier {
  ThemeName _themeName = isDarkTheme() ? ThemeName.dark : ThemeName.light;

  ThemeName get themeName => _themeName;

  /// [setThemeName] sets the provided [value] as theme and saves the changes
  /// in our storage via the [_save] method. Once the value is saved the app
  /// is updated accordingly by calling the [notifyListeners] function.
  Future<void> setThemeName(ThemeName value) async {
    _themeName = value;
    await _save();
    notifyListeners();
  }

  /// [_save] saves the [_themeName] value in our storage.
  Future<void> _save() async {
    try {
      await Storage().write('kubenav-theme', _themeName.toShortString());
    } catch (err) {
      Logger.log(
        'ThemeRepository _save',
        'Could not save theme',
        err,
      );
    }
  }

  /// [init] should be called on the startup of the app, to load the users saved
  /// [_themeName] and to apply the correct theme via the [notifyListeners]
  /// function.
  Future<void> init() async {
    try {
      final data = await Storage().read('kubenav-theme');
      if (data != null) {
        _themeName = getThemeNameFromString(data);
      }

      notifyListeners();
    } catch (err) {
      Logger.log(
        'ThemeRepository _init',
        'Could not load theme',
        err,
      );
    }
  }

  /// [theme] returns the correct [ThemeSettings] for the users selected
  /// [_themeName].
  ThemeMode get themeMode {
    if (_themeName == ThemeName.light) {
      return ThemeMode.light;
    }

    if (_themeName == ThemeName.dark) {
      return ThemeMode.dark;
    }

    return ThemeMode.system;
  }

  void notify() {
    notifyListeners();
  }
}
