import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kubenav/pages/plugins/plugins_controller.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';

class Plugins extends GetView<PluginsController> {
  const Plugins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plugins"),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      body: const Center(
        child: Text('Plugins'),
      ),
    );
  }
}
