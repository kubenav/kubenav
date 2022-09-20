import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_size/window_size.dart';

import 'package:kubenav/controllers/bookmark_controller.dart';
import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/controllers/portforwarding_controller.dart';
import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/controllers/terminal_controller.dart';
import 'package:kubenav/routes/app_pages.dart';
import 'package:kubenav/routes/app_routes.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/ffi.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    KubenavFFI().init();

    final getStoragePath = await getApplicationSupportDirectory();
    await GetStorage('GetStorage', getStoragePath.path).initStorage;
  } else {
    await GetStorage.init();
  }

  Get.put(GlobalSettingsController());
  Get.put(ProviderConfigController());
  Get.put(ClusterController());
  Get.put(BookmarkController());
  Get.put(TerminalController());
  Get.put(PortForwardingController());

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('kubenav');
    setWindowMinSize(const Size(800, 600));
    setWindowMaxSize(Size.infinite);
  }

  FlutterNativeSplash.remove();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalSettingsController globalSettingsController = Get.find();

    return TooltipVisibility(
      visible: false,
      child: GetMaterialApp(
        title: 'kubenav',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: globalSettingsController.isAuthenticationEnabled.value
            ? Routes.login
            : Routes.home,
        getPages: AppPages.pages,
      ),
    );
  }
}
