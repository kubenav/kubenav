import 'package:get/get.dart';

import 'package:kubenav/pages/plugins/plugins_controller.dart';

class PluginsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PluginsController());
  }
}
