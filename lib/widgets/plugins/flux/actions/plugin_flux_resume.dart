import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta2_helm_release.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_bucket.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_helm_chart.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_helm_repository.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_oci_repository.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [PluginFluxResume] is used to resume a Flux resource. When the user
/// presses the action button, the resource is resumed by setting the
/// `spec.suspend` field to `false` for the provided [item].
class PluginFluxResume extends StatefulWidget {
  const PluginFluxResume({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
    required this.item,
  });

  final String name;
  final String namespace;
  final Resource resource;
  final dynamic item;

  @override
  State<PluginFluxResume> createState() => _PluginFluxResumeState();
}

class _PluginFluxResumeState extends State<PluginFluxResume> {
  bool _isLoading = false;

  /// [_resume] is used to resume the provided [item]. The resumption is done
  /// by setting the `spec.suspend` field to `true`.
  /// The user gets a snackbar message if the resumption was successful or
  /// failed.
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

      if (widget.item is! IoFluxcdToolkitSourceV1GitRepository &&
          widget.item is! IoFluxcdToolkitSourceV1beta2OCIRepository &&
          widget.item is! IoFluxcdToolkitSourceV1beta2Bucket &&
          widget.item is! IoFluxcdToolkitSourceV1beta2HelmRepository &&
          widget.item is! IoFluxcdToolkitSourceV1beta2HelmChart &&
          widget.item is! IoFluxcdToolkitKustomizeV1Kustomization &&
          widget.item is! IoFluxcdToolkitHelmV2beta2HelmRelease) {
        throw 'Unsupported Resource';
      }

      final String body =
          widget.item.spec != null && widget.item.spec.suspend != null
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
          '${widget.resource.singular} Resumed',
          'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was resumed',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'PluginFluxResume _resume',
        'Resumption Failed',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Resumption Failed',
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
            'Do you really want to resume the ${widget.resource.singular} ${widget.namespace}/${widget.name}?',
          ),
        ),
      ),
    );
  }
}
