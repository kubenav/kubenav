import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class NodeCordon extends StatefulWidget {
  const NodeCordon({
    super.key,
    required this.name,
    required this.node,
    required this.resource,
  });

  final String name;
  final IoK8sApiCoreV1Node node;
  final Resource resource;

  @override
  State<NodeCordon> createState() => _NodeCordonState();
}

class _NodeCordonState extends State<NodeCordon> {
  bool _isLoading = false;

  Future<void> _cordon() async {
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

      final String body = widget.node.spec?.unschedulable == null
          ? '[{"op":"add","path":"/spec/unschedulable","value":true}]'
          : '[{"op":"replace","path":"/spec/unschedulable","value":true}]';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.resource.path}/${widget.resource.resource}/${widget.name}';

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).patchRequest(url, body);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          '${widget.resource.singular} Cordoned',
          'The ${widget.resource.singular} ${widget.name} was cordoned',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'NodeCordon _cordon',
        'Failed to Cordon ${widget.resource.singular}',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Cordon ${widget.resource.singular}',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Cordon',
      subtitle: widget.name,
      icon: Icons.update_disabled,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Cordon',
      actionPressed: () {
        _cordon();
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
            'Do you really want to cordon the ${widget.resource.singular} ${widget.name}?',
          ),
        ),
      ),
    );
  }
}
