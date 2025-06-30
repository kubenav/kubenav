import 'package:flutter/material.dart';

import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:xterm/xterm.dart' as xterm;

/// [CustomColors] defines some custom colors which can be used across the app.
/// The [CustomColors] class can be used as [ThemeExtension] in the theme.
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.error,
    required this.warning,
    required this.success,
    required this.textPrimary,
    required this.textSecondary,
    required this.shadow,
    required this.message,
    required this.onMessage,
  });

  final Color error;
  final Color warning;
  final Color success;
  final Color textPrimary;
  final Color textSecondary;
  final Color shadow;
  final Color message;
  final Color onMessage;

  @override
  CustomColors copyWith({
    Color? error,
    Color? warning,
    Color? success,
    Color? textPrimary,
    Color? textSecondary,
    Color? shadow,
    Color? message,
    Color? onMessage,
  }) {
    return CustomColors(
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      shadow: shadow ?? this.shadow,
      message: message ?? this.message,
      onMessage: onMessage ?? this.onMessage,
    );
  }

  @override
  CustomColors lerp(CustomColors? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      error: Color.lerp(error, other.error, t) ?? error,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      success: Color.lerp(success, other.success, t) ?? success,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary:
          Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      shadow: Color.lerp(shadow, other.shadow, t) ?? shadow,
      message: Color.lerp(message, other.message, t) ?? message,
      onMessage: Color.lerp(onMessage, other.onMessage, t) ?? onMessage,
    );
  }
}

/// [TerminalColors] defines the colors for the terminal. To use the colors with
/// the `xterm` packge the [getTheme] method can be used.
class TerminalColors extends ThemeExtension<TerminalColors> {
  const TerminalColors({
    required this.cursor,
    required this.selection,
    required this.foreground,
    required this.background,
    required this.black,
    required this.red,
    required this.green,
    required this.yellow,
    required this.blue,
    required this.magenta,
    required this.cyan,
    required this.white,
    required this.brightBlack,
    required this.brightRed,
    required this.brightGreen,
    required this.brightYellow,
    required this.brightBlue,
    required this.brightMagenta,
    required this.brightCyan,
    required this.brightWhite,
    required this.searchHitBackground,
    required this.searchHitBackgroundCurrent,
    required this.searchHitForeground,
  });

  final Color cursor;
  final Color selection;
  final Color foreground;
  final Color background;
  final Color black;
  final Color red;
  final Color green;
  final Color yellow;
  final Color blue;
  final Color magenta;
  final Color cyan;
  final Color white;
  final Color brightBlack;
  final Color brightRed;
  final Color brightGreen;
  final Color brightYellow;
  final Color brightBlue;
  final Color brightMagenta;
  final Color brightCyan;
  final Color brightWhite;
  final Color searchHitBackground;
  final Color searchHitBackgroundCurrent;
  final Color searchHitForeground;

  @override
  TerminalColors copyWith({
    Color? cursor,
    Color? selection,
    Color? foreground,
    Color? background,
    Color? black,
    Color? red,
    Color? green,
    Color? yellow,
    Color? blue,
    Color? magenta,
    Color? cyan,
    Color? white,
    Color? brightBlack,
    Color? brightRed,
    Color? brightGreen,
    Color? brightYellow,
    Color? brightBlue,
    Color? brightMagenta,
    Color? brightCyan,
    Color? brightWhite,
    Color? searchHitBackground,
    Color? searchHitBackgroundCurrent,
    Color? searchHitForeground,
  }) {
    return TerminalColors(
      cursor: cursor ?? this.cursor,
      selection: selection ?? this.selection,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      black: black ?? this.black,
      red: red ?? this.red,
      green: green ?? this.green,
      yellow: yellow ?? this.yellow,
      blue: blue ?? this.blue,
      magenta: magenta ?? this.magenta,
      cyan: cyan ?? this.cyan,
      white: white ?? this.white,
      brightBlack: brightBlack ?? this.brightBlack,
      brightRed: brightRed ?? this.brightRed,
      brightGreen: brightGreen ?? this.brightGreen,
      brightYellow: brightYellow ?? this.brightYellow,
      brightBlue: brightBlue ?? this.brightBlue,
      brightMagenta: brightMagenta ?? this.brightMagenta,
      brightCyan: brightCyan ?? this.brightCyan,
      brightWhite: brightWhite ?? this.brightWhite,
      searchHitBackground: searchHitBackground ?? this.searchHitBackground,
      searchHitBackgroundCurrent:
          searchHitBackgroundCurrent ?? this.searchHitBackgroundCurrent,
      searchHitForeground: searchHitForeground ?? this.searchHitForeground,
    );
  }

