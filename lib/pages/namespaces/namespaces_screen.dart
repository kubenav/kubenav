import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/pages/namespaces/namespaces_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';

class Namespaces extends GetView<NamespacesController> {
  const Namespaces({Key? key}) : super(key: key);

  /// [_proxyDecorator] is used to highlight the cluster which is currently draged by the user.
  Widget _proxyDecorator(BuildContext context, Widget child, int index,
      Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          shadowColor: Theme.of(context).shadowColor,
          child: child,
        );
      },
      child: child,
    );
  }

  Widget buildNamespace(BuildContext context, int index) {
    return Container(
      key: Key('$index'),
      margin: const EdgeInsets.only(
        bottom: Constants.spacingMiddle,
      ),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: Constants.sizeBorderBlurRadius,
            spreadRadius: Constants.sizeBorderSpreadRadius,
            offset: const Offset(0.0, 0.0),
          ),
        ],
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.sizeBorderRadius),
        ),
      ),
      child: InkWell(
        onTap: () {
          controller.deleteNamespace(index);
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.globalSettingsController.namespaces[index],
                    style: primaryTextStyle(
                      context,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              controller.addNamespace();
            },
          ),
        ],
        title: const Text('Namespaces'),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Constants.spacingLarge),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.spacingMiddle,
                right: Constants.spacingMiddle,
              ),
              child: Obx(
                () {
                  return ReorderableListView.builder(
                    shrinkWrap: true,
                    buildDefaultDragHandles: false,
                    physics: const NeverScrollableScrollPhysics(),
                    onReorder: (int start, int current) {
                      controller.globalSettingsController
                          .reorderNamespaces(start, current);
                    },
                    proxyDecorator: (Widget child, int index,
                            Animation<double> animation) =>
                        _proxyDecorator(context, child, index, animation),
                    itemCount:
                        controller.globalSettingsController.namespaces.length,
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      return ReorderableDragStartListener(
                        key: Key('$index'),
                        index: index,
                        child: buildNamespace(context, index),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: Constants.spacingSmall),
          ],
        ),
      ),
    );
  }
}
