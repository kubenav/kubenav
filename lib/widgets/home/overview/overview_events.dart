import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event_list.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources/events.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// The [OverviewEvents] widget can be used to display a list of events on the
/// overview screen, with the last warning events created in the current active
/// cluster.
///
/// To show the events we reuse the [ListItemWidget] from the resources page, so
/// that the events have the same style as in the resources view.
class OverviewEvents extends StatefulWidget {
  const OverviewEvents({super.key});

  @override
  State<OverviewEvents> createState() => _OverviewEventsState();
}

class _OverviewEventsState extends State<OverviewEvents> {
  late Future<List<IoK8sApiCoreV1Event>> _futureFetchEvents;

  /// [_fetchEvents] gets a list of all events for the currently active cluster,
  /// where the type of the event is `Warning`. When the Kubernetes API returns
  /// a list of events, we sort the events by their `lastTimestamp` field and
  /// return the first 25 events.
  Future<List<IoK8sApiCoreV1Event>> _fetchEvents() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    final cluster = await clustersRepository.getClusterWithCredentials(
      clustersRepository.activeClusterId,
    );

    final resourcesListUrl =
        '${Resources.map['events']!.path}/${Resources.map['events']!.resource}?fieldSelector=type=Warning';

    final resourcesList = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(resourcesListUrl);

    Logger.log(
      'OverviewEventsRepository _fetchEvents',
      '${resourcesList['items'].length} items were returned',
      'Request URL: $resourcesListUrl\nManifest: $resourcesList',
    );

    final eventsList = IoK8sApiCoreV1EventList.fromJson(resourcesList);

    if (eventsList != null) {
      final eventItems = eventsList.items;
      eventItems.sort(
        (a, b) => a.lastTimestamp != null && b.lastTimestamp != null
            ? b.lastTimestamp!.compareTo(a.lastTimestamp!)
            : 0,
      );

      if (eventItems.length > 25) {
        return eventItems.sublist(0, 25);
      } else {
        return eventItems;
      }
    }

    return [];
  }

  /// [buildEventItem] builds the widget for a single event using the
  /// [ListItemWidget] from the resources page.
  Widget buildEventItem(IoK8sApiCoreV1Event event) {
    final info = buildInfoText(event);

    return ListItemWidget(
      title: Resources.map['events']!.title,
      resource: Resources.map['events']!.resource,
      path: Resources.map['events']!.path,
      scope: Resources.map['events']!.scope,
      additionalPrinterColumns:
          Resources.map['events']!.additionalPrinterColumns,
      name: event.metadata.name ?? '',
      namespace: event.metadata.namespace,
      item: null,
      info: info,
      status: event.type == 'Normal' ? Status.success : Status.warning,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchEvents = _fetchEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Constants.spacingMiddle),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Warnings',
                  style: primaryTextStyle(context, size: 18),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: _futureFetchEvents,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<IoK8sApiCoreV1Event>> snapshot,
          ) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Constants.spacingMiddle,
                        right: Constants.spacingMiddle,
                      ),
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                );
              default:
                if (snapshot.hasError) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: Constants.spacingMiddle,
                            right: Constants.spacingMiddle,
                          ),
                          child: AppErrorWidget(
                            message: 'Could not load events',
                            details: snapshot.error.toString(),
                            icon:
                                'assets/resources/${Resources.map['events']!.resource}.svg',
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                    right: Constants.spacingMiddle,
                    left: Constants.spacingMiddle,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: Constants.spacingMiddle,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return buildEventItem(
                      snapshot.data![index],
                    );
                  },
                );
            }
          },
        ),
      ],
    );
  }
}
