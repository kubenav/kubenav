import 'package:flutter/foundation.dart';
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
import 'package:kubenav/utils/time.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [PluginFluxReconcile] widget is used to trigger the reconciliation of a
/// Flux resource. When the user presses the action button, the resource is
/// reconciled by setting the `reconcile.fluxcd.io/requestedAt` annotation to
/// the current time for the provided [item].
class PluginFluxReconcile extends StatefulWidget {
  const PluginFluxReconcile({
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
  State<PluginFluxReconcile> createState() => _PluginFluxReconcileState();
}

class _PluginFluxReconcileState extends State<PluginFluxReconcile> {
  bool _isLoading = false;

  /// [_reconcile] is used to reconcile the provided [item]. The reconciliation
  /// is done by setting the `reconcile.fluxcd.io/requestedAt` annotation to the
  /// current time.
  /// The user gets a snackbar message if the reconciliation was successful or
  /// failed.
  Future<void> _reconcile() async {
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

      final item = await compute(widget.resource.toJson, widget.item);
      final now = DateTime.now().toRFC3339Nano();

      final String body = item['metadata'] != null &&
              item['metadata']['annotations'] != null &&
              !item['metadata']['annotations'].isEmpty
          ? item['metadata']['annotations']
                  .containsKey('reconcile.fluxcd.io/requestedAt')
              ? '[{"op": "replace", "path": "/metadata/annotations/reconcile.fluxcd.io~1requestedAt", "value": "$now"}]'
              : '[{"op": "add", "path": "/metadata/annotations/reconcile.fluxcd.io~1requestedAt", "value": "$now"}]'
          : '[{"op": "add", "path": "/metadata/annotations", "value": {"reconcile.fluxcd.io/requestedAt": "$now"}}]';

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
          '${widget.resource.singular} Reconciled',
          'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was reconciled',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'PluginFluxReconcile _reconcile',
        'Reconciliation Failed',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Reconciliation Failed',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Reconcile',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.restart_alt,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Reconcile',
      actionPressed: () {
        _reconcile();
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
            'Do you really want to reconcile the ${widget.resource.singular} ${widget.namespace}/${widget.name}?',
          ),
        ),
      ),
    );
  }
}
