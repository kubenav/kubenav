import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/provider_model.dart' as provider_model;
import 'package:kubenav/pages/providers/providers_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';

class Providers extends GetView<ProvidersController> {
  const Providers({Key? key}) : super(key: key);

  Widget buildProviderConfig(BuildContext context, int index) {
    final provider = provider_model.Providers.list
        .where((p) =>
            p.name ==
            controller.providerConfigController.configs[index].value.provider)
        .toList();

    return Container(
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
          controller.showProviderConfigActionsBottomSheet(index);
        },
        child: Row(
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
              child: Image.asset(provider.length == 1
                  ? provider[0].image42x42
                  : provider_model.Providers.manual.image42x42),
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller
                        .providerConfigController.configs[index].value.name,
                    style: primaryTextStyle(
                      context,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    provider.length == 1
                        ? provider[0].title
                        : provider_model.Providers.manual.title,
                    style: secondaryTextStyle(
                      context,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    provider.length == 1
                        ? provider[0].subtitle
                        : provider_model.Providers.manual.subtitle,
                    style: secondaryTextStyle(
                      context,
                    ),
                    maxLines: 1,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Provider Configurations'),
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
                  return Column(
                    children: List.generate(
                      controller.providerConfigController.configs.length,
                      (index) => buildProviderConfig(context, index),
                    ),
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
