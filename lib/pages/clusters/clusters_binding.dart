import 'package:get/get.dart';

import 'package:kubenav/pages/clusters/clusters_controller.dart';

class ClustersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClustersController());
  }
}
