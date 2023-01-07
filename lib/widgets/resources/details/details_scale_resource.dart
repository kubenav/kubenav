import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [DetailsScaleResource] widget can be used to scale the number of
/// replicas of a Deployment and StatefulSet. The user can specify the new
/// number of replicas. When he then clicks the scale button we send a json
/// patch to the Kubernetes API with the new number of replicas.
class DetailsScaleResource extends StatefulWidget {
  const DetailsScaleResource({
    Key? key,
    required this.resource,
    required this.path,
    required this.name,
    required this.namespace,
    required this.item,
  }) : super(key: key);

  final String resource;
  final String path;
  final String name;
  final String namespace;
  final dynamic item;

  @override
  State<DetailsScaleResource> createState() => _DetailsScaleResourceState();
}

class _DetailsScaleResourceState extends State<DetailsScaleResource> {
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

  /// [_scaleResource] scales the provided Deployment or StatefulSet to the user
  /// specified number of replicas. For this we send a json patch to the
  /// Kubernetes API with the new number of replicas. If the API call succeeds
  /// we show a success message within a snackbar and close the widget. If the
  /// API call fails we show the thrown exception in a snackbar.
  Future<void> _scaleResource() async {
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
            '${widget.path}/namespaces/${widget.namespace}/${widget.resource}/${widget.name}';

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
            'Resource is scaled',
            'The resource ${widget.name} in namespace ${widget.namespace} is scaled',
          );
          Navigator.pop(context);
        }
      } on PlatformException catch (err) {
        Logger.log(
          'DetailsScaleResourceController scaleResource',
          'An error was returned while scaling the resource',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        setState(() {
          _isLoading = false;
        });
        showSnackbar(
          context,
          'Could not scale resource',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
      } catch (err) {
        Logger.log(
          'DetailsScaleResourceController scaleResource',
          'An error was returned while scaling the resource',
          err,
        );
        setState(() {
          _isLoading = false;
        });
        showSnackbar(
          context,
          'Could not scale resource',
          err.toString(),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _replicasController.text =
        widget.item['spec'] != null && widget.item['spec']['replicas'] != null
            ? '${widget.item['spec']['replicas']}'
            : '0';
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Scale',
      subtitle: widget.name,
      icon: Icons.difference,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Scale',
      actionPressed: () {
        _scaleResource();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _scaleFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                'Change the number of replicas for ${widget.name} in namespace ${widget.namespace}:',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
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
            ),
          ],
        ),
      ),
    );
  }
}
