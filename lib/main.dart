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
import 'package:kubenav/services/kubenav_desktop.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/storage.dart';
import 'package:kubenav/widgets/home/home.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    KubenavDesktop().init();

    setWindowTitle('kubenav');
    setWindowMinSize(const Size(800, 600));
    setWindowMaxSize(Size.infinite);
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
        ChangeNotifierProvider(create: (_) => AppRepository()),
        ChangeNotifierProvider(create: (_) => ClustersRepository()),
        ChangeNotifierProvider(create: (_) => BookmarksRepository()),
        ChangeNotifierProvider(create: (_) => PortForwardingRepository()),
        ChangeNotifierProvider(create: (_) => TerminalRepository()),
      ],
      child: TooltipVisibility(
        visible: false,
        child: MaterialApp(
          title: 'kubenav',
          theme: lightTheme,
          // darkTheme: darkTheme,
          // themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: snackbarKey,
          home: const Home(),
        ),
      ),
    );
  }
}
