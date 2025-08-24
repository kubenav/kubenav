import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class RollbackOptions {
  bool cleanupOnFail;
  bool dryRun;
  bool force;
  int maxHistory;
  bool disableHooks;
  bool recreate;
  int timeout;
  bool wait;
  bool waitForJobs;

  RollbackOptions({
    required this.cleanupOnFail,
    required this.dryRun,
    required this.force,
    required this.maxHistory,
    required this.disableHooks,
    required this.recreate,
    required this.timeout,
    required this.wait,
    required this.waitForJobs,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cleanupOnFail'] = cleanupOnFail;
    data['dryRun'] = dryRun;
    data['force'] = force;
    data['maxHistory'] = maxHistory;
    data['disableHooks'] = disableHooks;
    data['recreate'] = recreate;
    data['timeout'] = timeout;
    data['wait'] = wait;
    data['waitForJobs'] = waitForJobs;
    return data;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

class PluginHelmDetailsRollback extends StatefulWidget {
  const PluginHelmDetailsRollback({
    super.key,
    required this.namespace,
    required this.name,
    required this.version,
  });

  final String namespace;
  final String name;
  final int version;

  @override
  State<PluginHelmDetailsRollback> createState() =>
      _PluginHelmDetailsRollbackState();
}

class _PluginHelmDetailsRollbackState extends State<PluginHelmDetailsRollback> {
  final _rollbackFormKey = GlobalKey<FormState>();
  final _versionController = TextEditingController();
  bool _cleanupOnFail = false;
  bool _dryRun = false;
  bool _force = false;
  final _maxHistoryController = TextEditingController();
  bool _disableHooks = false;
  bool _recreate = false;
  final _timeoutController = TextEditingController();
  bool _wait = false;
  bool _waitForJobs = false;
  bool _isLoading = false;

  Future<void> _rollback() async {
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
      final rollbackOptions = RollbackOptions(
        cleanupOnFail: _cleanupOnFail,
        dryRun: _dryRun,
        force: _force,
        maxHistory: int.parse(_maxHistoryController.text),
        disableHooks: _disableHooks,
        recreate: _recreate,
        timeout: int.parse(_timeoutController.text),
        wait: _wait,
        waitForJobs: _waitForJobs,
      );

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).helmRollbackRelease(
        widget.namespace,
        widget.name,
        int.parse(_versionController.text),
        rollbackOptions.toString(),
      );

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log('PluginHelmDetailsRollback _rollback', 'Rollback Failed', err);
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        Navigator.pop(context);
        showSnackbar(context, 'Rollback Failed', err.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _versionController.text = '${widget.version - 1}';
    _maxHistoryController.text = '10';
    _timeoutController.text = '300';
  }

  @override
  void dispose() {
    _versionController.dispose();
    _maxHistoryController.dispose();
    _timeoutController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Rollback',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.history,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Rollback',
      actionPressed: () {
        _rollback();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _rollbackFormKey,
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
                  controller: _versionController,
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Version',
                  ),
                  onFieldSubmitted: (String value) {
                    _rollback();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Cleanup On Fail'),
                    Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _cleanupOnFail = !_cleanupOnFail;
                        });
                      },
                      value: _cleanupOnFail,
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
                      activeThumbColor: Theme.of(context).colorScheme.primary,
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
                    const Text('Force'),
                    Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _force = !_force;
                        });
                      },
                      value: _force,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _maxHistoryController,
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Max History',
                  ),
                  onFieldSubmitted: (String value) {
                    _rollback();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Disable Hooks'),
                    Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Recreate'),
                    Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _recreate = !_recreate;
                        });
                      },
                      value: _recreate,
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
                    _rollback();
                  },
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Wait'),
                    Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _wait = !_wait;
                        });
                      },
                      value: _wait,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Wait For Jobs'),
                    Switch(
                      activeThumbColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _waitForJobs = !_waitForJobs;
                        });
                      },
                      value: _waitForJobs,
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
