import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class CreateSSHPod extends StatefulWidget {
  const CreateSSHPod({
    super.key,
    required this.name,
    required this.node,
    required this.resource,
  });

  final String name;
  final IoK8sApiCoreV1Node node;
  final Resource resource;

  @override
  State<CreateSSHPod> createState() => _CreateSSHPodState();
}

class _CreateSSHPodState extends State<CreateSSHPod> {
  final podName = 'ssh-node-${generateRandomString(6)}';
  final _createFormKey = GlobalKey<FormState>();
  final _namespaceController = TextEditingController();
  bool _isLoading = false;

  /// [_validator] is used to validate the required field
  /// [_namespaceController]. If the value is empty the validation fails.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  Future<void> _create() async {
    if (_createFormKey.currentState != null &&
        _createFormKey.currentState!.validate()) {
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
            '${resourcePod.path}/namespaces/${_namespaceController.text}/${resourcePod.resource}';
        final body =
            '{"apiVersion":"v1","kind":"Pod","metadata":{"name":"$podName","namespace":"${_namespaceController.text}"},"spec":{"nodeName":"${widget.name}","containers":[{"name":"ssh-node","image":"busybox","imagePullPolicy":"IfNotPresent","command":["chroot","/host"],"tty":true,"stdin":true,"stdinOnce":true,"securityContext":{"privileged":true},"volumeMounts":[{"name":"host","mountPath":"/host"}]}],"volumes":[{"name":"host","hostPath":{"path":"/"}}],"hostNetwork":true,"hostIPC":true,"hostPID":true,"restartPolicy":"Never","tolerations":[{"effect":"NoSchedule","key":"node-role.kubernetes.io/master"},{"effect":"NoExecute","operator":"Exists"}]}}';

        await KubernetesService(
          cluster: cluster!,
          proxy: appRepository.settings.proxy,
          timeout: appRepository.settings.timeout,
        ).postRequest(
          url,
          body,
        );

        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          showSnackbar(
            context,
            '$podName Created',
            'The $podName Pod was create in the Namespace ${_namespaceController.text} on the Node ${widget.name}.',
          );
          Navigator.pop(context);
        }
      } catch (err) {
        Logger.log(
          'CreateSSHPod _create',
          'Failed to Create Pod $podName',
          err,
        );
        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          showSnackbar(
            context,
            'Failed to Create Pod $podName',
            err.toString(),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _namespaceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'SSH',
      subtitle: widget.name,
      icon: Icons.terminal,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Create Pod',
      actionPressed: () {
        _create();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _createFormKey,
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
                  'Create a SSH Pod $podName on Node ${widget.name} in the provided Namespace:',
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _namespaceController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Namespace',
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
