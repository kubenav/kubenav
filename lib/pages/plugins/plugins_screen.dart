import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/pages/plugins/plugins_controller.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';

class Plugins extends GetView<PluginsController> {
  const Plugins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Plugins"),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: const Center(
        child: Text('Plugins'),
      ),
    );
  }
}
