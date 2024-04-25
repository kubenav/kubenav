import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_list_resources.dart';
import 'package:kubenav/widgets/plugins/flux/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

class PluginFluxList extends StatelessWidget {
  const PluginFluxList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flux'),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              resourceCategories.length,
              (index) {
                final resourceCategory = resourceCategories[index];
                return Column(
                  children: [
                    AppVertialListSimpleWidget(
                      title: resourceCategory.title,
                      items: List.generate(
                        resourceCategory.resources.length,
                        (index) {
                          final resource = resourceCategory.resources[index];
                          return AppVertialListSimpleModel(
                            onTap: () {
                              navigate(
                                context,
                                PluginFluxListResources(
                                  resource: resource,
                                ),
                              );
                            },
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      resource.titlePlural,
                                      style: primaryTextStyle(
                                        context,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      resource.description,
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
                                color: Theme.of(context)
                                    .extension<CustomColors>()!
                                    .textSecondary
                                    .withOpacity(Constants.opacityIcon),
                                size: 24,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: Constants.spacingMiddle),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
