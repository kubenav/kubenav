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

class PluginFluxDetailsResume extends StatefulWidget {
  const PluginFluxDetailsResume({
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
  State<PluginFluxDetailsResume> createState() =>
      _PluginFluxDetailsResumeState();
}

class _PluginFluxDetailsResumeState extends State<PluginFluxDetailsResume> {
  bool _isLoading = false;

  Future<void> _resume() async {
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
          ? '[{ "op": "replace", "path": "/spec/suspend", "value": false }]'
          : '[{ "op": "add", "path": "/spec/suspend", "value": false }]';

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
          '${widget.resource.titleSingular} resumed',
          'The ${widget.resource.titleSingular} ${widget.name} in namespace ${widget.namespace} was resumed',
        );
        Navigator.pop(context);
      }
    } on PlatformException catch (err) {
      Logger.log(
        'PluginFluxDetailsResume _resume',
        'Failed to resume resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to resume ${widget.resource.titleSingular}',
          err.toString(),
        );
      }
    } catch (err) {
      Logger.log(
        'PluginFluxDetailsResume _resume',
        'Failed to resume resource',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to resume ${widget.resource.titleSingular}',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Resume',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.play_arrow,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Resume',
      actionPressed: () {
        _resume();
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
            'Do you really want to resume the ${widget.resource.titleSingular} ${widget.namespace}/${widget.name}?',
          ),
        ),
      ),
    );
  }
}
