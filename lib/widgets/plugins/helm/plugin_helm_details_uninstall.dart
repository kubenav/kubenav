import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class UninstallOptions {
  String cascade;
  bool dryRun;
  bool keepHistory;
  bool disableHooks;
  int timeout;
  bool wait;

  UninstallOptions({
    required this.cascade,
    required this.dryRun,
    required this.keepHistory,
    required this.disableHooks,
    required this.timeout,
    required this.wait,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cascade'] = cascade;
    data['dryRun'] = dryRun;
    data['keepHistory'] = keepHistory;
    data['disableHooks'] = disableHooks;
    data['timeout'] = timeout;
    data['wait'] = wait;
    return data;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

class PluginHelmDetailsUninstall extends StatefulWidget {
  const PluginHelmDetailsUninstall({
    super.key,
    required this.namespace,
    required this.name,
  });

  final String namespace;
  final String name;

  @override
  State<PluginHelmDetailsUninstall> createState() =>
      _PluginHelmDetailsUninstallState();
}

class _PluginHelmDetailsUninstallState
    extends State<PluginHelmDetailsUninstall> {
  final _uninstallFormKey = GlobalKey<FormState>();
  String _cascade = 'background';
  bool _dryRun = false;
  bool _keepHistory = false;
  bool _disableHooks = false;
  final _timeoutController = TextEditingController();
  bool _wait = false;
  bool _isLoading = false;

  Future<void> _uninstall() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    final cluster = await clustersRepository.getClusterWithCredentials(
      clustersRepository.activeClusterId,
    );

    setState(() {
      _isLoading = true;
    });

    try {
      final uninstallOptions = UninstallOptions(
        cascade: _cascade,
        dryRun: _dryRun,
        keepHistory: _keepHistory,
        disableHooks: _disableHooks,
        timeout: int.parse(_timeoutController.text),
        wait: _wait,
      );

      final message = await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).helmUninstallRelease(
        widget.namespace,
        widget.name,
        uninstallOptions.toString(),
      );

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        Navigator.pop(context);
        showSnackbar(
          context,
          'Helm Release Uninstalled',
          message != ''
              ? message
              : 'Helm Release ${widget.namespace}/${widget.name} was uninstalled',
        );
      }
    } catch (err) {
      Logger.log(
        'PluginHelmDetailsUninstall _uninstall',
        'Uninstall Failed',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        Navigator.pop(context);
        showSnackbar(
          context,
          'Uninstall Failed',
          err.toString(),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _timeoutController.text = '300';
  }

  @override
  void dispose() {
    _timeoutController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Uninstall',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.delete,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Uninstall',
      actionPressed: () {
        _uninstall();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _uninstallFormKey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Cascade'),
                    DropdownButton(
                      value: _cascade,
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _cascade = value ?? '';
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: 'background',
                          child: Text(
                            'background',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .textPrimary,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'orphan',
                          child: Text(
                            'orphan',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .textPrimary,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'foreground',
                          child: Text(
                            'foreground',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Dry Run'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _dryRun = !_dryRun;
                        });
                      },
                      value: _dryRun,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Keep History'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _keepHistory = !_keepHistory;
                        });
                      },
                      value: _keepHistory,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Disable Hooks'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _disableHooks = !_disableHooks;
                        });
                      },
                      value: _disableHooks,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _timeoutController,
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Timeout',
                  ),
                  onFieldSubmitted: (String value) {
                    _uninstall();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Wait'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _wait = !_wait;
                        });
                      },
                      value: _wait,
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
