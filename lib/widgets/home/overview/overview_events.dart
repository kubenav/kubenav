import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// [_decodeResult] decodes the result from the Kubernetes API and returns a
/// list of [IoK8sApiCoreV1Event]. We only return the first 25 events, if there
/// are more events available.
List<IoK8sApiCoreV1Event> _decodeResult(String result) {
  final parsed = json.decode(result);
  final events = IoK8sApiCoreV1EventList.fromJson(parsed).items;

  events.sort(
    (a, b) => (b.lastTimestamp ?? b.eventTime ?? b.metadata.creationTimestamp)!
        .compareTo(
          (a.lastTimestamp ?? a.eventTime ?? a.metadata.creationTimestamp)!,
        ),
  );

  if (events.length > 25) {
    return events.sublist(0, 25);
  } else {
    return events;
  }
}

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
        appRepository.settings.home.useSelectedNamespace &&
            cluster!.namespace != ''
        ? '${resourceEvent.path}/namespaces/${cluster.namespace}/${resourceEvent.resource}?fieldSelector=type=Warning'
        : '${resourceEvent.path}/${resourceEvent.resource}?fieldSelector=type=Warning';

    final result = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(resourcesListUrl);

    return await compute(_decodeResult, result);
  }

  /// [buildEventItem] builds the widget for a single event using the
  /// [ListItemWidget] from the resources page.
  Widget buildEventItem(IoK8sApiCoreV1Event event) {
    return ResourcesListItem(
      name: event.metadata.name ?? '',
      namespace: event.metadata.namespace,
      resource: resourceEvent,
      item: event,
      status: event.type == 'Normal'
          ? ResourceStatus.success
          : ResourceStatus.warning,
      details: resourceEvent.previewItemBuilder(event),
    );
  }

  Widget buildContainer(Widget content) {
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
        content,
      ],
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
    Provider.of<ClustersRepository>(context, listen: true);

    return FutureBuilder(
      future: _futureFetchEvents,
      builder:
          (
            BuildContext context,
            AsyncSnapshot<List<IoK8sApiCoreV1Event>> snapshot,
          ) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return buildContainer(
                  Row(
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
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return buildContainer(
                    Row(
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
                              message: 'Failed to Load ${resourceEvent.plural}',
                              details: snapshot.error.toString(),
                              icon:
                                  'assets/resources/${resourceEvent.icon}.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Container();
                }

                return buildContainer(
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                      right: Constants.spacingMiddle,
                      left: Constants.spacingMiddle,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: Constants.spacingMiddle),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return buildEventItem(snapshot.data![index]);
                    },
                  ),
                );
            }
          },
    );
  }
}
