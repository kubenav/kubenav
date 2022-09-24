import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubeconfig_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class AddClusterKubeconfigController extends GetxController {
  ClusterController clusterController = Get.find();

  final addClusterKubeconfigFormKey = GlobalKey<FormState>();
  final kubeconfig = TextEditingController();

  @override
  void onClose() {
    kubeconfig.dispose();

    super.onClose();
  }

  /// [validator] is used to validate the required fields [name] and [server]. If they are missing the validation of
  /// the form will fail and the cluster will not be added to our list of clusters.
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  void selectKubeconfigFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['yaml', 'yml', 'txt', 'conf'],
      );

      if (result != null && result.files.single.path != null) {
        final File file = File(result.files.single.path!);
        final kubeconfigFileContent = await file.readAsString();
        kubeconfig.text = kubeconfigFileContent;
      }
    } catch (err) {
      Logger.log(
        'AddClusterKubeconfigController selectKubeconfigFile',
        'Could not select file: $err',
      );
    }
  }

  /// [addCluster] adds a new cluster to our global list of clusters. Before we add the cluster we validate all the form
  /// values which have an validator. We also modify the user input to remove a possible trailing '/' from the server
  /// value and to remove possible white spaces.
  void addCluster(BuildContext context) {
    if (addClusterKubeconfigFormKey.currentState != null &&
        addClusterKubeconfigFormKey.currentState!.validate()) {
      try {
        var isError = false;
        var count = 0;

        final clusters = Kubeconfig.fromJson(
          json.decode(
            json.encode(
              loadYaml(
                kubeconfig.text,
              ),
            ),
          ),
        ).getClusters('kubeconfig', '');

        for (var cluster in clusters) {
          final error = clusterController.addCluster(cluster);
          if (error != null) {
            isError = true;
            snackbar('Could not add cluster', error);
          } else {
            count = count + 1;
          }
        }

        snackbar('Clusters added', '$count clusters were added');

        if (!isError) {
          finish(context);
        }
      } catch (err) {
        snackbar(
          'Could not add cluster(s)',
          err.toString(),
        );
      }
    }
  }
}

class AddClusterKubeconfigWidget extends StatelessWidget {
  const AddClusterKubeconfigWidget({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final Provider provider;

  @override
  Widget build(BuildContext context) {
    AddClusterKubeconfigController controller = Get.put(
      AddClusterKubeconfigController(),
    );

    return AppBottomSheetWidget(
      title: provider.title,
      subtitle: provider.subtitle,
      icon: provider.image54x54,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Add Clusters',
      onActionPressed: () {
        controller.addCluster(context);
      },
      child: Form(
        key: controller.addClusterKubeconfigFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.colorPrimary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Constants.sizeBorderRadius,
                    ),
                  ),
                ),
                onPressed: () {
                  controller.selectKubeconfigFile();
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
                  Text('or paste content',
                      style: secondaryTextStyle(
                        context,
                      )),
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
                controller: controller.kubeconfig,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kubeconfig',
                ),
                validator: controller.validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
