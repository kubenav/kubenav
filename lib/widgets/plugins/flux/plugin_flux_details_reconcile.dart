import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

String _fourDigits(int n) {
  int absN = n.abs();
  String sign = n < 0 ? '-' : '';
  if (absN >= 1000) return '$n';
  if (absN >= 100) return '${sign}0$absN';
  if (absN >= 10) return '${sign}00$absN';
  return '${sign}000$absN';
}

String _sixDigits(int n) {
  assert(n < -9999 || n > 9999);
  int absN = n.abs();
  String sign = n < 0 ? '-' : '+';
  if (absN >= 100000) return '$sign$absN';
  return '${sign}0$absN';
}

String _threeDigits(int n) {
  if (n >= 100) return '$n';
  if (n >= 10) return '0$n';
  return '00$n';
}

String _twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}

String _rFC3339Nano(DateTime time) {
  final t = time.toUtc();

  String y = (t.year >= -9999 && t.year <= 9999)
      ? _fourDigits(t.year)
      : _sixDigits(t.year);
  String m = _twoDigits(t.month);
  String d = _twoDigits(t.day);
  String h = _twoDigits(t.hour);
  String min = _twoDigits(t.minute);
  String sec = _twoDigits(t.second);
  String ms = _threeDigits(t.millisecond);
  String us = t.microsecond == 0 ? '' : _threeDigits(t.microsecond);

  return '$y-$m-${d}T$h:$min:$sec.$ms$us+00:00';
}

class PluginFluxDetailsReconcile extends StatefulWidget {
  const PluginFluxDetailsReconcile({
    super.key,
    required this.resource,
    required this.namespace,
    required this.name,
    required this.item,
  });

  final FluxResource resource;
  final String namespace;
  final String name;
  final Map<String, dynamic> item;

  @override
  State<PluginFluxDetailsReconcile> createState() =>
      _PluginFluxDetailsReconcileState();
}

class _PluginFluxDetailsReconcileState
    extends State<PluginFluxDetailsReconcile> {
  bool _isLoading = false;

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

      final now = _rFC3339Nano(DateTime.now());
      final String body = widget.item['metadata'] != null &&
              widget.item['metadata']['annotations'] != null
          ? widget.item['metadata']['annotations']
                      ['reconcile.fluxcd.io/requestedAt'] !=
                  null
              ? '[{"op": "replace", "path": "/metadata/annotations/reconcile.fluxcd.io~1requestedAt", "value": "$now"}]'
              : '[{"op": "add", "path": "/metadata/annotations/reconcile.fluxcd.io~1requestedAt", "value": "$now"}]'
          : '[{"op": "add", "path": "/metadata/annotations", "value": {"reconcile.fluxcd.io/requestedAt": "$now"}}]';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.resource.api.path}/namespaces/${widget.namespace}/${widget.resource.api.resource}/${widget.name}';

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
          '${widget.resource.singular} reconciled',
          'The ${widget.resource.singular} ${widget.name} in namespace ${widget.namespace} was reconciled',
        );
        Navigator.pop(context);
      }
    } on PlatformException catch (err) {
      Logger.log(
        'PluginFluxDetailsReconcile _reconcile',
        'Failed to reconcile resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to reconcile ${widget.resource.singular}',
          err.toString(),
        );
      }
    } catch (err) {
      Logger.log(
        'PluginFluxDetailsReconcile _reconcile',
        'Failed to reconcile resource',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to reconcile ${widget.resource.singular}',
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
