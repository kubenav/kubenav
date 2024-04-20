import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [SettingsAddClusterManual] widget can be used to add a cluster the
/// manual way. This means that a user must provide all the information required
/// to build the Kubeconfig via seperated text fields. We then create a new
/// [Cluster] and add it to the [ClustersRepository].
class SettingsAddClusterManual extends StatefulWidget {
  const SettingsAddClusterManual({super.key});

  @override
  State<SettingsAddClusterManual> createState() =>
      _SettingsAddClusterManualState();
}

class _SettingsAddClusterManualState extends State<SettingsAddClusterManual> {
  final _addClusterManualFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _clusterServerController = TextEditingController();
  final _clusterCertificateAuthorityDataController = TextEditingController();
  bool _clusterInsecureSkipTLSVerify = false;
  final _userClientCertificateDataController = TextEditingController();
  final _userClientKeyDataController = TextEditingController();
  final _userTokenController = TextEditingController();
  final _userUsernameController = TextEditingController();
  final _userPasswordController = TextEditingController();
  final _namespaceController = TextEditingController();
  bool _isLoadingAddCluster = false;

  /// [_validator] is used to validate the required fields [_nameController] and
  /// [_clusterServerController]. If they are missing the validation of the form
  /// will fail and the cluster will not be added to our list of clusters.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  /// [_addCluster] adds a new cluster to our global list of clusters. Before we
  /// add the cluster we validate all the form values which have an validator.
  /// We also modify the user input to remove a possible trailing '/' from the
  /// server value and to remove possible white spaces.
  Future<void> _addCluster() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      if (_addClusterManualFormKey.currentState != null &&
          _addClusterManualFormKey.currentState!.validate()) {
        setState(() {
          _isLoadingAddCluster = true;
        });
        final Cluster cluster = Cluster(
          id: const Uuid().v4(),
          name: _nameController.text,
          clusterProviderType: ClusterProviderType.manual,
          clusterProviderId: '',
          clusterServer: _clusterServerController.text.endsWith('/')
              ? _clusterServerController.text
                  .substring(0, _clusterServerController.text.length - 1)
              : _clusterServerController.text,
          clusterCertificateAuthorityData:
              _clusterCertificateAuthorityDataController.text.trim(),
          clusterInsecureSkipTLSVerify: _clusterInsecureSkipTLSVerify,
          userClientCertificateData:
              _userClientCertificateDataController.text.trim(),
          userClientKeyData: _userClientKeyDataController.text.trim(),
          userToken: _userTokenController.text.trim(),
          userUsername: _userUsernameController.text.trim(),
          userPassword: _userPasswordController.text.trim(),
          namespace: _namespaceController.text.trim() == ''
              ? 'default'
              : _namespaceController.text.trim(),
        );

        await clustersRepository.addCluster(cluster);

        setState(() {
          _isLoadingAddCluster = false;
        });
        if (mounted) {
          Navigator.pop(context);
          showSnackbar(
            context,
            'Cluster added',
            'The cluster ${cluster.name} was added',
          );
        }
      }
    } catch (err) {
      setState(() {
        _isLoadingAddCluster = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not add cluster',
          err.toString(),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _clusterServerController.dispose();
    _clusterCertificateAuthorityDataController.dispose();
    _userClientCertificateDataController.dispose();
    _userClientKeyDataController.dispose();
    _userTokenController.dispose();
    _userUsernameController.dispose();
    _userPasswordController.dispose();
    _namespaceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.manual.title(),
      subtitle: ClusterProviderType.manual.subtitle(),
      icon: ClusterProviderType.manual.icon(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Add Cluster',
      actionPressed: () {
        _addCluster();
      },
      actionIsLoading: _isLoadingAddCluster,
      child: Form(
        key: _addClusterManualFormKey,
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
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  validator: _validator,
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _clusterServerController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Server',
                  ),
                  validator: _validator,
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _clusterCertificateAuthorityDataController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Certificate Authority Data',
                  ),
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Insecure Skip TLS Verify'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (val) => {
                        setState(() {
                          _clusterInsecureSkipTLSVerify =
                              !_clusterInsecureSkipTLSVerify;
                        }),
                      },
                      value: _clusterInsecureSkipTLSVerify,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _userClientCertificateDataController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client Certificate Data',
                  ),
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _userClientKeyDataController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client Key Data',
                  ),
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _userTokenController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Token',
                  ),
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _userUsernameController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _userPasswordController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _namespaceController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Namespace',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
