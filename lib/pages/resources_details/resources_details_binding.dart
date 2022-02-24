import 'package:get/get.dart';

import 'package:kubenav/pages/resources_details/resources_details_controller.dart';

class ResourcesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResourcesDetailsController());
  }
}
