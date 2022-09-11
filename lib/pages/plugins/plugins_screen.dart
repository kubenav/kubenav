import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/pages/plugins/plugins_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class Plugins extends GetView<PluginsController> {
  const Plugins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Plugins'),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppVertialListSimpleWidget(
              title: 'Plugins',
              items: [
                AppVertialListSimpleModel(
                  onTap: () {
                    Get.toNamed(
                      '/plugins/helm/list',
                    );
                  },
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Constants.colorPrimary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Constants.sizeBorderRadius),
                        ),
                      ),
                      height: 54,
                      width: 54,
                      child: Image.asset('assets/plugins/image42x42/helm.png'),
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Helm',
                            style: primaryTextStyle(
                              context,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'The package manager for Kubernetes',
                            style: secondaryTextStyle(
                              context,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[300],
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
