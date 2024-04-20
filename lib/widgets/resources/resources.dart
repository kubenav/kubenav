import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/models/resource.dart' as resource_model;
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/bookmarks/resources_bookmarks_preview.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/resources/resources_list_crds.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_clusters_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_no_clusters_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

class Resources extends StatelessWidget {
  const Resources({super.key});

  List<AppVertialListSimpleModel> getItems(
    BuildContext context,
    resource_model.ResourceType resourceType,
  ) {
    List<AppVertialListSimpleModel> items = [];

    resource_model.Resources.map.forEach(
      (key, value) {
        if (value.resourceType == resourceType) {
          items.add(
            AppVertialListSimpleModel(
              onTap: () {
                if (value.resource == 'customresourcedefinitions') {
                  navigate(
                    context,
                    const ResourcesListCRDs(),
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
                  );
                }
              },
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Constants.sizeBorderRadius),
                    ),
                  ),
                  height: 54,
                  width: 54,
                  padding: const EdgeInsets.all(
                    Constants.spacingIcon54x54,
                  ),
                  child: SvgPicture.asset('assets/resources/$key.svg'),
                ),
                const SizedBox(width: Constants.spacingSmall),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.title,
                        style: primaryTextStyle(
                          context,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        value.description,
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
            ),
          );
        }
      },
    );

    return items;
  }

  List<Widget> buildContent(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    if (clustersRepository.clusters.isEmpty) {
      return [
        const Padding(
          padding: EdgeInsets.all(Constants.spacingMiddle),
          child: AppNoClustersWidget(),
        ),
      ];
    }

    return [
      const ResourcesBookmarksPreview(),
      AppVertialListSimpleWidget(
        title: 'Workloads',
        items: getItems(
          context,
          resource_model.ResourceType.workload,
        ),
      ),
      const SizedBox(height: Constants.spacingMiddle),
      AppVertialListSimpleWidget(
        title: 'Discovery and Load Balancing',
        items: getItems(
          context,
          resource_model.ResourceType.discoveryandloadbalancing,
        ),
      ),
      const SizedBox(height: Constants.spacingMiddle),
      AppVertialListSimpleWidget(
        title: 'Config and Storage',
        items: getItems(
          context,
          resource_model.ResourceType.configandstorage,
        ),
      ),
      const SizedBox(height: Constants.spacingMiddle),
      AppVertialListSimpleWidget(
        title: 'RBAC',
        items: getItems(
          context,
          resource_model.ResourceType.rbac,
        ),
      ),
      const SizedBox(height: Constants.spacingMiddle),
      AppVertialListSimpleWidget(
        title: 'Cluster',
        items: getItems(
          context,
          resource_model.ResourceType.cluster,
        ),
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ];
  }

  @override
  Widget build(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    final activeCluster = clustersRepository.getCluster(
      clustersRepository.activeClusterId,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(CustomIcons.clusters),
            onPressed: () {
              showModal(context, const AppClustersWidget());
            },
          ),
        ],
        title: Column(
          children: [
            const Text(
              'Resources',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              Characters(activeCluster?.name ?? 'No Active Cluster')
                  .replaceAll(Characters(''), Characters('\u{200B}'))
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: buildContent(context),
          ),
        ),
      ),
    );
  }
}
