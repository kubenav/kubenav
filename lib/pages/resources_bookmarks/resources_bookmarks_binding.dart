import 'package:get/get.dart';

import 'package:kubenav/pages/resources_bookmarks/resources_bookmarks_controller.dart';

class ResourcesBookmarksBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResourcesBookmarksController());
  }
}
