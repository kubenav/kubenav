import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_deployment.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_stateful_set.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [ScaleResource] widget can be used to scale a Deployment or StatefulSet
/// bv adjusting the number of replicas via a JSON patch which is send to the
/// Kubernetes API.
class ScaleResource extends StatefulWidget {
  const ScaleResource({
    super.key,
    required this.name,
    required this.namespace,
    required this.item,
    required this.resource,
  });

  final String name;
  final String namespace;
  final dynamic item;
  final Resource resource;

  @override
  State<ScaleResource> createState() => _ScaleResourceState();
}

class _ScaleResourceState extends State<ScaleResource> {
  final _scaleFormKey = GlobalKey<FormState>();
  final _replicasController = TextEditingController();
  bool _isLoading = false;

  /// [_validator] is used to validate the required field [_replicasController].
  /// If the value is empty or not a number the validation fails.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    final parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      return 'The field must be a number';
    }

    if (parsedValue < 0) {
      return 'The field must be a positive number';
    }

    return null;
  }

  /// [_scale] scales the provided Deployment or StatefulSet by sending a JSON
  /// patch to the Kubernetes API. The user gets a snackbar message if the
  /// scaling was successful or failed.
  Future<void> _scale() async {
    if (_scaleFormKey.currentState != null &&
        _scaleFormKey.currentState!.validate()) {
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

        final cluster = await clustersRepository.getClusterWithCredentials(
          clustersRepository.activeClusterId,
        );
        final url =
            '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}';

        await KubernetesService(
          cluster: cluster!,
          proxy: appRepository.settings.proxy,
          timeout: appRepository.settings.timeout,
        ).patchRequest(
          url,
          '[{"op": "replace", "path": "/spec/replicas", "value": ${int.parse(_replicasController.text)}}]',
        );

        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          showSnackbar(
            context,
            '${widget.resource.singular} Scaled',
            'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was scaled to ${_replicasController.text} replicas.',
          );
          Navigator.pop(context);
        }
      } catch (err) {
        Logger.log(
          'ScaleResource _scale',
          'Failed to Scale ${widget.resource.singular}',
          err,
        );
        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          showSnackbar(
            context,
            'Failed to Scale ${widget.resource.singular}',
            err.toString(),
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    /// Set the initial value for the [_replicasController] based on the
    /// provided item, which should be a Deployment or StatefulSet.
    if (widget.item is IoK8sApiAppsV1Deployment) {
      _replicasController.text =
          '${(widget.item as IoK8sApiAppsV1Deployment).spec?.replicas ?? 0}';
    } else if (widget.item is IoK8sApiAppsV1StatefulSet) {
      _replicasController.text =
          '${(widget.item as IoK8sApiAppsV1StatefulSet).spec?.replicas ?? 0}';
    } else {
      _replicasController.text = '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Scale',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.difference,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Scale',
      actionPressed: () {
        _scale();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _scaleFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: Constants.spacingMiddle,
              bottom: Constants.spacingMiddle,
              left: Constants.spacingMiddle,
              right: Constants.spacingMiddle,
            ),
            child: Column(
              children: [
                Text(
                  'Change the number of replicas for ${widget.resource.singular} ${widget.namespace}/${widget.name}:',
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _replicasController,
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Replicas',
                  ),
                  validator: _validator,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