  @override
  TerminalColors lerp(TerminalColors? other, double t) {
    if (other is! TerminalColors) {
      return this;
    }
    return TerminalColors(
      cursor: Color.lerp(cursor, other.cursor, t) ?? cursor,
      selection: Color.lerp(selection, other.selection, t) ?? selection,
      foreground: Color.lerp(foreground, other.foreground, t) ?? foreground,
      background: Color.lerp(background, other.background, t) ?? background,
      black: Color.lerp(black, other.black, t) ?? black,
      red: Color.lerp(red, other.red, t) ?? red,
      green: Color.lerp(green, other.green, t) ?? green,
      yellow: Color.lerp(yellow, other.yellow, t) ?? yellow,
      blue: Color.lerp(blue, other.blue, t) ?? blue,
      magenta: Color.lerp(magenta, other.magenta, t) ?? magenta,
      cyan: Color.lerp(cyan, other.cyan, t) ?? cyan,
      white: Color.lerp(white, other.white, t) ?? white,
      brightBlack: Color.lerp(brightBlack, other.brightBlack, t) ?? brightBlack,
      brightRed: Color.lerp(brightRed, other.brightRed, t) ?? brightRed,
      brightGreen: Color.lerp(brightGreen, other.brightGreen, t) ?? brightGreen,
      brightYellow:
          Color.lerp(brightYellow, other.brightYellow, t) ?? brightYellow,
      brightBlue: Color.lerp(brightBlue, other.brightBlue, t) ?? brightBlue,
      brightMagenta:
          Color.lerp(brightMagenta, other.brightMagenta, t) ?? brightMagenta,
      brightCyan: Color.lerp(brightCyan, other.brightCyan, t) ?? brightCyan,
      brightWhite: Color.lerp(brightWhite, other.brightWhite, t) ?? brightWhite,
      searchHitBackground:
          Color.lerp(searchHitBackground, other.searchHitBackground, t) ??
          searchHitBackground,
      searchHitBackgroundCurrent:
          Color.lerp(
            searchHitBackgroundCurrent,
            other.searchHitBackgroundCurrent,
            t,
          ) ??
          searchHitBackgroundCurrent,
      searchHitForeground:
          Color.lerp(searchHitForeground, other.searchHitForeground, t) ??
          searchHitForeground,
    );
  }

  xterm.TerminalTheme getTheme() {
    return xterm.TerminalTheme(
      cursor: cursor,
      selection: selection,
      foreground: foreground,
      background: background,
      black: black,
      red: red,
      green: green,
      yellow: yellow,
      blue: blue,
      magenta: magenta,
      cyan: cyan,
      white: white,
      brightBlack: brightBlack,
      brightRed: brightRed,
      brightGreen: brightGreen,
      brightYellow: brightYellow,
      brightBlue: brightBlue,
      brightMagenta: brightMagenta,
      brightCyan: brightCyan,
      brightWhite: brightWhite,
      searchHitBackground: searchHitBackground,
      searchHitBackgroundCurrent: searchHitBackgroundCurrent,
      searchHitForeground: searchHitForeground,
    );
  }
}

/// [EditorColors] defines the colors for the terminal. To use the colors with
/// the [getTheme] method can be used.
class EditorColors extends ThemeExtension<EditorColors> {
  const EditorColors({
    required this.rootBackground,
    required this.rootForeground,
    required this.subst,
    required this.selectortag,
    required this.selectorid,
    required this.selectorclass,
    required this.selectorattr,
    required this.selectorpseudo,
    required this.addition,
    required this.deletion,
    required this.builtin,
    required this.typeColor,
    required this.classColor,
    required this.function,
    required this.keyword,
    required this.literal,
    required this.symbol,
    required this.number,
    required this.regexp,
    required this.string,
    required this.title,
    required this.params,
    required this.bullet,
    required this.code,
    required this.emphasis,
    required this.formula,
    required this.strong,
    required this.quote,
    required this.comment,
    required this.doctag,
    required this.meta,
    required this.metakeyword,
    required this.metastring,
    required this.attr,
    required this.attribute,
    required this.builtinname,
    required this.name,
    required this.section,
    required this.tag,
    required this.variable,
    required this.templatevariable,
    required this.templatetag,
  });

