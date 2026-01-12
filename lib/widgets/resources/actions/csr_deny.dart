import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/certificatesigningrequestlist_certificates_v1.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/time.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class CSRDeny extends StatefulWidget {
  const CSRDeny({
    super.key,
    required this.name,
    required this.csr,
    required this.resource,
  });

  final String name;
  final Item csr;
  final Resource resource;

  @override
  State<CSRDeny> createState() => _CSRDenyState();
}

class _CSRDenyState extends State<CSRDeny> {
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
      final String body =
          '[{"op":"add","path":"/status/conditions","value":[{"type":"Denied","status":"True","reason":"KubenavDeny","message":"This CSR was denied by kubenav certificate deny.","lastUpdateTime":"$now","lastTransitionTime":null}]}]';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.resource.path}/${widget.resource.resource}/${widget.name}/approval';

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
        'CSRDeny _deny',
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
