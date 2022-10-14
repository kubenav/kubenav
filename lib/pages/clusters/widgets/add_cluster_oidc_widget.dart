import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/cluster_model.dart';
import 'package:kubenav/models/provider_config_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class AddClusterOIDCController extends GetxController {
  ClusterController clusterController = Get.find();
  final ProviderConfig providerConfig;

  final addClusterOIDCFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final clusterServer = TextEditingController();
  final clusterCertificateAuthorityData = TextEditingController();
  RxBool clusterInsecureSkipTLSVerify = false.obs;
  final namespace = TextEditingController();

  AddClusterOIDCController({
    required this.providerConfig,
  });

  @override
  void onClose() {
    name.dispose();
    clusterServer.dispose();
    clusterCertificateAuthorityData.dispose();
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

  /// [addCluster] adds a new cluster to our global list of clusters. Before we add the cluster we validate all the form
  /// values which have an validator. We also modify the user input to remove a possible trailing '/' from the server
  /// value and to remove possible white spaces.
  void addCluster(BuildContext context) {
    if (addClusterOIDCFormKey.currentState != null &&
        addClusterOIDCFormKey.currentState!.validate()) {
      final Cluster cluster = Cluster(
        name: name.text,
        provider: 'oidc',
        providerConfig: providerConfig.name,
        clusterServer: clusterServer.text.endsWith('/')
            ? clusterServer.text.substring(0, clusterServer.text.length - 1)
            : clusterServer.text,
        clusterCertificateAuthorityData:
            clusterCertificateAuthorityData.text.trim(),
        clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify.value,
        userClientCertificateData: '',
        userClientKeyData: '',
        userToken: '',
        userUsername: '',
        userPassword: '',
        namespace:
            namespace.text.trim() == '' ? 'default' : namespace.text.trim(),
      );

      final error = clusterController.addCluster(cluster);
      if (error != null) {
        snackbar('Could not add cluster', error);
      } else {
        snackbar('Cluster added', 'The cluster ${cluster.name} was added');
        finish(context);
      }
    }
  }
}

class AddClusterOIDCWidget extends StatelessWidget {
  const AddClusterOIDCWidget({
    Key? key,
    required this.providerConfig,
  }) : super(key: key);

  final ProviderConfig providerConfig;

  @override
  Widget build(BuildContext context) {
    AddClusterOIDCController controller = Get.put(
      AddClusterOIDCController(providerConfig: providerConfig),
    );

    return AppBottomSheetWidget(
      title: Providers.oidc.title,
      subtitle: Providers.oidc.subtitle,
      icon: Providers.oidc.image54x54,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Add Cluster',
      onActionPressed: () {
        controller.addCluster(context);
      },
      child: Form(
        key: controller.addClusterOIDCFormKey,
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
                  const Text('Insecure Skip TLS Verify'),
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
