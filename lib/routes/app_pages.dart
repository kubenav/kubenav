import 'package:get/get.dart';

import 'package:kubenav/routes/app_routes.dart';

import 'package:kubenav/pages/clusters/clusters_binding.dart';
import 'package:kubenav/pages/clusters/clusters_screen.dart';
import 'package:kubenav/pages/home/home_binding.dart';
import 'package:kubenav/pages/home/home_screen.dart';
import 'package:kubenav/pages/plugins/plugins_binding.dart';
import 'package:kubenav/pages/plugins/plugins_screen.dart';
import 'package:kubenav/pages/resources/resources_binding.dart';
import 'package:kubenav/pages/resources/resources_screen.dart';
import 'package:kubenav/pages/resources_details/resources_details_binding.dart';
import 'package:kubenav/pages/resources_details/resources_details_screen.dart';
import 'package:kubenav/pages/resources_list/resources_list_binding.dart';
import 'package:kubenav/pages/resources_list/resources_list_screen.dart';
import 'package:kubenav/pages/settings/settings_binding.dart';
import 'package:kubenav/pages/settings/settings_screen.dart';

// AppPages represents all pages, which are available in our app. For example the home, resources, plugins and settings
// page. In the 'GetPage' function we also bind the corresponding page controller to the page screen.
abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.resources,
      page: () => const Resources(),
      binding: ResourcesBinding(),
    ),
    GetPage(
      name: Routes.resourcesDetails,
      page: () => const ResourcesDetails(),
      binding: ResourcesDetailsBinding(),
    ),
    GetPage(
      name: Routes.resourcesList,
      page: () => const ResourcesList(),
      binding: ResourcesListBinding(),
    ),
    GetPage(
      name: Routes.plugins,
      page: () => const Plugins(),
      binding: PluginsBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const Settings(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.settingsClusters,
      page: () => const Clusters(),
      binding: ClustersBinding(),
    ),
  ];
}
