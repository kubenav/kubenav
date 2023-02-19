import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/namespaces/settings_add_namespace.dart';
import 'package:kubenav/widgets/settings/namespaces/settings_delete_namespace.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_drawer.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// The [SettingsNamespaces] widget is used to display all the users favorite
/// namespaces on a new screen. Within the screen a user can also add new
/// namespaces to the list or delete existing ones. The list of namespaces can
/// also be ordered by the user, so that the namespace which is used most of the
/// time is always displayed at the top.
class SettingsNamespaces extends StatelessWidget {
  const SettingsNamespaces({Key? key}) : super(key: key);

  /// [_proxyDecorator] is used to highlight the bookmark which is currently
  /// draged by the user.
  Widget _proxyDecorator(BuildContext context, Widget child, int index,
      Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Material(
          elevation: 0,
          child: child,
        );
      },
      child: child,
    );
  }

  /// [buildNamespace] builds the widget to display a single namespace. The
  /// namespace is identified by it's index in the app repository. If the user
  /// clicks on the namespace we show an action menu, where the user can delete
  /// the namespace.
  Widget buildNamespace(BuildContext context, int index) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    return Container(
      key: Key(appRepository.settings.namespaces[index]),
      margin: const EdgeInsets.only(
        top: Constants.spacingSmall,
        bottom: Constants.spacingSmall,
        left: Constants.spacingMiddle,
        right: Constants.spacingMiddle,
      ),
      child: AppListItem(
        onTap: () {
          showActions(
            context,
            SettingsDeleteNamespace(
              namespace: appRepository.settings.namespaces[index],
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appRepository.settings.namespaces[index],
                    style: primaryTextStyle(
                      context,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            ReorderableDragStartListener(
              index: index,
              child: Icon(
                Icons.drag_handle,
                color: theme(context)
                    .colorTextPrimary
                    .withOpacity(Constants.opacityIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      drawer: appRepository.settings.classicMode ? const AppDrawer() : null,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModal(
                context,
                const SettingsAddNamespace(),
              );
            },
          ),
        ],
        title: const Text('Namespaces'),
      ),
      bottomNavigationBar: appRepository.settings.classicMode
          ? null
          : const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: Constants.spacingLarge),
              ReorderableListView.builder(
                shrinkWrap: true,
                buildDefaultDragHandles: false,
                physics: const NeverScrollableScrollPhysics(),
                onReorder: (int start, int current) {
                  appRepository.reorderNamespaces(start, current);
                },
                proxyDecorator:
                    (Widget child, int index, Animation<double> animation) =>
                        _proxyDecorator(context, child, index, animation),
                itemCount: appRepository.settings.namespaces.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return buildNamespace(context, index);
                },
              ),
              const SizedBox(height: Constants.spacingSmall),
            ],
          ),
        ),
      ),
    );
  }
}
