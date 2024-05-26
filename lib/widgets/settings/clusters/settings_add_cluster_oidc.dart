import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [SettingsAddClusterOIDC] widget can be used to add a cluster via a
/// formerly configured OIDC provider. For this a valid [provider] configuration
/// is required.
class SettingsAddClusterOIDC extends StatefulWidget {
  const SettingsAddClusterOIDC({
    super.key,
    required this.provider,
  });

  final ClusterProvider provider;

  @override
  State<SettingsAddClusterOIDC> createState() => _SettingsAddClusterOIDCState();
}

class _SettingsAddClusterOIDCState extends State<SettingsAddClusterOIDC> {
  final _addClusterOIDCFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _clusterServerController = TextEditingController();
  final _clusterCertificateAuthorityDataController = TextEditingController();
  bool _clusterInsecureSkipTLSVerify = false;
  final _namespaceController = TextEditingController();
  bool _isLoadingAddCluster = false;

  /// [_validator] is used to validate all the required fields. If they are
  /// missing the validation of the form will fail.
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
      if (_addClusterOIDCFormKey.currentState != null &&
          _addClusterOIDCFormKey.currentState!.validate()) {
        setState(() {
          _isLoadingAddCluster = true;
        });
        final cluster = Cluster(
          id: const Uuid().v4(),
          name: _nameController.text,
          clusterProviderType: ClusterProviderType.oidc,
          clusterProviderId: widget.provider.id ?? '',
          clusterServer: _clusterServerController.text.endsWith('/')
              ? _clusterServerController.text
                  .substring(0, _clusterServerController.text.length - 1)
              : _clusterServerController.text,
          clusterCertificateAuthorityData:
              _clusterCertificateAuthorityDataController.text.trim(),
          clusterInsecureSkipTLSVerify: _clusterInsecureSkipTLSVerify,
          userClientCertificateData: '',
          userClientKeyData: '',
          userToken: '',
          userUsername: '',
          userPassword: '',
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
            'Cluster Added',
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
          'Failed to Add Cluster',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.oidc.title(),
      subtitle: ClusterProviderType.oidc.subtitle(),
      icon: ClusterProviderType.oidc.icon(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Add Clusters',
      actionPressed: () {
        _addCluster();
      },
      actionIsLoading: _isLoadingAddCluster,
      child: Form(
        key: _addClusterOIDCFormKey,
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
                  onFieldSubmitted: (String value) {
                    _addCluster();
                  },
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
                  onFieldSubmitted: (String value) {
                    _addCluster();
                  },
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
                  onFieldSubmitted: (String value) {
                    _addCluster();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Insecure Skip TLS Verify'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _clusterInsecureSkipTLSVerify =
                              !_clusterInsecureSkipTLSVerify;
                        });
                      },
                      value: _clusterInsecureSkipTLSVerify,
                    ),
                  ],
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
                  onFieldSubmitted: (String value) {
                    _addCluster();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