  final Color rootBackground;
  final Color rootForeground;
  final Color subst;
  final Color selectortag;
  final Color selectorid;
  final Color selectorclass;
  final Color selectorattr;
  final Color selectorpseudo;
  final Color addition;
  final Color deletion;
  final Color builtin;
  final Color typeColor;
  final Color classColor;
  final Color function;
  final Color keyword;
  final Color literal;
  final Color symbol;
  final Color number;
  final Color regexp;
  final Color string;
  final Color title;
  final Color params;
  final Color bullet;
  final Color code;
  final Color emphasis;
  final Color formula;
  final Color strong;
  final Color quote;
  final Color comment;
  final Color doctag;
  final Color meta;
  final Color metakeyword;
  final Color metastring;
  final Color attr;
  final Color attribute;
  final Color builtinname;
  final Color name;
  final Color section;
  final Color tag;
  final Color variable;
  final Color templatevariable;
  final Color templatetag;

  @override
  EditorColors copyWith({
    Color? rootBackground,
    Color? rootForeground,
    Color? subst,
    Color? selectortag,
    Color? selectorid,
    Color? selectorclass,
    Color? selectorattr,
    Color? selectorpseudo,
    Color? addition,
    Color? deletion,
    Color? builtin,
    Color? typeColor,
    Color? classColor,
    Color? function,
    Color? keyword,
    Color? literal,
    Color? symbol,
    Color? number,
    Color? regexp,
    Color? string,
    Color? title,
    Color? params,
    Color? bullet,
    Color? code,
    Color? emphasis,
    Color? formula,
    Color? strong,
    Color? quote,
    Color? comment,
    Color? doctag,
    Color? meta,
    Color? metakeyword,
    Color? metastring,
    Color? attr,
    Color? attribute,
    Color? builtinname,
    Color? name,
    Color? section,
    Color? tag,
    Color? variable,
    Color? templatevariable,
    Color? templatetag,
  }) {
    return EditorColors(
      rootBackground: rootBackground ?? this.rootBackground,
      rootForeground: rootForeground ?? this.rootForeground,
      subst: subst ?? this.subst,
      selectortag: selectortag ?? this.selectortag,
      selectorid: selectorid ?? this.selectorid,
      selectorclass: selectorclass ?? this.selectorclass,
      selectorattr: selectorattr ?? this.selectorattr,
      selectorpseudo: selectorpseudo ?? this.selectorpseudo,
      addition: addition ?? this.addition,
      deletion: deletion ?? this.deletion,
      builtin: builtin ?? this.builtin,
      typeColor: typeColor ?? this.typeColor,
      classColor: classColor ?? this.classColor,
      function: function ?? this.function,
      keyword: keyword ?? this.keyword,
      literal: literal ?? this.literal,
      symbol: symbol ?? this.symbol,
      number: number ?? this.number,
      regexp: regexp ?? this.regexp,
      string: string ?? this.string,
      title: title ?? this.title,
      params: params ?? this.params,
      bullet: bullet ?? this.bullet,
      code: code ?? this.code,
      emphasis: emphasis ?? this.emphasis,
      formula: formula ?? this.formula,
      strong: strong ?? this.strong,
      quote: quote ?? this.quote,
      comment: comment ?? this.comment,
      doctag: doctag ?? this.doctag,
      meta: meta ?? this.meta,
      metakeyword: metakeyword ?? this.metakeyword,
      metastring: metastring ?? this.metastring,
      attr: attr ?? this.attr,
      attribute: attribute ?? this.attribute,
      builtinname: builtinname ?? this.builtinname,
      name: name ?? this.name,
      section: section ?? this.section,
      tag: tag ?? this.tag,
      variable: variable ?? this.variable,
      templatevariable: templatevariable ?? this.templatevariable,
      templatetag: templatetag ?? this.templatetag,
    );
  }

