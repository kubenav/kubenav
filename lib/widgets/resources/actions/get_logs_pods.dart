import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart' show Provider;

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/models/kubernetes/podlist_v1.dart' as podlistv1;
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/actions/get_logs.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// The [GetLogsPods] widget can be used to get the logs of a multiple pods, for
/// a provided Deployment, DaemonSet or StatefulSet. The user can select
/// multiple pods and get the logs for all selected pods, via the [GetLogs]
/// widget.
class GetLogsPods extends StatefulWidget {
  const GetLogsPods({
    super.key,
    required this.name,
    required this.namespace,
    required this.item,
  });

  final String name;
  final String namespace;
  final dynamic item;

  @override
  State<GetLogsPods> createState() => _GetLogsPodsState();
}

class _GetLogsPodsState extends State<GetLogsPods> {
  bool _isLoading = false;
  String _error = '';
  List<podlistv1.PodlistV1Item> _pods = <podlistv1.PodlistV1Item>[];
  List<podlistv1.PodlistV1Item> _selectedPods = <podlistv1.PodlistV1Item>[];
  podlistv1.PodlistV1Item? _pod;

  /// [_getPods] gets all Pods for the provided Deployment, DaemonSet or
  /// StatefulSet.
  Future<void> _getPods() async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );

      final selector = getSelector(
        Selector(
          matchLabels: widget.item.spec.selector.matchLabels,
          matchExpressions: widget.item.spec.selector.matchExpressions
              ?.map(
                (e) => MatchExpression(
                  key: e!.key,
                  matchExpressionOperator: e.matchExpressionOperator,
                  values: e.values,
                ),
              )
              .toList(),
        ),
      );

      final result =
          await KubernetesService(
            cluster: cluster!,
            proxy: appRepository.settings.proxy,
            timeout: appRepository.settings.timeout,
          ).getRequest(
            '${resourcePod.path}/namespaces/${widget.namespace}/${resourcePod.resource}?$selector',
          );

      final pods = await compute(resourcePod.decodeList, result);

      setState(() {
        _isLoading = false;
        _pods = pods as List<podlistv1.PodlistV1Item>;
        if (pods.isNotEmpty) {
          _pod = pods.first;
        }
      });
    } catch (err) {
      Logger.log('GetLogsPods _getPods', 'Could not get pods', err);
      setState(() {
        _isLoading = false;
        _error = err.toString();
      });
    }
  }

  /// [_buildContent] shows a loading indicator, when we execute the API call to
  /// get the clusters. When the API call returns an error we display an error
  /// widget. If the API returns a list of clusters, we show a list of clusters,
  /// which can be selected by the user to add them to the app.
  Widget _buildContent() {
    if (_isLoading) {
      return CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      );
    }

    if (_error != '') {
      return AppErrorWidget(
        message: 'Could not load Pods',
        details: _error,
        icon: ClusterProviderType.google.icon(),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      separatorBuilder: (context, index) {
        return const SizedBox(height: Constants.spacingMiddle);
      },
      itemCount: _pods.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).extension<CustomColors>()!.shadow,
                blurRadius: Constants.sizeBorderBlurRadius,
                spreadRadius: Constants.sizeBorderSpreadRadius,
                offset: const Offset(0.0, 0.0),
              ),
            ],
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(
              Radius.circular(Constants.sizeBorderRadius),
            ),
          ),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value:
                _selectedPods
                    .where(
                      (p) => p.metadata?.name == _pods[index].metadata?.name,
                    )
                    .toList()
                    .length ==
                1,
            onChanged: (bool? value) {
              if (value == true) {
                setState(() {
                  _selectedPods.add(_pods[index]);
                });
              }
              if (value == false) {
                setState(() {
                  _selectedPods = _selectedPods
                      .where(
                        (p) => p.metadata?.name != _pods[index].metadata?.name,
                      )
                      .toList();
                });
              }
            },
            title: Text(
              Characters(
                _pods[index].metadata?.name ?? '',
              ).replaceAll(Characters(''), Characters('\u{200B}')).toString(),
              style: normalTextStyle(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getPods();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Select Pods',
      subtitle: '${widget.name}/${widget.namespace}',
      icon: Icons.subject,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Get Logs',
      actionPressed: () {
        Navigator.pop(context);
        if (_selectedPods.isNotEmpty && _pod != null) {
          showModal(
            context,
            GetLogs(
              names: _selectedPods
                  .map((e) => e.metadata?.name ?? '')
                  .toList()
                  .join(','),
              namespace: widget.namespace,
              pod: _pod!,
            ),
          );
        }
      },
      actionIsLoading: _isLoading,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: _buildContent(),
        ),
      ),
    );
  }
}
