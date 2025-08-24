import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [SettingsEditCluster] widget can be used within a modal, to edit the
/// configuration of an existing cluster. Within the form it is possible to
/// change all configuration which matters for the user.
class SettingsEditCluster extends StatefulWidget {
  const SettingsEditCluster({super.key, required this.cluster});

  final Cluster cluster;

  @override
  State<SettingsEditCluster> createState() => _SettingsEditClusterState();
}

class _SettingsEditClusterState extends State<SettingsEditCluster> {
  final _editClusterFormKey = GlobalKey<FormState>();
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
  /// will fail and the cluster will not be edited.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  /// [_editCluster] modifies the cluster provided via the [widget.cluster]
  /// parameter, by replacing all the values of the provided values with the
  /// values provided via the controllers. If we can not save the cluster in the
  /// clusters repository we show a snackbar with the returned error.
  Future<void> _editCluster() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoadingAddCluster = true;
      });
      if (_editClusterFormKey.currentState != null &&
          _editClusterFormKey.currentState!.validate()) {
        final cluster = widget.cluster;
        cluster.name = _nameController.text;
        cluster.clusterServer = _clusterServerController.text.endsWith('/')
            ? _clusterServerController.text.substring(
                0,
                _clusterServerController.text.length - 1,
              )
            : _clusterServerController.text;
        cluster.clusterCertificateAuthorityData =
            _clusterCertificateAuthorityDataController.text.trim();
        cluster.clusterInsecureSkipTLSVerify = _clusterInsecureSkipTLSVerify;
        cluster.userClientCertificateData = _userClientCertificateDataController
            .text
            .trim();
        cluster.userClientKeyData = _userClientKeyDataController.text.trim();
        cluster.userToken = _userTokenController.text.trim();
        cluster.userUsername = _userUsernameController.text.trim();
        cluster.userPassword = _userPasswordController.text.trim();
        cluster.namespace = _namespaceController.text.trim() == ''
            ? 'default'
            : _namespaceController.text.trim();

        await clustersRepository.editCluster(cluster);

        setState(() {
          _isLoadingAddCluster = false;
        });
        if (mounted) {
          showSnackbar(
            context,
            'Cluster Saved',
            'The cluster ${_nameController.text} was saved',
          );
          Navigator.pop(context);
        }
      }
    } catch (err) {
      setState(() {
        _isLoadingAddCluster = false;
      });
      if (mounted) {
        showSnackbar(context, 'Failed to Save Cluster', err.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.cluster.name;
    _clusterServerController.text = widget.cluster.clusterServer;
    _clusterCertificateAuthorityDataController.text =
        widget.cluster.clusterCertificateAuthorityData;
    _clusterInsecureSkipTLSVerify = widget.cluster.clusterInsecureSkipTLSVerify;
    _userClientCertificateDataController.text =
        widget.cluster.userClientCertificateData;
    _userClientKeyDataController.text = widget.cluster.userClientKeyData;
    _userTokenController.text = widget.cluster.userToken;
    _userUsernameController.text = widget.cluster.userUsername;
    _userPasswordController.text = widget.cluster.userPassword;
    _namespaceController.text = widget.cluster.namespace;
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
      title: 'Edit',
      subtitle: 'Edit ${widget.cluster.name}',
      icon: Icons.edit,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Save',
      actionPressed: () {
        _editCluster();
      },
      actionIsLoading: _isLoadingAddCluster,
      child: Form(
        key: _editClusterFormKey,
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
                    _editCluster();
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
                    _editCluster();
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
                    _editCluster();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Insecure Skip TLS Verify'),
                    Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
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
                  controller: _userClientCertificateDataController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client Certificate Data',
                  ),
                  onFieldSubmitted: (String value) {
                    _editCluster();
                  },
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
                  onFieldSubmitted: (String value) {
                    _editCluster();
                  },
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
                  onFieldSubmitted: (String value) {
                    _editCluster();
                  },
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
                  onFieldSubmitted: (String value) {
                    _editCluster();
                  },
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
                  onFieldSubmitted: (String value) {
                    _editCluster();
                  },
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
                    _editCluster();
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
