import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/settings/namespaces/settings_add_namespace.dart';
import 'package:kubenav/widgets/settings/namespaces/settings_delete_namespace.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// The [SettingsNamespaces] widget is used to display all the users favorite
/// namespaces on a new screen. Within the screen a user can also add new
/// namespaces to the list or delete existing ones. The list of namespaces can
/// also be ordered by the user, so that the namespace which is used most of the
/// time is always displayed at the top.
class SettingsNamespaces extends StatelessWidget {
  const SettingsNamespaces({super.key});

  /// [_proxyDecorator] is used to highlight the bookmark which is currently
  /// draged by the user.
  Widget _proxyDecorator(
    Widget child,
    int index,
    Animation<double> animation,
  ) {
    return Material(
      elevation: 0,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 16,
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 24,
              color: Colors.transparent,
            ),
          ),
          child,
        ],
      ),
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

    final namespace = appRepository.settings.namespaces[index];

    return Container(
      key: Key(namespace),
      margin: const EdgeInsets.only(
        bottom: Constants.spacingMiddle,
        left: Constants.spacingMiddle,
        right: Constants.spacingMiddle,
      ),
      child: AppListItem(
        onTap: () {
          showActions(
            context,
            SettingsDeleteNamespace(
              namespace: namespace,
            ),
          );
        },
        onLongPress: () {
          HapticFeedback.vibrate();

          showActions(
            context,
            SettingsDeleteNamespace(
              namespace: namespace,
            ),
          );
        },
        slidableActions: [
          AppListItemSlidableAction(
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
            onTap: (BuildContext context) {
              appRepository.deleteNamespace(namespace);
              showSnackbar(
                context,
                'Namespace Deleted',
                'The Namespace $namespace was deleted',
              );
            },
          ),
        ],
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namespace,
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
                color: Theme.of(context)
                    .extension<CustomColors>()!
                    .textPrimary
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
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );

    return Scaffold(
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
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: Constants.spacingMiddle),
              ReorderableListView.builder(
                shrinkWrap: true,
                buildDefaultDragHandles: false,
                physics: const NeverScrollableScrollPhysics(),
                onReorder: (int start, int current) {
                  appRepository.reorderNamespaces(start, current);
                },
                proxyDecorator: (
                  Widget child,
                  int index,
                  Animation<double> animation,
                ) {
                  return _proxyDecorator(child, index, animation);
                },
                itemCount: appRepository.settings.namespaces.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return buildNamespace(context, index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
