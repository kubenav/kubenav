import 'package:get/get.dart';

import 'package:kubenav/pages/resources_list/resources_list_controller.dart';

class ResourcesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResourcesListController());
  }
}
