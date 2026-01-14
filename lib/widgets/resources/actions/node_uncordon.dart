import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class NodeUncordon extends StatefulWidget {
  const NodeUncordon({
    super.key,
    required this.name,
    required this.node,
    required this.resource,
  });

  final String name;
  final IoK8sApiCoreV1Node node;
  final Resource resource;

  @override
  State<NodeUncordon> createState() => _NodeUncordonState();
}

class _NodeUncordonState extends State<NodeUncordon> {
  bool _isLoading = false;

  Future<void> _uncordon() async {
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

      final String body = '{"spec": {"unschedulable": false}}';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.resource.path}/${widget.resource.resource}/${widget.name}?fieldManager=kubenav';

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).patchRequest(PatchType.mergePatch, url, body);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          '${widget.resource.singular} Uncordoned',
          'The ${widget.resource.singular} ${widget.name} was uncordoned',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'NodeUncordon _uncordon',
        'Failed to Uncordon ${widget.resource.singular}',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Uncordon ${widget.resource.singular}',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Uncordon',
      subtitle: widget.name,
      icon: Icons.update,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Uncordon',
      actionPressed: () {
        _uncordon();
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
            'Do you really want to uncordon the ${widget.resource.singular} ${widget.name}?',
          ),
        ),
      ),
    );
  }
}
