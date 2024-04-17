import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/providers/rancher_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_rancher.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class SettingsRancherProvider extends StatefulWidget {
  const SettingsRancherProvider({
    super.key,
    required this.provider,
  });

  final ClusterProvider? provider;

  @override
  State<SettingsRancherProvider> createState() =>
      _SettingsRancherProviderState();
}

class _SettingsRancherProviderState extends State<SettingsRancherProvider> {
  final _providerConfigFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _serverAddressController = TextEditingController();
  bool _allowInsecureConnections = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _tokenController = TextEditingController();
  bool _isLoading = false;

  /// [_validator] is used to validate all the required fields. If they are
  /// missing the validation of the form will fail.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final rancherToken = await RancherService().signIn(
        _serverAddressController.text,
        _allowInsecureConnections,
        _usernameController.text,
        _passwordController.text,
      );

      _tokenController.text = rancherToken.token ?? '';

      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      Logger.log(
        'SettingsRancherProvider _signin',
        'Sign in failed',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Sign in failed',
          err.toString(),
        );
      }
    }
  }

  Future<void> _saveProvider() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
      });
      if (widget.provider == null) {
        final provider = ClusterProvider(
          id: const Uuid().v4(),
          name: _nameController.text,
          type: ClusterProviderType.rancher,
          rancher: ClusterProviderRancher(
            serverAddress: _serverAddressController.text,
            allowInsecureConnections: _allowInsecureConnections,
            username: _usernameController.text,
            password: _passwordController.text,
            token: _tokenController.text,
          ),
        );
        await clustersRepository.addProvider(provider);

        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          Navigator.pop(context);
          showModal(
            context,
            SettingsAddClusterRancher(
              provider: provider,
            ),
          );
        }
      } else {
        final provider = widget.provider;
        provider!.name = _nameController.text;
        provider.rancher!.serverAddress = _serverAddressController.text;
        provider.rancher!.allowInsecureConnections = _allowInsecureConnections;
        provider.rancher!.username = _usernameController.text;
        provider.rancher!.password = _passwordController.text;
        provider.rancher!.token = _tokenController.text;
        await clustersRepository.editProvider(provider);

        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          Navigator.pop(context);
        }
      }
    } catch (err) {
      Logger.log(
        'SettingsRancherProvider _saveProvider',
        'Could not save provider configuration',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not save provider configuration',
          err.toString(),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.provider != null && widget.provider!.rancher != null) {
      _nameController.text = widget.provider!.name!;
      _serverAddressController.text =
          widget.provider!.rancher!.serverAddress ?? '';
      _allowInsecureConnections =
          widget.provider!.rancher!.allowInsecureConnections ?? false;
      _usernameController.text = widget.provider!.rancher!.username ?? '';
      _passwordController.text = widget.provider!.rancher!.password ?? '';
      _tokenController.text = widget.provider!.rancher!.token ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _serverAddressController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.rancher.title(),
      subtitle: ClusterProviderType.rancher.subtitle(),
      icon: ClusterProviderType.rancher.icon(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: widget.provider == null ? 'Save and add cluster(s)' : 'Save',
      actionPressed: () {
        _saveProvider();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _providerConfigFormKey,
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
                maxLines: 1,
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
                controller: _serverAddressController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Server Address',
                ),
                validator: _validator,
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
                  const Text('Allow Insecure Connections'),
                  Switch(
                    activeColor: Theme.of(context).colorScheme.primary,
                    onChanged: (value) {
                      setState(() {
                        _allowInsecureConnections = !_allowInsecureConnections;
                      });
                    },
                    value: _allowInsecureConnections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                validator: _validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: _validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Constants.sizeBorderRadius,
                    ),
                  ),
                ),
                onPressed: _signIn,
                child: Text(
                  'Sign In',
                  style: primaryTextStyle(
                    context,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: _tokenController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Token (optional)',
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
