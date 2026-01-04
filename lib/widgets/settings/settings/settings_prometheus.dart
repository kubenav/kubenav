import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [SettingsPrometheus] widget can be used to enable the Prometheus plugin,
/// which allows a user to view Prometheus metrics within serveral resources and
/// to create custom dashboards, which can be accessed via the app.
class SettingsPrometheus extends StatefulWidget {
  const SettingsPrometheus({super.key, required this.currentPrometheus});

  final AppRepositorySettingsPrometheus currentPrometheus;

  @override
  State<SettingsPrometheus> createState() => _SettingsPrometheusState();
}

class _SettingsPrometheusState extends State<SettingsPrometheus> {
  final _prometheusFormKey = GlobalKey<FormState>();
  bool _enabled = false;
  final _addressController = TextEditingController();
  final _namespaceController = TextEditingController();
  final _labelSelectorController = TextEditingController();
  final _containerController = TextEditingController();
  final _portController = TextEditingController();
  final _pathController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _tokenController = TextEditingController();
  final _certificateAuthorityController = TextEditingController();
  bool _insecureSkipTLSVerify = false;
  final _clientCertificateController = TextEditingController();
  final _clientKeyController = TextEditingController();

  /// [_portValidator] is used to validate the required field [_portController].
  /// If the value is empty or not a number the validation fails.
  String? _portValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    final parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      return 'The field must be a number';
    }

    if (parsedValue < 0) {
      return 'The field must be a positive number';
    }

    return null;
  }

  void _save() {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    if (_prometheusFormKey.currentState != null &&
        _prometheusFormKey.currentState!.validate()) {
      appRepository.setPrometheus(
        AppRepositorySettingsPrometheus(
          enabled: _enabled,
          address: _addressController.text,
          namespace: _namespaceController.text,
          labelSelector: _labelSelectorController.text,
          container: _containerController.text,
          port: int.tryParse(_portController.text) ?? 9090,
          path: _pathController.text,
          username: _usernameController.text,
          password: _passwordController.text,
          token: _tokenController.text,
          certificateAuthority: _certificateAuthorityController.text,
          insecureSkipTLSVerify: _insecureSkipTLSVerify,
          clientCertificate: _clientCertificateController.text,
          clientKey: _clientKeyController.text,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _enabled = widget.currentPrometheus.enabled;
    _addressController.text = widget.currentPrometheus.address;
    _namespaceController.text = widget.currentPrometheus.namespace;
    _labelSelectorController.text = widget.currentPrometheus.labelSelector;
    _containerController.text = widget.currentPrometheus.container;
    _portController.text = '${widget.currentPrometheus.port}';
    _pathController.text = widget.currentPrometheus.path;
    _usernameController.text = widget.currentPrometheus.username;
    _passwordController.text = widget.currentPrometheus.password;
    _tokenController.text = widget.currentPrometheus.token;
    _certificateAuthorityController.text =
        widget.currentPrometheus.certificateAuthority;
    _insecureSkipTLSVerify = widget.currentPrometheus.insecureSkipTLSVerify;
    _clientCertificateController.text =
        widget.currentPrometheus.clientCertificate;
    _clientKeyController.text = widget.currentPrometheus.clientKey;
  }

  @override
  void dispose() {
    _addressController.dispose();
    _namespaceController.dispose();
    _labelSelectorController.dispose();
    _containerController.dispose();
    _portController.dispose();
    _pathController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _tokenController.dispose();
    _certificateAuthorityController.dispose();
    _clientCertificateController.dispose();
    _clientKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Prometheus',
      subtitle: 'Prometheus configuration',
      icon: 'assets/plugins/prometheus.svg',
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Save',
      actionPressed: () {
        _save();
      },
      actionIsLoading: false,
      child: Form(
        key: _prometheusFormKey,
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
                const Text(
                  'You can specify the address of a Prometheus instance, or if your Prometheus instance is not reachable via a public address you can specify a namespace, label selector, container and port running inside your cluster',
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Enabled'),
                    Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _enabled = !_enabled;
                        });
                      },
                      value: _enabled,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _addressController,
                  keyboardType: TextInputType.url,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                const SizedBox(height: Constants.spacingExtraLarge),
                Row(
                  children: [
                    const Expanded(child: Divider(height: 0, thickness: 1.0)),
                    Text(
                      'In-Cluster Configuration',
                      style: secondaryTextStyle(context),
                    ),
                    const Expanded(child: Divider(height: 0, thickness: 1.0)),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _namespaceController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Namespace',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _labelSelectorController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Label Selector',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _containerController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Container',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _portController,
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Port',
                  ),
                  validator: _portValidator,
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _pathController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Path',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                const SizedBox(height: Constants.spacingExtraLarge),
                Row(
                  children: [
                    const Expanded(child: Divider(height: 0, thickness: 1.0)),
                    Text('Credentials', style: secondaryTextStyle(context)),
                    const Expanded(child: Divider(height: 0, thickness: 1.0)),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _tokenController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Token',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _certificateAuthorityController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Certificate Authority',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Insecure Skip TLS Verify'),
                    Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _insecureSkipTLSVerify = value;
                        });
                      },
                      value: _insecureSkipTLSVerify,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _clientCertificateController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client Certificate',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _clientKeyController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client Key',
                  ),
                  onFieldSubmitted: (String value) {
                    _save();
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
