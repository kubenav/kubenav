import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:provider/provider.dart';
import 'package:xterm/xterm.dart' as xterm;

import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/storage.dart';

/// [theme] is a helper function which returns the [ThemeSettings] for the users
/// currently selected team.
///
/// NOTE: WE CAN NOT LISTEN TO CHANGES HERE, THIS WILL BREAK ALL OUR CHARTS AND
/// SOME OTHER ACTIONS LIKE DELETING RESOURCES.
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

  Color primary;
  Color onPrimary;
  Color background;
  Color onBackground;
  Color surface;
  Color onSurface;
  Color canvasColor;
  Color error;
  Color onError;
  Color warning;
  Color onWarning;
  Color success;
  Color onSuccess;
  Color textPrimary;
  Color textSecondary;

  Color card;
  Color shadow;
  Color divider;
  Color message;
  Color onMessage;

  Map<String, TextStyle> editorTheme;
  xterm.TerminalTheme terminalTheme;
  List<Color> logsTheme;

  ThemeSettings({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.canvasColor,
    required this.error,
    required this.onError,
    required this.warning,
    required this.onWarning,
    required this.success,
    required this.onSuccess,
    required this.textPrimary,
    required this.textSecondary,
    required this.card,
    required this.shadow,
    required this.divider,
    required this.message,
    required this.onMessage,
    required this.editorTheme,
    required this.terminalTheme,
    required this.logsTheme,
  });
}

final _lightTheme = ThemeSettings(
  brightness: Brightness.light,
  primary: const Color(0xff326ce5),
  onPrimary: Colors.white,
  background: catppuccin.latte.base,
  onBackground: catppuccin.latte.text,
  surface: catppuccin.latte.base,
  onSurface: catppuccin.latte.text,
  canvasColor: catppuccin.latte.base,
  error: catppuccin.latte.red,
  onError: catppuccin.latte.base,
  warning: catppuccin.latte.yellow,
  onWarning: catppuccin.latte.base,
  success: catppuccin.latte.green,
  onSuccess: catppuccin.latte.base,
  textPrimary: catppuccin.latte.text,
  textSecondary: catppuccin.latte.subtext1,
  card: catppuccin.latte.base,
  shadow: catppuccin.latte.crust,
  divider: catppuccin.latte.crust,
  message: catppuccin.latte.text,
  onMessage: catppuccin.latte.base,
  editorTheme: {
    'root': TextStyle(
      backgroundColor: catppuccin.latte.mantle,
      color: catppuccin.latte.text,
    ),
    'subst': TextStyle(color: catppuccin.latte.subtext0),
    'selector-tag': TextStyle(color: catppuccin.latte.yellow),
    'selector-id': TextStyle(color: catppuccin.latte.blue),
    'selector-class': TextStyle(color: catppuccin.latte.teal),
    'selector-attr': TextStyle(color: catppuccin.latte.mauve),
    'selector-pseudo': TextStyle(color: catppuccin.latte.teal),
    'addition': TextStyle(backgroundColor: catppuccin.latte.green),
    'deletion': TextStyle(backgroundColor: catppuccin.latte.red),
    'built_in': TextStyle(color: catppuccin.latte.red),
    'type': TextStyle(color: catppuccin.latte.yellow),
    'class': TextStyle(color: catppuccin.latte.yellow),
    'function': TextStyle(color: catppuccin.latte.blue),
    'keyword': TextStyle(color: catppuccin.latte.mauve),
    'literal': TextStyle(color: catppuccin.latte.peach),
    'symbol': TextStyle(color: catppuccin.latte.flamingo),
    'number': TextStyle(color: catppuccin.latte.peach),
    'regexp': TextStyle(color: catppuccin.latte.pink),
    'string': TextStyle(color: catppuccin.latte.green),
    'title': TextStyle(color: catppuccin.latte.blue),
    'params': TextStyle(color: catppuccin.latte.text),
    'bullet': TextStyle(color: catppuccin.latte.teal),
    'code': TextStyle(color: catppuccin.latte.green),
    'emphasis': TextStyle(color: catppuccin.latte.red),
    'formula': TextStyle(color: catppuccin.latte.teal),
    'strong': TextStyle(color: catppuccin.latte.red),
    'quote': TextStyle(color: catppuccin.latte.green),
    'comment': TextStyle(color: catppuccin.latte.surface2),
    'doctag': TextStyle(color: catppuccin.latte.red),
    'meta': TextStyle(color: catppuccin.latte.peach),
    'meta-keyword': TextStyle(color: catppuccin.latte.mauve),
    'meta-string': TextStyle(color: catppuccin.latte.green),
    'attr': TextStyle(color: catppuccin.latte.blue),
    'attribute': TextStyle(color: catppuccin.latte.green),
    'builtin-name': TextStyle(color: catppuccin.latte.mauve),
    'name': TextStyle(color: catppuccin.latte.mauve),
    'section': TextStyle(color: catppuccin.latte.blue),
    'tag': TextStyle(color: catppuccin.latte.subtext0),
    'variable': TextStyle(color: catppuccin.latte.mauve),
    'template-variable': TextStyle(color: catppuccin.latte.flamingo),
    'template-tag': TextStyle(color: catppuccin.latte.flamingo),
  },
  terminalTheme: xterm.TerminalTheme(
    cursor: catppuccin.latte.rosewater,
    selection: catppuccin.latte.rosewater.withOpacity(0.5),
    foreground: catppuccin.latte.text,
    background: catppuccin.latte.mantle,
    black: catppuccin.latte.surface1,
    red: catppuccin.latte.red,
    green: catppuccin.latte.green,
    yellow: catppuccin.latte.yellow,
    blue: catppuccin.latte.blue,
    magenta: catppuccin.latte.pink,
    cyan: catppuccin.latte.teal,
    white: catppuccin.latte.subtext1,
    brightBlack: catppuccin.latte.surface2,
    brightRed: catppuccin.latte.red,
    brightGreen: catppuccin.latte.green,
    brightYellow: catppuccin.latte.yellow,
    brightBlue: catppuccin.latte.blue,
    brightMagenta: catppuccin.latte.pink,
    brightCyan: catppuccin.latte.teal,
    brightWhite: catppuccin.latte.subtext0,
    searchHitBackground: catppuccin.latte.subtext0,
    searchHitBackgroundCurrent: catppuccin.latte.green,
    searchHitForeground: catppuccin.latte.mantle,
  ),
  logsTheme: [
    catppuccin.latte.text,
    catppuccin.latte.blue,
    catppuccin.latte.red,
    catppuccin.latte.green,
    catppuccin.latte.yellow,
    catppuccin.latte.teal,
    catppuccin.latte.lavender,
    catppuccin.latte.maroon,
    catppuccin.latte.teal,
    catppuccin.latte.peach,
  ],
);

