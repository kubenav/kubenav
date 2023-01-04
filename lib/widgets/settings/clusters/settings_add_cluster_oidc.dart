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
    Key? key,
    required this.provider,
  }) : super(key: key);

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
  Future<void> _addCluster(BuildContext context) async {
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
            'Cluster added',
            'The cluster ${cluster.name} was added',
          );
        }
      }
    } catch (err) {
      setState(() {
        _isLoadingAddCluster = false;
      });
      showSnackbar(
        'Could not add cluster',
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.oidc.title(),
      subtitle: ClusterProviderType.oidc.subtitle(),
      icon: ClusterProviderType.oidc.image54x54(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Add Clusters',
      actionPressed: () {
        _addCluster(context);
      },
      actionIsLoading: _isLoadingAddCluster,
      child: Form(
        key: _addClusterOIDCFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
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
                  Switch(
                    activeColor: Constants.colorPrimary,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
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
            ),
          ],
        ),
      ),
    );
  }
}
