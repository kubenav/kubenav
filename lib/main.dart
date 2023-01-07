import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/portforwarding_repository.dart';
import 'package:kubenav/repositories/terminal_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubenav_desktop.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/storage.dart';
import 'package:kubenav/widgets/home/home.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await KubenavDesktop().init();

    setWindowTitle('kubenav');
    setWindowMinSize(const Size(1024, 768));
    setWindowMaxSize(Size.infinite);

    final screen = await getCurrentScreen();
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      size: screen != null
          ? Size(screen.frame.width / 100 * 62, screen.frame.height / 100 * 62)
          : const Size(1024, 768),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  await Storage().init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeRepository()),
        ChangeNotifierProvider(create: (_) => AppRepository()),
        ChangeNotifierProvider(create: (_) => ClustersRepository()),
        ChangeNotifierProvider(create: (_) => BookmarksRepository()),
        ChangeNotifierProvider(create: (_) => PortForwardingRepository()),
        ChangeNotifierProvider(create: (_) => TerminalRepository()),
      ],
      child: const AppMaterialApp(),
    );
  }
}

class AppMaterialApp extends StatelessWidget {
  const AppMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeRepository themeRepository = Provider.of<ThemeRepository>(
      context,
      listen: true,
    );

    final theme = themeRepository.theme;

    return TooltipVisibility(
      visible: false,
      child: MaterialApp(
        title: 'kubenav',
        theme: ThemeData(
          brightness: theme.brightness,
          primaryColor: theme.colorPrimary,
          canvasColor: theme.colorBackground,
          appBarTheme: AppBarTheme(
            backgroundColor: theme.colorPrimary,
            foregroundColor: theme.colorOnPrimary,
            elevation: 0,
          ),
          // cardColor: theme.colorBackground,
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: TextStyle(
              color: theme.colorPrimary,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: theme.colorPrimary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: theme.colorInputDecoration,
              ),
            ),
            labelStyle: TextStyle(
              color: theme.colorInputDecoration,
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: theme.colorPrimary,
            selectionColor: theme.colorPrimary.withOpacity(0.25),
            selectionHandleColor: theme.colorPrimary,
          ),
          // shadowColor: Colors.grey.withOpacity(0.2),
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: theme.colorBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
