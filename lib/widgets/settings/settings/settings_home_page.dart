import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [SettingsHomePage] widget can be used to configure the home page of the
/// application.
class SettingsHomePage extends StatefulWidget {
  const SettingsHomePage({
    super.key,
    required this.currentHome,
  });

  final AppRepositorySettingsHome currentHome;

  @override
  State<SettingsHomePage> createState() => _SettingsHomePageState();
}

class _SettingsHomePageState extends State<SettingsHomePage> {
  final _homeFormKey = GlobalKey<FormState>();
  bool _useSelectedNamespace = false;
  bool _showMetrics = false;
  bool _showWarnings = false;
  bool _showWorkloadPods = false;
  bool _showWorkloadDeployments = false;
  bool _showWorkloadStatefulSets = false;
  bool _showWorkloadDaemonSets = false;
  bool _showWorkloadJobs = false;

  @override
  void initState() {
    super.initState();
    _useSelectedNamespace = widget.currentHome.useSelectedNamespace;
    _showMetrics = widget.currentHome.showMetrics;
    _showWarnings = widget.currentHome.showWarnings;
    _showWorkloadPods = widget.currentHome.showWorkloadPods;
    _showWorkloadDeployments = widget.currentHome.showWorkloadDeployments;
    _showWorkloadStatefulSets = widget.currentHome.showWorkloadStatefulSets;
    _showWorkloadDaemonSets = widget.currentHome.showWorkloadDaemonSets;
    _showWorkloadJobs = widget.currentHome.showWorkloadJobs;
  }

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    return AppBottomSheetWidget(
      title: 'Home Page',
      subtitle: 'Home Page Configuration',
      icon: Icons.home,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Save',
      actionPressed: () {
        if (_homeFormKey.currentState != null &&
            _homeFormKey.currentState!.validate()) {
          appRepository.setHome(
            AppRepositorySettingsHome(
              useSelectedNamespace: _useSelectedNamespace,
              showMetrics: _showMetrics,
              showWarnings: _showWarnings,
              showWorkloadPods: _showWorkloadPods,
              showWorkloadDeployments: _showWorkloadDeployments,
              showWorkloadStatefulSets: _showWorkloadStatefulSets,
              showWorkloadDaemonSets: _showWorkloadDaemonSets,
              showWorkloadJobs: _showWorkloadJobs,
            ),
          );
          Navigator.pop(context);
        }
      },
      actionIsLoading: false,
      child: Form(
        key: _homeFormKey,
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
                  'The following options can be used to configure the home page of the app. You can enable or disable the different components of the home page and you can select the scope for the different components. If you do not have the permissions to list resources in all namespaces of the cluster, you should enable the "Use Selected Namespace" option.',
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Use Selected Namespace'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _useSelectedNamespace = !_useSelectedNamespace;
                        });
                      },
                      value: _useSelectedNamespace,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingExtraLarge),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        height: 0,
                        thickness: 1.0,
                      ),
                    ),
                    Text(
                      'Components',
                      style: secondaryTextStyle(
                        context,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        height: 0,
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Show Metrics'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _showMetrics = !_showMetrics;
                        });
                      },
                      value: _showMetrics,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Show Warnings'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _showWarnings = !_showWarnings;
                        });
                      },
                      value: _showWarnings,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingExtraLarge),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        height: 0,
                        thickness: 1.0,
                      ),
                    ),
                    Text(
                      'Workloads',
                      style: secondaryTextStyle(
                        context,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        height: 0,
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Show Pods'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _showWorkloadPods = !_showWorkloadPods;
                        });
                      },
                      value: _showWorkloadPods,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Show Deployments'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _showWorkloadDeployments = !_showWorkloadDeployments;
                        });
                      },
                      value: _showWorkloadDeployments,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Show StatefulSets'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _showWorkloadStatefulSets =
                              !_showWorkloadStatefulSets;
                        });
                      },
                      value: _showWorkloadStatefulSets,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Show DaemonSets'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _showWorkloadDaemonSets = !_showWorkloadDaemonSets;
                        });
                      },
                      value: _showWorkloadDaemonSets,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Show Jobs'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _showWorkloadJobs = !_showWorkloadJobs;
                        });
                      },
                      value: _showWorkloadJobs,
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
