import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_aws.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class SettingsAWSProvider extends StatefulWidget {
  const SettingsAWSProvider({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final ClusterProvider? provider;

  @override
  State<SettingsAWSProvider> createState() => _SettingsAWSProviderState();
}

class _SettingsAWSProviderState extends State<SettingsAWSProvider> {
  final _providerConfigFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _accessKeyIDController = TextEditingController();
  final _secretKeyController = TextEditingController();
  String _region = 'us-east-1';
  final _sessionTokenController = TextEditingController();
  bool _isLoading = false;

  /// [_validator] is used to validate all the required fields. If they are
  /// missing the validation of the form will fail.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  Future<void> _saveProvider(BuildContext context) async {
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
            type: ClusterProviderType.aws,
            aws: ClusterProviderAWS(
              accessKeyID: _accessKeyIDController.text,
              secretKey: _secretKeyController.text,
              region: _region,
              sessionToken: _sessionTokenController.text,
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
              SettingsAddClusterAWS(
                provider: provider,
              ),
            );
          }
        } else {
          final provider = widget.provider;
          provider!.name = _nameController.text;
          provider.aws!.accessKeyID = _accessKeyIDController.text;
          provider.aws!.secretKey = _secretKeyController.text;
          provider.aws!.region = _region;
          provider.aws!.sessionToken = _sessionTokenController.text;
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
      showSnackbar(
        'Could not save provider configuration',
        err.toString(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.provider != null && widget.provider!.aws != null) {
      _nameController.text = widget.provider!.name!;
      _accessKeyIDController.text = widget.provider!.aws!.accessKeyID ?? '';
      _secretKeyController.text = widget.provider!.aws!.secretKey ?? '';
      _region = widget.provider!.aws!.region ?? '';
      _sessionTokenController.text = widget.provider!.aws!.sessionToken ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _accessKeyIDController.dispose();
    _secretKeyController.dispose();
    _sessionTokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.aws.title(),
      subtitle: ClusterProviderType.aws.subtitle(),
      icon: ClusterProviderType.aws.image54x54(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: widget.provider == null ? 'Save and add cluster(s)' : 'Save',
      actionPressed: () {
        _saveProvider(context);
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
                controller: _accessKeyIDController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Access Key ID',
                ),
                validator: _validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: _secretKeyController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Secret Key',
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
                  const Text('Region'),
                  DropdownButton(
                    value: _region,
                    underline: Container(
                      height: 2,
                      color: Constants.colorPrimary,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _region = newValue ?? '';
                      });
                    },
                    items: [
                      'us-east-1',
                      'us-east-2',
                      'us-west-1',
                      'us-west-2',
                      'af-south-1',
                      'ap-east-1',
                      'ap-south-1',
                      'ap-northeast-1',
                      'ap-northeast-2',
                      'ap-northeast-3',
                      'ap-southeast-1',
                      'ap-southeast-2',
                      'ca-central-1',
                      'cn-north-1',
                      'cn-northwest-1',
                      'eu-central-1',
                      'eu-west-1',
                      'eu-west-2',
                      'eu-west-3',
                      'eu-south-1',
                      'eu-north-1',
                      'me-south-1',
                      'sa-east-1',
                    ].map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .color,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: _sessionTokenController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Session Token',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
