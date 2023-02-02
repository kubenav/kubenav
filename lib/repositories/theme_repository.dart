import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/storage.dart';

/// [theme] is a helper function which returns the [ThemeSettings] for the users
/// currently selected team.
ThemeSettings theme(BuildContext context) {
  return Provider.of<ThemeRepository>(
    context,
    listen: false,
  ).theme;
}

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
  ThemeSettings get theme {
    if (_themeName == ThemeName.light) {
      return _lightTheme;
    }

    if (_themeName == ThemeName.dark) {
      return _darkTheme;
    }

    return isDarkTheme() ? _darkTheme : _lightTheme;
  }

  void notify() {
    notifyListeners();
  }
}

/// The [ThemeSettings] model, defines all properties which can be set by a
/// theme. The [ThemeSettings] for each [ThemeName] can be get via the
/// [ThemeRepository.theme] getter.
class ThemeSettings {
  Brightness brightness;

  Color colorPrimary;
  Color colorOnPrimary;
  Color colorBackground;
  Color colorInputDecoration;
  Color colorSuccess;
  Color colorWarning;
  Color colorDanger;
  Color colorTextPrimary;
  Color colorTextSecondary;
  Color colorCard;
  Color colorShadow;
  Color colorMessageBackground;
  Color colorMessageForeground;

  ThemeSettings({
    required this.brightness,
    required this.colorPrimary,
    required this.colorOnPrimary,
    required this.colorBackground,
    required this.colorInputDecoration,
    required this.colorSuccess,
    required this.colorWarning,
    required this.colorDanger,
    required this.colorTextPrimary,
    required this.colorTextSecondary,
    required this.colorCard,
    required this.colorShadow,
    required this.colorMessageBackground,
    required this.colorMessageForeground,
  });
}

final _lightTheme = ThemeSettings(
  brightness: Brightness.light,
  colorPrimary: const Color(0xff326ce5),
  colorOnPrimary: Colors.white,
  colorBackground: Colors.white,
  colorInputDecoration: const Color(0xFF2E3033),
  colorSuccess: Colors.green,
  colorWarning: Colors.yellow,
  colorDanger: Colors.red,
  colorTextPrimary: const Color(0xFF2E3033),
  colorTextSecondary: const Color(0xFF757575),
  colorCard: Colors.white,
  colorShadow: Colors.grey.withOpacity(0.2),
  colorMessageBackground: Colors.black,
  colorMessageForeground: Colors.white,
);

final _darkTheme = ThemeSettings(
  brightness: Brightness.dark,
  colorPrimary: const Color(0xff326ce5),
  colorOnPrimary: Colors.white,
  colorBackground: const Color(0xff22272e),
  colorInputDecoration: const Color(0xffcdd9e5),
  colorSuccess: Colors.green,
  colorWarning: Colors.yellow,
  colorDanger: Colors.red,
  colorTextPrimary: const Color(0xffcdd9e5),
  colorTextSecondary: const Color(0xffadbac7),
  colorCard: const Color(0xff22272e),
  colorShadow: Colors.grey.withOpacity(0.1),
  colorMessageBackground: const Color(0xff2d333b),
  colorMessageForeground: const Color(0xffcdd9e5),
);
