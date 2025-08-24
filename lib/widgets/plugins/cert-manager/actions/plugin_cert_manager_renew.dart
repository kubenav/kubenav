import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/time.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [PluginCertManagerRenew] widget is used to renew a cert-manager
/// certificate. To renew the certificate we have to send a json patch to issue
/// a new certificate.
///
/// See https://github.com/cert-manager/cmctl/blob/28d1f8cacbd30968b4087b1c445bb6d98f914105/pkg/renew/renew.go#L223
class PluginCertManagerRenew extends StatefulWidget {
  const PluginCertManagerRenew({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
    required this.certificate,
  });

  final String name;
  final String namespace;
  final Resource resource;
  final IoCertManagerV1Certificate certificate;

  @override
  State<PluginCertManagerRenew> createState() => _PluginCertManagerRenewState();
}

class _PluginCertManagerRenewState extends State<PluginCertManagerRenew> {
  bool _isLoading = false;

  Future<void> _renew() async {
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
      final conditionIndex = widget.certificate.status?.conditions.indexWhere(
        (e) => e.type == 'Issuing',
      );

      final String body =
          widget.certificate.status?.conditions == null ||
              widget.certificate.status!.conditions.isEmpty
          ? '[{"op":"add","path":"/status/conditions","value":[{"type":"Issuing","status":"True","lastTransitionTime":"$now","reason":"ManuallyTriggered","message":"Certificate re-issuance manually triggered","observedGeneration":${widget.certificate.metadata?.generation ?? 1}}]}]'
          : conditionIndex == null
          ? '[{"op":"add","path":"/status/conditions/${widget.certificate.status?.conditions != null ? widget.certificate.status!.conditions.length + 1 : 0}","value":{"type":"Issuing","status":"True","lastTransitionTime":"$now","reason":"ManuallyTriggered","message":"Certificate re-issuance manually triggered","observedGeneration":${widget.certificate.metadata?.generation ?? 1}}}]'
          : '[{"op":"replace","path":"/status/conditions/$conditionIndex","value":{"type":"Issuing","status":"True","lastTransitionTime":"$now","reason":"ManuallyTriggered","message":"Certificate re-issuance manually triggered","observedGeneration":${widget.certificate.metadata?.generation ?? 1}}}]';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );

      final url =
          '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}/status';

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
          '${widget.resource.singular} Renewed',
          'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was renewed',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'PluginCertManagerRenew _renew',
        'Failed to Renew ${widget.resource.singular}',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Renew ${widget.resource.singular}',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Renew',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.restart_alt,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Renew',
      actionPressed: () {
        _renew();
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
            'Do you really want to manually renew the ${widget.resource.singular} ${widget.namespace}/${widget.name}?',
          ),
        ),
      ),
    );
  }
}
