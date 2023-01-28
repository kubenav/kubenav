import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/details/details_create_job.dart';
import 'package:kubenav/widgets/resources/details/details_delete_resource.dart';
import 'package:kubenav/widgets/resources/details/details_edit_resource.dart';
import 'package:kubenav/widgets/resources/details/details_get_logs.dart';
import 'package:kubenav/widgets/resources/details/details_get_logs_pods.dart';
import 'package:kubenav/widgets/resources/details/details_live_metrics_containers.dart';
import 'package:kubenav/widgets/resources/details/details_restart_resource.dart';
import 'package:kubenav/widgets/resources/details/details_scale_resource.dart';
import 'package:kubenav/widgets/resources/details/details_show_yaml.dart';
import 'package:kubenav/widgets/resources/details/details_terminal.dart';
import 'package:kubenav/widgets/shared/app_actions_widget.dart';

/// The [ListItemActions] widget renders an actions menu, with the actions for
/// a reesource. The actions are the same as defined in `resource_details.dart`
/// file for the details view of a resource.
class ListItemActions extends StatefulWidget {
  const ListItemActions({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.name,
    required this.namespace,
    required this.item,
  }) : super(key: key);

  final String title;
  final String resource;
  final String path;
  final ResourceScope scope;
  final List<AdditionalPrinterColumns> additionalPrinterColumns;
  final String name;
  final String? namespace;
  final dynamic item;

  @override
  State<ListItemActions> createState() => _ListItemActionsState();
}

class _ListItemActionsState extends State<ListItemActions> {
  List<AppActionsWidgetAction> buildAdditionalActions(
    BuildContext context,
    String resource,
    String path,
    String name,
    String? namespace,
    dynamic item,
  ) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    final List<AppActionsWidgetAction> additionalActions = [];

    if ((Resources.map['deployments']!.resource == resource &&
            Resources.map['deployments']!.path == path) ||
        (Resources.map['statefulsets']!.resource == resource &&
            Resources.map['statefulsets']!.path == path)) {
      additionalActions.add(
        AppActionsWidgetAction(
          title: 'Scale',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              DetailsScaleResource(
                resource: resource,
                path: path,
                name: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if ((Resources.map['deployments']!.resource == resource &&
            Resources.map['deployments']!.path == path) ||
        (Resources.map['statefulsets']!.resource == resource &&
            Resources.map['statefulsets']!.path == path) ||
        (Resources.map['daemonsets']!.resource == resource &&
            Resources.map['daemonsets']!.path == path)) {
      additionalActions.add(
        AppActionsWidgetAction(
          title: 'Restart',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              DetailsRestartResource(
                resource: resource,
                path: path,
                name: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if (Resources.map['cronjobs']!.resource == resource &&
        Resources.map['cronjobs']!.path == path) {
      additionalActions.add(
        AppActionsWidgetAction(
          title: 'Create Job',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              DetailsCreateJob(
                name: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if (Resources.map['pods']!.resource == resource &&
        Resources.map['pods']!.path == path) {
      additionalActions.add(
        AppActionsWidgetAction(
          title: 'Logs',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              DetailsGetLogs(
                names: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if ((Resources.map['deployments']!.resource == resource &&
            Resources.map['deployments']!.path == path) ||
        (Resources.map['statefulsets']!.resource == resource &&
            Resources.map['statefulsets']!.path == path) ||
        (Resources.map['daemonsets']!.resource == resource &&
            Resources.map['daemonsets']!.path == path)) {
      additionalActions.add(
        AppActionsWidgetAction(
          title: 'Logs',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              DetailsGetLogsPods(
                name: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if (Resources.map['pods']!.resource == resource &&
        Resources.map['pods']!.path == path) {
      additionalActions.add(
        AppActionsWidgetAction(
          title: 'Terminal',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              DetailsTerminal(
                name: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if (Resources.map['pods']!.resource == resource &&
        Resources.map['pods']!.path == path) {
      additionalActions.add(
        AppActionsWidgetAction(
          title: 'Live Metrics',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showActions(
              context,
              DetailsLiveMetricsContainers(
                name: name,
                namespace: namespace ?? '',
                pod: IoK8sApiCoreV1Pod.fromJson(item)!,
              ),
            );
          },
        ),
      );
    }

    if (Resources.map['namespaces']!.resource == resource &&
        Resources.map['namespaces']!.path == path) {
      additionalActions.add(
        AppActionsWidgetAction(
          title: appRepository.settings.namespaces
                  .where((e) => e == name)
                  .toList()
                  .isEmpty
              ? 'Add to Favorites'
              : 'Remove from Favorites',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            if (appRepository.settings.namespaces
                .where((e) => e == name)
                .toList()
                .isEmpty) {
              appRepository.addNamespace(name);
            } else {
              appRepository.deleteNamespace(name);
            }
          },
        ),
      );
    }

    return additionalActions;
  }

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    BookmarksRepository bookmarksRepository = Provider.of<BookmarksRepository>(
      context,
      listen: false,
    );

    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title:
              appRepository.settings.editorFormat == 'json' ? 'Json' : 'Yaml',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              DetailsShowYaml(
                item: widget.item,
              ),
            );
          },
        ),
        AppActionsWidgetAction(
          title: 'Edit',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              DetailsEditResource(
                resource: widget.resource,
                path: widget.path,
                name: widget.name,
                namespace: widget.namespace,
                item: widget.item,
              ),
            );
          },
        ),
        AppActionsWidgetAction(
          title: 'Delete',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              DetailsDeleteResource(
                resource: widget.resource,
                path: widget.path,
                name: widget.name,
                namespace: widget.namespace,
              ),
            );
          },
        ),
        AppActionsWidgetAction(
          title: bookmarksRepository.isBookmarked(
                    BookmarkType.details,
                    clustersRepository.activeClusterId,
                    widget.title,
                    widget.resource,
                    widget.path,
                    widget.scope,
                    widget.name,
                    widget.namespace,
                  ) >
                  -1
              ? 'Remove from Bookmarks'
              : 'Add to Bookmarks',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            final bookmarkIndex = bookmarksRepository.isBookmarked(
              BookmarkType.details,
              clustersRepository.activeClusterId,
              widget.title,
              widget.resource,
              widget.path,
              widget.scope,
              widget.name,
              widget.namespace,
            );
            if (bookmarkIndex > -1) {
              bookmarksRepository.removeBookmark(bookmarkIndex);
            } else {
              bookmarksRepository.addBookmark(
                BookmarkType.details,
                clustersRepository.activeClusterId,
                widget.title,
                widget.resource,
                widget.path,
                widget.scope,
                widget.additionalPrinterColumns,
                widget.name,
                widget.namespace,
              );
            }
          },
        ),
        ...buildAdditionalActions(
          context,
          widget.resource,
          widget.path,
          widget.name,
          widget.namespace,
          widget.item,
        ),
      ],
    );
  }
}
