import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/models/resource.dart' as resource_model;
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/widgets/home/home.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_list.dart';
import 'package:kubenav/widgets/plugins/prometheus/plugin_prometheus_list.dart';
import 'package:kubenav/widgets/resources/bookmarks/resources_bookmarks.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/resources/resources_list_crds.dart';
import 'package:kubenav/widgets/settings/settings.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildLeading(BuildContext context, dynamic icon) {
    if (icon is String) {
      return Container(
        decoration: BoxDecoration(
          color: theme(context).colorPrimary,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.sizeBorderRadius),
          ),
        ),
        height: 42,
        width: 42,
        padding: const EdgeInsets.all(
          Constants.spacingIcon54x54,
        ),
        child: SvgPicture.asset(
          icon,
          color: theme(context).colorOnPrimary,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: theme(context).colorPrimary,
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.sizeBorderRadius),
        ),
      ),
      height: 42,
      width: 42,
      padding: const EdgeInsets.all(
        Constants.spacingIcon54x54,
      ),
      child: Icon(
        icon,
        color: theme(context).colorOnPrimary,
      ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(color: theme(context).colorOnPrimary),
    );
  }

  Widget buildDivider(BuildContext context, String title) {
    // See: https://stackoverflow.com/a/58604669
    final hsl = HSLColor.fromColor(theme(context).colorPrimary);
    final hslDark = hsl.withLightness((hsl.lightness - 0.1).clamp(0.0, 1.0));

    return Container(
      color: hslDark.toColor(),
      padding: const EdgeInsets.only(
        top: Constants.spacingSmall,
        bottom: Constants.spacingSmall,
        left: Constants.spacingMiddle,
        right: Constants.spacingMiddle,
      ),
      child: Text(
        title,
        style: TextStyle(
          // fontSize: 16,
          fontWeight: FontWeight.bold,
          color: theme(context).colorOnPrimary,
        ),
      ),
    );
  }

  List<Widget> getResourceItems(
    BuildContext context,
    resource_model.ResourceType resourceType,
  ) {
    List<Widget> items = [];

    resource_model.Resources.map.forEach(
      (key, value) {
        if (value.resourceType == resourceType) {
          items.add(
            ListTile(
              leading: buildLeading(context, 'assets/resources/$key.svg'),
              title: buildTitle(context, value.title),
              onTap: () {
                if (value.resource == 'customresourcedefinitions') {
                  navigate(
                    context,
                    const ResourcesListCRDs(),
                    Constants.pageIndexResources,
                  );
                } else {
                  navigate(
                    context,
                    ResourcesList(
                      title: value.title,
                      resource: value.resource,
                      path: value.path,
                      scope: value.scope,
                      namespace: null,
                      selector: null,
                      additionalPrinterColumns: value.additionalPrinterColumns,
                    ),
                    Constants.pageIndexResources,
                  );
                }
              },
            ),
          );
        }
      },
    );

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: theme(context).colorPrimary,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: ListTile.divideTiles(
              context: context,
              color: theme(context).colorOnPrimary,
              tiles: [
                ListTile(
                  leading: buildLeading(context, Icons.home),
                  title: buildTitle(context, 'Home'),
                  onTap: () => {
                    navigate(
                      context,
                      const Home(),
                      Constants.pageIndexHome,
                    )
                  },
                ),
                ListTile(
                  leading: buildLeading(context, Icons.settings),
                  title: buildTitle(context, 'Settings'),
                  onTap: () => {
                    navigate(
                      context,
                      const Settings(),
                      Constants.pageIndexSettings,
                    )
                  },
                ),
                ListTile(
                  leading: buildLeading(context, Icons.bookmark),
                  title: buildTitle(context, 'Bookmarks'),
                  onTap: () => {
                    navigate(
                      context,
                      const ResourcesBookmarks(),
                      Constants.pageIndexResources,
                    )
                  },
                ),
                buildDivider(context, 'Workloads'),
                ...getResourceItems(
                  context,
                  resource_model.ResourceType.workload,
                ),
                buildDivider(context, 'Discovery and Load Balancing'),
                ...getResourceItems(
                  context,
                  resource_model.ResourceType.workload,
                ),
                buildDivider(context, 'Config and Storage'),
                ...getResourceItems(
                  context,
                  resource_model.ResourceType.configandstorage,
                ),
                buildDivider(context, 'RBAC'),
                ...getResourceItems(
                  context,
                  resource_model.ResourceType.rbac,
                ),
                buildDivider(context, 'Cluster'),
                ...getResourceItems(
                  context,
                  resource_model.ResourceType.cluster,
                ),
                buildDivider(context, 'Plugins'),
                ListTile(
                  leading: buildLeading(context, 'assets/plugins/helm.svg'),
                  title: buildTitle(context, 'Helm'),
                  onTap: () => {
                    navigate(
                      context,
                      const PluginHelmList(),
                      Constants.pageIndexPlugins,
                    )
                  },
                ),
                ListTile(
                  leading:
                      buildLeading(context, 'assets/plugins/prometheus.svg'),
                  title: buildTitle(context, 'Prometheus'),
                  onTap: () => {
                    navigate(
                      context,
                      const PluginPrometheusList(),
                      Constants.pageIndexPlugins,
                    )
                  },
                ),
              ],
            ).toList(),
          ),
        ),
      ),
    );
  }
}