  @override
  EditorColors lerp(EditorColors? other, double t) {
    if (other is! EditorColors) {
      return this;
    }
    return EditorColors(
      rootBackground:
          Color.lerp(rootBackground, other.rootBackground, t) ?? rootBackground,
      rootForeground:
          Color.lerp(rootForeground, other.rootForeground, t) ?? rootForeground,
      subst: Color.lerp(subst, other.subst, t) ?? subst,
      selectortag: Color.lerp(selectortag, other.selectortag, t) ?? selectortag,
      selectorid: Color.lerp(selectorid, other.selectorid, t) ?? selectorid,
      selectorclass:
          Color.lerp(selectorclass, other.selectorclass, t) ?? selectorclass,
      selectorattr:
          Color.lerp(selectorattr, other.selectorattr, t) ?? selectorattr,
      selectorpseudo:
          Color.lerp(selectorpseudo, other.selectorpseudo, t) ?? selectorpseudo,
      addition: Color.lerp(addition, other.addition, t) ?? addition,
      deletion: Color.lerp(deletion, other.deletion, t) ?? deletion,
      builtin: Color.lerp(builtin, other.builtin, t) ?? builtin,
      typeColor: Color.lerp(typeColor, other.typeColor, t) ?? typeColor,
      classColor: Color.lerp(classColor, other.classColor, t) ?? classColor,
      function: Color.lerp(function, other.function, t) ?? function,
      keyword: Color.lerp(keyword, other.keyword, t) ?? keyword,
      literal: Color.lerp(literal, other.literal, t) ?? literal,
      symbol: Color.lerp(symbol, other.symbol, t) ?? symbol,
      number: Color.lerp(number, other.number, t) ?? number,
      regexp: Color.lerp(regexp, other.regexp, t) ?? regexp,
      string: Color.lerp(string, other.string, t) ?? string,
      title: Color.lerp(title, other.title, t) ?? title,
      params: Color.lerp(params, other.params, t) ?? params,
      bullet: Color.lerp(bullet, other.bullet, t) ?? bullet,
      code: Color.lerp(code, other.code, t) ?? code,
      emphasis: Color.lerp(emphasis, other.emphasis, t) ?? emphasis,
      formula: Color.lerp(formula, other.formula, t) ?? formula,
      strong: Color.lerp(strong, other.strong, t) ?? strong,
      quote: Color.lerp(quote, other.quote, t) ?? quote,
      comment: Color.lerp(comment, other.comment, t) ?? comment,
      doctag: Color.lerp(doctag, other.doctag, t) ?? doctag,
      meta: Color.lerp(meta, other.meta, t) ?? meta,
      metakeyword: Color.lerp(metakeyword, other.metakeyword, t) ?? metakeyword,
      metastring: Color.lerp(metastring, other.metastring, t) ?? metastring,
      attr: Color.lerp(attr, other.attr, t) ?? attr,
      attribute: Color.lerp(attribute, other.attribute, t) ?? attribute,
      builtinname: Color.lerp(builtinname, other.builtinname, t) ?? builtinname,
      name: Color.lerp(name, other.name, t) ?? name,
      section: Color.lerp(section, other.section, t) ?? section,
      tag: Color.lerp(tag, other.tag, t) ?? tag,
      variable: Color.lerp(variable, other.variable, t) ?? variable,
      templatevariable:
          Color.lerp(templatevariable, other.templatevariable, t) ??
          templatevariable,
      templatetag: Color.lerp(templatetag, other.templatetag, t) ?? templatetag,
    );
  }