final _darkTheme = ThemeSettings(
  brightness: Brightness.dark,
  primary: const Color(0xff326ce5),
  onPrimary: Colors.white,
  background: catppuccin.macchiato.base,
  onBackground: catppuccin.macchiato.text,
  surface: catppuccin.macchiato.base,
  onSurface: catppuccin.macchiato.text,
  canvasColor: catppuccin.macchiato.base,
  error: catppuccin.macchiato.red,
  onError: catppuccin.macchiato.text,
  warning: catppuccin.macchiato.yellow,
  onWarning: catppuccin.macchiato.text,
  success: catppuccin.macchiato.green,
  onSuccess: catppuccin.macchiato.text,
  textPrimary: catppuccin.macchiato.text,
  textSecondary: catppuccin.macchiato.subtext1,
  card: catppuccin.macchiato.base,
  shadow: catppuccin.macchiato.mantle,
  divider: catppuccin.macchiato.mantle,
  message: catppuccin.macchiato.surface2,
  onMessage: catppuccin.macchiato.text,
  editorTheme: {
    'root': TextStyle(
      backgroundColor: catppuccin.macchiato.mantle,
      color: catppuccin.macchiato.text,
    ),
    'subst': TextStyle(color: catppuccin.macchiato.subtext0),
    'selector-tag': TextStyle(color: catppuccin.macchiato.yellow),
    'selector-id': TextStyle(color: catppuccin.macchiato.blue),
    'selector-class': TextStyle(color: catppuccin.macchiato.teal),
    'selector-attr': TextStyle(color: catppuccin.macchiato.mauve),
    'selector-pseudo': TextStyle(color: catppuccin.macchiato.teal),
    'addition': TextStyle(backgroundColor: catppuccin.macchiato.green),
    'deletion': TextStyle(backgroundColor: catppuccin.macchiato.red),
    'built_in': TextStyle(color: catppuccin.macchiato.red),
    'type': TextStyle(color: catppuccin.macchiato.yellow),
    'class': TextStyle(color: catppuccin.macchiato.yellow),
    'function': TextStyle(color: catppuccin.macchiato.blue),
    'keyword': TextStyle(color: catppuccin.macchiato.mauve),
    'literal': TextStyle(color: catppuccin.macchiato.peach),
    'symbol': TextStyle(color: catppuccin.macchiato.flamingo),
    'number': TextStyle(color: catppuccin.macchiato.peach),
    'regexp': TextStyle(color: catppuccin.macchiato.pink),
    'string': TextStyle(color: catppuccin.macchiato.green),
    'title': TextStyle(color: catppuccin.macchiato.blue),
    'params': TextStyle(color: catppuccin.macchiato.text),
    'bullet': TextStyle(color: catppuccin.macchiato.teal),
    'code': TextStyle(color: catppuccin.macchiato.green),
    'emphasis': TextStyle(color: catppuccin.macchiato.red),
    'formula': TextStyle(color: catppuccin.macchiato.teal),
    'strong': TextStyle(color: catppuccin.macchiato.red),
    'quote': TextStyle(color: catppuccin.macchiato.green),
    'comment': TextStyle(color: catppuccin.macchiato.surface2),
    'doctag': TextStyle(color: catppuccin.macchiato.red),
    'meta': TextStyle(color: catppuccin.macchiato.peach),
    'meta-keyword': TextStyle(color: catppuccin.macchiato.mauve),
    'meta-string': TextStyle(color: catppuccin.macchiato.green),
    'attr': TextStyle(color: catppuccin.macchiato.blue),
    'attribute': TextStyle(color: catppuccin.macchiato.green),
    'builtin-name': TextStyle(color: catppuccin.macchiato.mauve),
    'name': TextStyle(color: catppuccin.macchiato.mauve),
    'section': TextStyle(color: catppuccin.macchiato.blue),
    'tag': TextStyle(color: catppuccin.macchiato.subtext0),
    'variable': TextStyle(color: catppuccin.macchiato.mauve),
    'template-variable': TextStyle(color: catppuccin.macchiato.flamingo),
    'template-tag': TextStyle(color: catppuccin.macchiato.flamingo),
  },
  terminalTheme: xterm.TerminalTheme(
    cursor: catppuccin.macchiato.rosewater,
    selection: catppuccin.macchiato.rosewater.withOpacity(0.5),
    foreground: catppuccin.macchiato.text,
    background: catppuccin.macchiato.mantle,
    black: catppuccin.macchiato.surface1,
    red: catppuccin.macchiato.red,
    green: catppuccin.macchiato.green,
    yellow: catppuccin.macchiato.yellow,
    blue: catppuccin.macchiato.blue,
    magenta: catppuccin.macchiato.pink,
    cyan: catppuccin.macchiato.teal,
    white: catppuccin.macchiato.subtext1,
    brightBlack: catppuccin.macchiato.surface2,
    brightRed: catppuccin.macchiato.red,
    brightGreen: catppuccin.macchiato.green,
    brightYellow: catppuccin.macchiato.yellow,
    brightBlue: catppuccin.macchiato.blue,
    brightMagenta: catppuccin.macchiato.pink,
    brightCyan: catppuccin.macchiato.teal,
    brightWhite: catppuccin.macchiato.subtext0,
    searchHitBackground: catppuccin.macchiato.subtext0,
    searchHitBackgroundCurrent: catppuccin.macchiato.green,
    searchHitForeground: catppuccin.macchiato.mantle,
  ),
  logsTheme: [
    catppuccin.macchiato.text,
    catppuccin.macchiato.blue,
    catppuccin.macchiato.red,
    catppuccin.macchiato.green,
    catppuccin.macchiato.yellow,
    catppuccin.macchiato.teal,
    catppuccin.macchiato.lavender,
    catppuccin.macchiato.maroon,
    catppuccin.macchiato.teal,
    catppuccin.macchiato.peach,
  ],
);
