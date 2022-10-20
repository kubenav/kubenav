import 'package:get/get.dart';

import 'package:kubenav/pages/help/help_controller.dart';

class HelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HelpController());
  }
}
