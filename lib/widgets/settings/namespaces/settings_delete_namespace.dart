import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_actions_widget.dart';

/// The [SettingsDeleteNamespace] widget is used to delete a namespace which was
/// added by the user to his favorite namespaces list.
class SettingsDeleteNamespace extends StatelessWidget {
  const SettingsDeleteNamespace({
    super.key,
    required this.namespace,
  });

  final String namespace;

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title: 'Delete',
          color: theme(context).colorDanger,
          onTap: () {
            appRepository.deleteNamespace(namespace);
            showSnackbar(
              context,
              'Namespace deleted',
              'The namespace $namespace was deleted',
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
