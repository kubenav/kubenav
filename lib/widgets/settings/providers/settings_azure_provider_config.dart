import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_azure.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class SettingsAzureProvider extends StatefulWidget {
  const SettingsAzureProvider({super.key, required this.provider});

  final ClusterProvider? provider;

  @override
  State<SettingsAzureProvider> createState() => _SettingsAzureProviderState();
}

class _SettingsAzureProviderState extends State<SettingsAzureProvider> {
  final _providerConfigFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _subscriptionIDController = TextEditingController();
  final _tenantIDController = TextEditingController();
  final _clientIDController = TextEditingController();
  final _clientSecretController = TextEditingController();
  bool _isAdmin = false;
  bool _isLoading = false;

  /// [_validator] is used to validate all the required fields. If they are
  /// missing the validation of the form will fail.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  Future<void> _saveProviderConfig() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      if (_providerConfigFormKey.currentState != null &&
          _providerConfigFormKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        if (widget.provider == null) {
          final provider = ClusterProvider(
            id: const Uuid().v4(),
            name: _nameController.text,
            type: ClusterProviderType.azure,
            azure: ClusterProviderAzure(
              subscriptionID: _subscriptionIDController.text,
              tenantID: _tenantIDController.text,
              clientID: _clientIDController.text,
              clientSecret: _clientSecretController.text,
              isAdmin: _isAdmin,
            ),
          );
          await clustersRepository.addProvider(provider);

          setState(() {
            _isLoading = false;
          });
          if (mounted) {
            Navigator.pop(context);
            showModal(context, SettingsAddClusterAzure(provider: provider));
          }
        } else {
          final provider = widget.provider;
          provider!.name = _nameController.text;
          provider.azure!.subscriptionID = _subscriptionIDController.text;
          provider.azure!.tenantID = _tenantIDController.text;
          provider.azure!.clientID = _clientIDController.text;
          provider.azure!.clientSecret = _clientSecretController.text;
          provider.azure!.isAdmin = _isAdmin;
          await clustersRepository.editProvider(provider);

          setState(() {
            _isLoading = false;
          });
          if (mounted) {
            Navigator.pop(context);
          }
        }
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Save Provider Configuration',
          err.toString(),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.provider != null && widget.provider!.azure != null) {
      _nameController.text = widget.provider!.name!;
      _subscriptionIDController.text =
          widget.provider!.azure!.subscriptionID ?? '';
      _tenantIDController.text = widget.provider!.azure!.tenantID ?? '';
      _clientIDController.text = widget.provider!.azure!.clientID ?? '';
      _clientSecretController.text = widget.provider!.azure!.clientSecret ?? '';
      _isAdmin = widget.provider!.azure!.isAdmin ?? false;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _subscriptionIDController.dispose();
    _tenantIDController.dispose();
    _clientIDController.dispose();
    _clientSecretController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.azure.title(),
      subtitle: ClusterProviderType.azure.subtitle(),
      icon: ClusterProviderType.azure.icon(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: widget.provider == null ? 'Save and Add Cluster(s)' : 'Save',
      actionPressed: () {
        _saveProviderConfig();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _providerConfigFormKey,
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
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  validator: _validator,
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _subscriptionIDController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Subscription ID',
                  ),
                  validator: _validator,
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _tenantIDController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tenant ID',
                  ),
                  validator: _validator,
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _clientIDController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client ID',
                  ),
                  validator: _validator,
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _clientSecretController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client Secret',
                  ),
                  validator: _validator,
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Admin'),
                    Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
                      onChanged: (val) {
                        setState(() {
                          _isAdmin = !_isAdmin;
                        });
                      },
                      value: _isAdmin,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