  Map<String, TextStyle> getTheme() {
    return {
      'root': TextStyle(backgroundColor: rootBackground, color: rootForeground),
      'subst': TextStyle(color: subst),
      'selector-tag': TextStyle(color: selectortag),
      'selector-id': TextStyle(color: selectorid),
      'selector-class': TextStyle(color: selectorclass),
      'selector-attr': TextStyle(color: selectorattr),
      'selector-pseudo': TextStyle(color: selectorpseudo),
      'addition': TextStyle(backgroundColor: addition),
      'deletion': TextStyle(backgroundColor: deletion),
      'built_in': TextStyle(color: builtin),
      'type': TextStyle(color: typeColor),
      'class': TextStyle(color: classColor),
      'function': TextStyle(color: function),
      'keyword': TextStyle(color: keyword),
      'literal': TextStyle(color: literal),
      'symbol': TextStyle(color: symbol),
      'number': TextStyle(color: number),
      'regexp': TextStyle(color: regexp),
      'string': TextStyle(color: string),
      'title': TextStyle(color: title),
      'params': TextStyle(color: params),
      'bullet': TextStyle(color: bullet),
      'code': TextStyle(color: code),
      'emphasis': TextStyle(color: emphasis),
      'formula': TextStyle(color: formula),
      'strong': TextStyle(color: strong),
      'quote': TextStyle(color: quote),
      'comment': TextStyle(color: comment),
      'doctag': TextStyle(color: doctag),
      'meta': TextStyle(color: meta),
      'meta-keyword': TextStyle(color: metakeyword),
      'meta-string': TextStyle(color: metastring),
      'attr': TextStyle(color: attr),
      'attribute': TextStyle(color: attribute),
      'builtin-name': TextStyle(color: builtinname),
      'name': TextStyle(color: name),
      'section': TextStyle(color: section),
      'tag': TextStyle(color: tag),
      'variable': TextStyle(color: variable),
      'template-variable': TextStyle(color: templatevariable),
      'template-tag': TextStyle(color: templatetag),
    };
  }
}

/// [LogColors] defines the colors for the logs. To use the colors with the
/// [getTheme] method can be used.
class LogColors extends ThemeExtension<LogColors> {
  const LogColors({
    required this.text,
    required this.blue,
    required this.red,
    required this.green,
    required this.yellow,
    required this.teal,
    required this.lavender,
    required this.maroon,
    required this.sky,
    required this.peach,
  });

  final Color text;
  final Color blue;
  final Color red;
  final Color green;
  final Color yellow;
  final Color teal;
  final Color lavender;
  final Color maroon;
  final Color sky;
  final Color peach;

  @override
  LogColors copyWith({
    Color? text,
    Color? blue,
    Color? red,
    Color? green,
    Color? yellow,
    Color? teal,
    Color? lavender,
    Color? maroon,
    Color? sky,
    Color? peach,
  }) {
    return LogColors(
      text: text ?? this.text,
      blue: blue ?? this.blue,
      red: red ?? this.red,
      green: green ?? this.green,
      yellow: yellow ?? this.yellow,
      teal: teal ?? this.teal,
      lavender: lavender ?? this.lavender,
      maroon: maroon ?? this.maroon,
      sky: sky ?? this.sky,
      peach: peach ?? this.peach,
    );
  }

  @override
  LogColors lerp(LogColors? other, double t) {
    if (other is! LogColors) {
      return this;
    }
    return LogColors(
      text: Color.lerp(text, other.text, t) ?? text,
      blue: Color.lerp(blue, other.blue, t) ?? blue,
      red: Color.lerp(red, other.red, t) ?? red,
      green: Color.lerp(green, other.green, t) ?? green,
      yellow: Color.lerp(yellow, other.yellow, t) ?? yellow,
      teal: Color.lerp(teal, other.teal, t) ?? teal,
      lavender: Color.lerp(lavender, other.lavender, t) ?? lavender,
      maroon: Color.lerp(maroon, other.maroon, t) ?? maroon,
      sky: Color.lerp(sky, other.sky, t) ?? sky,
      peach: Color.lerp(peach, other.peach, t) ?? peach,
    );
  }

  List<Color> getTheme() {
    return [text, blue, red, green, yellow, teal, lavender, maroon, sky, peach];
  }
}

