import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/portforwarding_repository.dart';
import 'package:kubenav/repositories/sponsor_repository.dart';
import 'package:kubenav/repositories/terminal_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/storage.dart';
import 'package:kubenav/widgets/home/home.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Storage().init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SponsorRepository()),
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

class AppMaterialApp extends StatefulWidget {
  const AppMaterialApp({super.key});

  @override
  State<AppMaterialApp> createState() => _AppMaterialAppState();
}

class _AppMaterialAppState extends State<AppMaterialApp> {
  @override
  void initState() {
    super.initState();

    /// Here we have to listen to OS changes to the users selected theme, so
    /// that we can notify all listeners of the [ThemeRepository] when the OS
    /// theme is changed and the user selected the "auto" theme option.
    final window = WidgetsBinding.instance.window;

    window.onPlatformBrightnessChanged = () {
      Provider.of<ThemeRepository>(
        context,
        listen: false,
      ).notify();
    };
  }

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
          cardColor: theme.colorBackground,
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
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
