import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/cluster_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class EditClusterController extends GetxController {
  ClusterController clusterController = Get.find();

  final int clusterIndex;
  late Cluster cluster;

  EditClusterController({
    required this.clusterIndex,
  });

  final editClusterFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final clusterServer = TextEditingController();
  final clusterCertificateAuthorityData = TextEditingController();
  RxBool clusterInsecureSkipTLSVerify = false.obs;
  final userClientCertificateData = TextEditingController();
  final userClientKeyData = TextEditingController();
  final userToken = TextEditingController();
  final userUsername = TextEditingController();
  final userPassword = TextEditingController();
  final namespace = TextEditingController();

  @override
  void onInit() {
    cluster = clusterController.clusters[clusterIndex].value;

    name.text = cluster.name;
    clusterServer.text = cluster.clusterServer;
    clusterCertificateAuthorityData.text =
        cluster.clusterCertificateAuthorityData;
    clusterInsecureSkipTLSVerify.value = cluster.clusterInsecureSkipTLSVerify;
    userClientCertificateData.text = cluster.userClientCertificateData;
    userClientKeyData.text = cluster.userClientKeyData;
    userToken.text = cluster.userToken;
    userUsername.text = cluster.userUsername;
    userPassword.text = cluster.userPassword;
    namespace.text = cluster.namespace;

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    clusterServer.dispose();
    clusterCertificateAuthorityData.dispose();
    userClientCertificateData.dispose();
    userClientKeyData.dispose();
    userToken.dispose();
    userUsername.dispose();
    userPassword.dispose();
    namespace.dispose();

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

  /// [toggleClusterInsecureSkipTLSVerify] is used to toggle the value for the [clusterInsecureSkipTLSVerify] value in
  /// the cluster configuration. This means if the value is `true` it will be set to `false` and vice versa.
  void toggleClusterInsecureSkipTLSVerify() =>
      clusterInsecureSkipTLSVerify.value =
          clusterInsecureSkipTLSVerify.value ? false : true;

  /// [editCluster] modifies the cluster in our global list of clusters. Before we save the cluster we validate all the
  /// form values which have an validator. We also modify the user input to remove a possible trailing '/' from the
  /// server value and to remove possible white spaces.
  void editCluster(BuildContext context) {
    if (editClusterFormKey.currentState != null &&
        editClusterFormKey.currentState!.validate()) {
      final error = clusterController.editCluster(
        clusterIndex,
        name.text,
        clusterServer.text.endsWith('/')
            ? clusterServer.text.substring(0, clusterServer.text.length - 1)
            : clusterServer.text,
        clusterCertificateAuthorityData.text.trim(),
        clusterInsecureSkipTLSVerify.value,
        userClientCertificateData.text.trim(),
        userClientKeyData.text.trim(),
        userToken.text.trim(),
        userUsername.text.trim(),
        userPassword.text.trim(),
        namespace.text.trim() == '' ? 'default' : namespace.text.trim(),
      );
      if (error != null) {
        snackbar('Could not save cluster', error);
      } else {
        snackbar('Changes were saved', 'The cluster ${name.text} was saved');
        finish(context);
      }
    }
  }
}

class EditClusterWidget extends StatelessWidget {
  const EditClusterWidget({
    Key? key,
    required this.clusterIndex,
  }) : super(key: key);

  final int clusterIndex;

  @override
  Widget build(BuildContext context) {
    EditClusterController controller = Get.put(
      EditClusterController(clusterIndex: clusterIndex),
    );

    return AppBottomSheetWidget(
      title: 'Edit',
      subtitle: 'Edit ${controller.cluster.name}',
      icon: Icons.edit,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Save',
      onActionPressed: () {
        controller.editCluster(context);
      },
      child: Form(
        key: controller.editClusterFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.name,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.clusterServer,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Server',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.clusterCertificateAuthorityData,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Certificate Authority Data',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Insecure Skip TLS Verify"),
                  Obx(
                    () => Switch(
                      activeColor: Constants.colorPrimary,
                      onChanged: (val) =>
                          controller.toggleClusterInsecureSkipTLSVerify(),
                      value: controller.clusterInsecureSkipTLSVerify.value,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.userClientCertificateData,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Client Certificate Data',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.userClientKeyData,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Client Key Data',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.userToken,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Token',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.userUsername,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.userPassword,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.namespace,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Namespace',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
