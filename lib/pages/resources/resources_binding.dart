import 'package:get/get.dart';

import 'package:kubenav/pages/resources/resources_controller.dart';

class ResourcesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResourcesController());
  }
}
