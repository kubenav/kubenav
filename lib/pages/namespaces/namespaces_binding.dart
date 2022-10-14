import 'package:get/get.dart';

import 'package:kubenav/pages/namespaces/namespaces_controller.dart';

class NamespacesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NamespacesController());
  }
}
