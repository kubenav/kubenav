import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_digitalocean.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class SettingsDigitalOceanProvider extends StatefulWidget {
  const SettingsDigitalOceanProvider({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final ClusterProvider? provider;

  @override
  State<SettingsDigitalOceanProvider> createState() =>
      _SettingsDigitalOceanProviderState();
}

class _SettingsDigitalOceanProviderState
    extends State<SettingsDigitalOceanProvider> {
  final _providerConfigFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
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
            type: ClusterProviderType.digitalocean,
            digitalocean: ClusterProviderDigitalOcean(
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
              SettingsAddClusterDigitalOcean(
                provider: provider,
              ),
            );
          }
        } else {
          final provider = widget.provider;
          provider!.name = _nameController.text;
          provider.digitalocean!.token = _tokenController.text;
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
      Logger.log(
        'SettingsDigitalOceanProvider _saveProvider',
        'Could not save provider configuration',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      showSnackbar(
        context,
        'Could not save provider configuration',
        err.toString(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.provider != null && widget.provider!.digitalocean != null) {
      _nameController.text = widget.provider!.name!;
      _tokenController.text = widget.provider!.digitalocean!.token ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.digitalocean.title(),
      subtitle: ClusterProviderType.digitalocean.subtitle(),
      icon: ClusterProviderType.digitalocean.image54x54(),
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
                controller: _tokenController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'API Token',
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
