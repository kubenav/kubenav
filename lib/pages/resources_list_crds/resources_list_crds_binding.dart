import 'package:get/get.dart';

import 'package:kubenav/pages/resources_list_crds/resources_list_crds_controller.dart';

class ResourcesListCRDsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResourcesListCRDsController());
  }
}
