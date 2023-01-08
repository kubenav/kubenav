import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/models/kubernetes_extensions/kubeconfig.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [SettingsAddClusterKubeconfig] can be used to add a list of clusters
/// to the app via a Kubeconfig file. The user can select the file from his
/// local file system or by pasting the content in the corresponding text field.
class SettingsAddClusterKubeconfig extends StatefulWidget {
  const SettingsAddClusterKubeconfig({super.key});

  @override
  State<SettingsAddClusterKubeconfig> createState() =>
      _SettingsAddClusterKubeconfigState();
}

class _SettingsAddClusterKubeconfigState
    extends State<SettingsAddClusterKubeconfig> {
  final _addClusterKubeconfigFormKey = GlobalKey<FormState>();
  final _kubeconfigController = TextEditingController();
  bool _isLoadingAddCluster = false;

  /// [_validator] is used to validate the required field
  /// [_kubeconfigController]. If this field is missing the validation of the
  /// form will fail and the cluster will not be added to our list of clusters.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  /// [_selectKubeconfigFile] allows users to add a Kubeconfig file from his
  /// phone. The content of the selected file will then be put into the
  /// [_kubeconfigController] text field.
  ///
  /// NOTE: If Apple complains about access to the photo gallery we have to add
  /// the `type` and `allowedExtensions` fields again.
  Future<void> _selectKubeconfigFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        // type: FileType.custom,
        // allowedExtensions: ['yaml', 'yml', 'txt', 'conf'],
      );

      if (result != null && result.files.single.path != null) {
        final File file = File(result.files.single.path!);
        final kubeconfigFileContent = await file.readAsString();
        _kubeconfigController.text = kubeconfigFileContent;
      }
    } catch (err) {
      Logger.log(
        'SettingsAddClusterKubeconfig _selectKubeconfigFile',
        'Could not select file: $err',
      );
    }
  }

  /// [_addCluster] adds a new cluster to our global list of clusters. Before we
  /// add the cluster we validate all the form values which have an validator.
  Future<void> _addCluster(BuildContext context) async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    if (_addClusterKubeconfigFormKey.currentState != null &&
        _addClusterKubeconfigFormKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoadingAddCluster = true;
        });

        var count = 0;
        final clusters = await Kubeconfig.fromJson(
          json.decode(
            json.encode(
              loadYaml(
                _kubeconfigController.text,
              ),
            ),
          ),
        ).getClusters(
          ClusterProviderType.kubeconfig,
          '',
        );

        for (var cluster in clusters) {
          await clustersRepository.addCluster(cluster);
          count = count + 1;
        }

        setState(() {
          _isLoadingAddCluster = false;
        });
        if (mounted) {
          showSnackbar(
            context,
            'Clusters were added',
            '$count clusters were added',
          );
          Navigator.pop(context);
        }
      } catch (err) {
        setState(() {
          _isLoadingAddCluster = false;
        });
        showSnackbar(
          context,
          'Could not add clusters',
          err.toString(),
        );
      }
    }
  }

  @override
  void dispose() {
    _kubeconfigController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.kubeconfig.title(),
      subtitle: ClusterProviderType.kubeconfig.subtitle(),
      icon: ClusterProviderType.kubeconfig.icon(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Add Clusters',
      actionPressed: () {
        _addCluster(context);
      },
      actionIsLoading: _isLoadingAddCluster,
      child: Form(
        key: _addClusterKubeconfigFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme(context).colorPrimary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Constants.sizeBorderRadius,
                    ),
                  ),
                ),
                onPressed: () {
                  _selectKubeconfigFile();
                },
                child: Text(
                  'Select Kubeconfig',
                  style: primaryTextStyle(
                    context,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Constants.spacingMiddle,
                bottom: Constants.spacingMiddle,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      height: 0,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'or paste content',
                    style: secondaryTextStyle(
                      context,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      height: 0,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: TextFormField(
                controller: _kubeconfigController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kubeconfig',
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
