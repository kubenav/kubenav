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
          widget.item is! IoFluxcdToolkitSourceV1OCIRepository &&
          widget.item is! IoFluxcdToolkitSourceV1Bucket &&
          widget.item is! IoFluxcdToolkitSourceV1HelmRepository &&
          widget.item is! IoFluxcdToolkitSourceV1HelmChart &&
          widget.item is! IoFluxcdToolkitKustomizeV1Kustomization &&
          widget.item is! IoFluxcdToolkitHelmV2HelmRelease) {
        throw 'Unsupported Resource';
      }

      final String body =
          '{"metadata": {"annotations": {"reconcile.fluxcd.io/requestedAt": "${DateTime.now().toRFC3339Nano()}"}}}';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );

      final url =
          '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}?fieldManager=kubenav';

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
        showSnackbar(context, 'Reconciliation Failed', err.toString());
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
