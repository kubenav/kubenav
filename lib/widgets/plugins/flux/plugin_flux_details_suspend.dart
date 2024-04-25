import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class PluginFluxDetailsSuspend extends StatefulWidget {
  const PluginFluxDetailsSuspend({
    super.key,
    required this.resource,
    required this.namespace,
    required this.name,
    required this.manifest,
  });

  final Resource resource;
  final String namespace;
  final String name;
  final Map<String, dynamic> manifest;

  @override
  State<PluginFluxDetailsSuspend> createState() =>
      _PluginFluxDetailsSuspendState();
}

class _PluginFluxDetailsSuspendState extends State<PluginFluxDetailsSuspend> {
  bool _isLoading = false;

  Future<void> _suspend() async {
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

      final String body = widget.manifest['spec'] != null &&
              widget.manifest['spec']['suspend'] != null
          ? '[{ "op": "replace", "path": "/spec/suspend", "value": true }]'
          : '[{ "op": "add", "path": "/spec/suspend", "value": true }]';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}';

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
          '${widget.resource.titleSingular} suspended',
          'The ${widget.resource.titleSingular} ${widget.name} in namespace ${widget.namespace} was suspended',
        );
        Navigator.pop(context);
      }
    } on PlatformException catch (err) {
      Logger.log(
        'PluginFluxDetailsSuspend _suspend',
        'Failed to suspend resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to suspend ${widget.resource.titleSingular}',
          err.toString(),
        );
      }
    } catch (err) {
      Logger.log(
        'PluginFluxDetailsSuspend _suspend',
        'Failed to suspend resource',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to suspend ${widget.resource.titleSingular}',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Suspend',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.pause,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Suspend',
      actionPressed: () {
        _suspend();
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
            'Do you really want to suspend the ${widget.resource.titleSingular} ${widget.namespace}/${widget.name}?',
          ),
        ),
      ),
    );
  }
}
