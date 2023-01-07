import 'dart:ui';

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
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';

/// The [SettingsNamespaces] widget is used to display all the users favorite
/// namespaces on a new screen. Within the screen a user can also add new
/// namespaces to the list or delete existing ones. The list of namespaces can
/// also be ordered by the user, so that the namespace which is used most of the
/// time is always displayed at the top.
class SettingsNamespaces extends StatelessWidget {
  const SettingsNamespaces({Key? key}) : super(key: key);

  /// [_proxyDecorator] is used to highlight the cluster which is currently
  /// draged by the user.
  Widget _proxyDecorator(BuildContext context, Widget child, int index,
      Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          shadowColor: theme(context).colorShadow,
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
      key: Key('$index'),
      margin: const EdgeInsets.only(
        bottom: Constants.spacingMiddle,
      ),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme(context).colorShadow,
            blurRadius: Constants.sizeBorderBlurRadius,
            spreadRadius: Constants.sizeBorderSpreadRadius,
            offset: const Offset(0.0, 0.0),
          ),
        ],
        color: theme(context).colorCard,
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.sizeBorderRadius),
        ),
      ),
      child: InkWell(
        onTap: () {
          showActions(
            context,
            SettingsDeleteNamespace(index: index),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Constants.spacingLarge),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.spacingMiddle,
                right: Constants.spacingMiddle,
              ),
              child: ReorderableListView.builder(
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
                ) =>
                    _proxyDecorator(context, child, index, animation),
                itemCount: appRepository.settings.namespaces.length,
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
              ),
            ),
            const SizedBox(height: Constants.spacingSmall),
          ],
        ),
      ),
    );
  }
}
