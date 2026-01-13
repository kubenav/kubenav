import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/time.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class PluginCertManagerDeny extends StatefulWidget {
  const PluginCertManagerDeny({
    super.key,
    required this.name,
    required this.namespace,
    required this.cr,
    required this.resource,
  });

  final String name;
  final String namespace;
  final IoCertManagerV1CertificateRequest cr;
  final Resource resource;

  @override
  State<PluginCertManagerDeny> createState() => _PluginCertManagerDenyState();
}

class _PluginCertManagerDenyState extends State<PluginCertManagerDeny> {
  bool _isLoading = false;

  Future<void> _deny() async {
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

      final now = DateTime.now().toRFC3339();
      final conditionIndex = widget.cr.status?.conditions?.indexWhere(
        (e) => e.type == 'Denied',
      );

      final String body =
          widget.cr.status?.conditions == null ||
              widget.cr.status!.conditions!.isEmpty
          ? '[{"op":"add","path":"/status/conditions","value":[{"type":"Denied","status":"True","lastTransitionTime":"$now","reason":"KubenavCertManager","message":"manually denied by kubenav"}]}]'
          : conditionIndex == null
          ? '[{"op":"add","path":"/status/conditions/${widget.cr.status?.conditions != null ? widget.cr.status!.conditions!.length + 1 : 0}","value":{"type":"Denied","status":"True","lastTransitionTime":"$now","reason":"KubenavCertManager","message":"manually denied by kubenav"}}]'
          : '[{"op":"replace","path":"/status/conditions/$conditionIndex","value":{"type":"Denied","status":"True","lastTransitionTime":"$now","reason":"KubenavCertManager","message":"manually denied by kubenav"}}]';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.resource.path}/namespace/${widget.namespace}/${widget.resource.resource}/${widget.name}/status';

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
          '${widget.resource.singular} Denied',
          'The ${widget.resource.singular} ${widget.name} was denied',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'PluginCertManagerDeny _deny',
        'Failed to Deny ${widget.resource.singular}',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Deny ${widget.resource.singular}',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Deny',
      subtitle: widget.name,
      icon: Icons.block,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Deny',
      actionPressed: () {
        _deny();
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
            'Do you really want to deny the ${widget.resource.singular} ${widget.name}?',
          ),
        ),
      ),
    );
  }
}
