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

class CSRApprove extends StatefulWidget {
  const CSRApprove({
    super.key,
    required this.name,
    required this.csr,
    required this.resource,
  });

  final String name;
  final IoK8sApiCertificatesV1CertificateSigningRequest csr;
  final Resource resource;

  @override
  State<CSRApprove> createState() => _CSRApproveState();
}

class _CSRApproveState extends State<CSRApprove> {
  bool _isLoading = false;

  Future<void> _approve() async {
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

      final String body =
          '{"status": {"conditions": [{"type": "Approved", "status": "True", "reason": "KubenavApprove", "message": "This CSR was approved by kubenav certificate approve.", "lastUpdateTime": "${DateTime.now().toRFC3339()}", "lastTransitionTime": null}]}}';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.resource.path}/${widget.resource.resource}/${widget.name}/approval?fieldManager=kubenav';

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
          '${widget.resource.singular} Approved',
          'The ${widget.resource.singular} ${widget.name} was approved',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'CSRApprove _approve',
        'Failed to Approve ${widget.resource.singular}',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Approve ${widget.resource.singular}',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Approve',
      subtitle: widget.name,
      icon: Icons.task_alt,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Approve',
      actionPressed: () {
        _approve();
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
            'Do you really want to approve the ${widget.resource.singular} ${widget.name}?',
          ),
        ),
      ),
    );
  }
}
