import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

class PluginFlux extends StatelessWidget {
  const PluginFlux({super.key});

  List<AppVertialListSimpleModel> _buildItems(
    BuildContext context,
    FluxResourceCategory resourceCategory,
  ) {
    final resources =
        fluxResources.where((e) => e.category == resourceCategory).toList();

    return List.generate(
      resources.length,
      (index) {
        final resource = resources[index];
        return AppVertialListSimpleModel(
          onTap: () {
            navigate(
              context,
              resource.listWidget,
            );
          },
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resource.plural,
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
    );
  }

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
              FluxResourceCategory.values.length,
              (index) {
                final resourceCategory = FluxResourceCategory.values[index];
                return Column(
                  children: [
                    AppVertialListSimpleWidget(
                      title: resourceCategory.toLocalizedString(),
                      items: _buildItems(context, resourceCategory),
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