/// [lightTheme] defines the light theme for the app.
final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0xff326ce5),
    onPrimary: Colors.white,
    secondary: const Color(0xff326ce5),
    onSecondary: Colors.white,
    error: catppuccin.latte.red,
    onError: Colors.white,
    surface: catppuccin.latte.base,
    onSurface: catppuccin.latte.text,
  ),
  canvasColor: catppuccin.latte.base,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff326ce5),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: catppuccin.latte.base,
    contentTextStyle: TextStyle(color: catppuccin.latte.text),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: catppuccin.latte.base,
    surfaceTintColor: catppuccin.latte.base,
    contentTextStyle: TextStyle(color: catppuccin.latte.text),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: catppuccin.latte.base,
    surfaceTintColor: catppuccin.latte.base,
    textStyle: TextStyle(color: catppuccin.latte.text),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: catppuccin.latte.base,
    surfaceTintColor: catppuccin.latte.base,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: catppuccin.latte.base,
    surfaceTintColor: catppuccin.latte.base,
  ),
  dividerColor: catppuccin.latte.crust,
  dividerTheme: DividerThemeData(color: catppuccin.latte.crust),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  extensions: <ThemeExtension<dynamic>>[
    CustomColors(
      error: catppuccin.latte.red,
      warning: catppuccin.latte.yellow,
      success: catppuccin.latte.green,
      textPrimary: catppuccin.latte.text,
      textSecondary: catppuccin.latte.subtext1,
      shadow: catppuccin.latte.crust,
      message: catppuccin.latte.text,
      onMessage: catppuccin.latte.base,
    ),
    TerminalColors(
      cursor: catppuccin.latte.rosewater,
      selection: catppuccin.latte.rosewater.withValues(alpha: 0.5),
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
    EditorColors(
      rootBackground: catppuccin.latte.mantle,
      rootForeground: catppuccin.latte.text,
      subst: catppuccin.latte.subtext0,
      selectortag: catppuccin.latte.yellow,
      selectorid: catppuccin.latte.blue,
      selectorclass: catppuccin.latte.teal,
      selectorattr: catppuccin.latte.mauve,
      selectorpseudo: catppuccin.latte.teal,
      addition: catppuccin.latte.green,
      deletion: catppuccin.latte.red,
      builtin: catppuccin.latte.red,
      typeColor: catppuccin.latte.yellow,
      classColor: catppuccin.latte.yellow,
      function: catppuccin.latte.blue,
      keyword: catppuccin.latte.mauve,
      literal: catppuccin.latte.peach,
      symbol: catppuccin.latte.flamingo,
      number: catppuccin.latte.peach,
      regexp: catppuccin.latte.pink,
      string: catppuccin.latte.green,
      title: catppuccin.latte.blue,
      params: catppuccin.latte.text,
      bullet: catppuccin.latte.teal,
      code: catppuccin.latte.green,
      emphasis: catppuccin.latte.red,
      formula: catppuccin.latte.teal,
      strong: catppuccin.latte.red,
      quote: catppuccin.latte.green,
      comment: catppuccin.latte.surface2,
      doctag: catppuccin.latte.red,
      meta: catppuccin.latte.peach,
      metakeyword: catppuccin.latte.mauve,
      metastring: catppuccin.latte.green,
      attr: catppuccin.latte.blue,
      attribute: catppuccin.latte.green,
      builtinname: catppuccin.latte.mauve,
      name: catppuccin.latte.mauve,
      section: catppuccin.latte.blue,
      tag: catppuccin.latte.subtext0,
      variable: catppuccin.latte.mauve,
      templatevariable: catppuccin.latte.flamingo,
      templatetag: catppuccin.latte.flamingo,
    ),
    LogColors(
      text: catppuccin.latte.text,
      blue: catppuccin.latte.blue,
      red: catppuccin.latte.red,
      green: catppuccin.latte.green,
      yellow: catppuccin.latte.yellow,
      teal: catppuccin.latte.teal,
      lavender: catppuccin.latte.lavender,
      maroon: catppuccin.latte.maroon,
      sky: catppuccin.latte.sky,
      peach: catppuccin.latte.peach,
    ),
  ],
);

