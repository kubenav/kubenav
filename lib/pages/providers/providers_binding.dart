import 'package:get/get.dart';

import 'package:kubenav/pages/providers/providers_controller.dart';

class ProvidersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProvidersController());
  }
}
