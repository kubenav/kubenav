import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [EvictPod] widget can be used to evict a pod from the cluster, via the
/// eviction API.
///
/// See https://kubernetes.io/docs/concepts/scheduling-eviction/api-eviction/
class EvictPod extends StatefulWidget {
  const EvictPod({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
  });

  final String name;
  final String namespace;
  final Resource resource;

  @override
  State<EvictPod> createState() => _EvictPodState();
}

class _EvictPodState extends State<EvictPod> {
  bool _isLoading = false;

  Future<void> _evict() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
      });

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}/eviction';
      final body =
          '{"apiVersion":"policy/v1","kind":"Eviction","metadata":{"name":"${widget.name}","namespace":"${widget.namespace}"}}';

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).postRequest(url, body);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          '${widget.resource.singular} Evicted',
          'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was evicted',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'EvictPod _evict',
        'Failed to Evict ${widget.resource.singular}',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Evict ${widget.resource.singular}',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Evict',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.delete_forever,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Evict ${widget.resource.singular}',
      actionPressed: () {
        _evict();
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
          child: Text(
            'Do you really want to evict the ${widget.resource.singular} ${widget.name}?',
          ),
        ),
      ),
    );
  }
}