/// [darkTheme] defines the dark theme for the app.
final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0xff326ce5),
    onPrimary: Colors.white,
    secondary: const Color(0xff326ce5),
    onSecondary: Colors.white,
    error: catppuccin.macchiato.red,
    onError: Colors.white,
    surface: catppuccin.macchiato.base,
    onSurface: catppuccin.macchiato.text,
  ),
  canvasColor: catppuccin.macchiato.base,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff326ce5),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: catppuccin.macchiato.base,
    contentTextStyle: TextStyle(color: catppuccin.macchiato.text),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: catppuccin.macchiato.base,
    surfaceTintColor: catppuccin.macchiato.base,
    contentTextStyle: TextStyle(color: catppuccin.macchiato.text),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: catppuccin.macchiato.base,
    surfaceTintColor: catppuccin.macchiato.base,
    textStyle: TextStyle(color: catppuccin.macchiato.text),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: catppuccin.macchiato.base,
    surfaceTintColor: catppuccin.macchiato.base,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: catppuccin.macchiato.base,
    surfaceTintColor: catppuccin.macchiato.base,
  ),
  dividerColor: catppuccin.macchiato.mantle,
  dividerTheme: DividerThemeData(color: catppuccin.macchiato.mantle),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  extensions: <ThemeExtension<dynamic>>[
    CustomColors(
      error: catppuccin.macchiato.red,
      warning: catppuccin.macchiato.yellow,
      success: catppuccin.macchiato.green,
      textPrimary: catppuccin.macchiato.text,
      textSecondary: catppuccin.macchiato.subtext1,
      shadow: catppuccin.macchiato.mantle,
      message: catppuccin.macchiato.surface2,
      onMessage: catppuccin.macchiato.text,
    ),
    TerminalColors(
      cursor: catppuccin.macchiato.rosewater,
      selection: catppuccin.macchiato.rosewater.withValues(alpha: 0.5),
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
    EditorColors(
      rootBackground: catppuccin.macchiato.mantle,
      rootForeground: catppuccin.macchiato.text,
      subst: catppuccin.macchiato.subtext0,
      selectortag: catppuccin.macchiato.yellow,
      selectorid: catppuccin.macchiato.blue,
      selectorclass: catppuccin.macchiato.teal,
      selectorattr: catppuccin.macchiato.mauve,
      selectorpseudo: catppuccin.macchiato.teal,
      addition: catppuccin.macchiato.green,
      deletion: catppuccin.macchiato.red,
      builtin: catppuccin.macchiato.red,
      typeColor: catppuccin.macchiato.yellow,
      classColor: catppuccin.macchiato.yellow,
      function: catppuccin.macchiato.blue,
      keyword: catppuccin.macchiato.mauve,
      literal: catppuccin.macchiato.peach,
      symbol: catppuccin.macchiato.flamingo,
      number: catppuccin.macchiato.peach,
      regexp: catppuccin.macchiato.pink,
      string: catppuccin.macchiato.green,
      title: catppuccin.macchiato.blue,
      params: catppuccin.macchiato.text,
      bullet: catppuccin.macchiato.teal,
      code: catppuccin.macchiato.green,
      emphasis: catppuccin.macchiato.red,
      formula: catppuccin.macchiato.teal,
      strong: catppuccin.macchiato.red,
      quote: catppuccin.macchiato.green,
      comment: catppuccin.macchiato.surface2,
      doctag: catppuccin.macchiato.red,
      meta: catppuccin.macchiato.peach,
      metakeyword: catppuccin.macchiato.mauve,
      metastring: catppuccin.macchiato.green,
      attr: catppuccin.macchiato.blue,
      attribute: catppuccin.macchiato.green,
      builtinname: catppuccin.macchiato.mauve,
      name: catppuccin.macchiato.mauve,
      section: catppuccin.macchiato.blue,
      tag: catppuccin.macchiato.subtext0,
      variable: catppuccin.macchiato.mauve,
      templatevariable: catppuccin.macchiato.flamingo,
      templatetag: catppuccin.macchiato.flamingo,
    ),
    LogColors(
      text: catppuccin.macchiato.text,
      blue: catppuccin.macchiato.blue,
      red: catppuccin.macchiato.red,
      green: catppuccin.macchiato.green,
      yellow: catppuccin.macchiato.yellow,
      teal: catppuccin.macchiato.teal,
      lavender: catppuccin.macchiato.lavender,
      maroon: catppuccin.macchiato.maroon,
      sky: catppuccin.macchiato.sky,
      peach: catppuccin.macchiato.peach,
    ),
  ],
);
