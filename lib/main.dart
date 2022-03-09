import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/controllers/bookmark_controller.dart';
import 'package:kubenav/controllers/terminal_controller.dart';
import 'package:kubenav/routes/app_pages.dart';
import 'package:kubenav/routes/app_routes.dart';
import 'package:kubenav/utils/constants.dart';

void main() async {
  await GetStorage.init();

  Get.put(ClusterController());
  Get.put(BookmarkController());
  Get.put(TerminalController());

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'kubenav',
      theme: ThemeData(
        primaryColor: Constants.colorPrimary,
        canvasColor: Constants.colorCanvas,
        appBarTheme: const AppBarTheme(
          backgroundColor: Constants.colorAppBarBackground,
          foregroundColor: Constants.colorAppBarForeground,
          elevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(
            color: Constants.colorPrimary,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Constants.colorPrimary,
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Constants.colorPrimary,
          selectionColor: Constants.colorPrimary.withOpacity(0.25),
          selectionHandleColor: Constants.colorPrimary,
        ),
      ),
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    );
  }
}
