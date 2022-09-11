import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:kubenav/controllers/bookmark_controller.dart';
import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/controllers/portforwarding_controller.dart';
import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/controllers/terminal_controller.dart';
import 'package:kubenav/routes/app_pages.dart';
import 'package:kubenav/routes/app_routes.dart';
import 'package:kubenav/utils/constants.dart';

void main() async {
  await GetStorage.init();

  Get.put(GlobalSettingsController());
  Get.put(ProviderConfigController());
  Get.put(ClusterController());
  Get.put(BookmarkController());
  Get.put(TerminalController());
  Get.put(PortForwardingController());

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'kubenav',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    );
  }
}
