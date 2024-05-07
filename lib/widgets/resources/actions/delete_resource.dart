import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [DeleteResource] widget can be used to delete the resource provided via
/// the [resource], [name] and [namespace] parameters. Within the widget a user
/// can also select if we should force the deletion of the resource or not.
class DeleteResource extends StatefulWidget {
  const DeleteResource({
    super.key,
    required this.resource,
    required this.name,
    required this.namespace,
  });

  final String name;
  final String? namespace;
  final Resource resource;

  @override
  State<DeleteResource> createState() => _DeleteResourceState();
}

class _DeleteResourceState extends State<DeleteResource> {
  bool _force = false;
  bool _isLoading = false;

  /// [_delete] deletes the resource. If the [_force] parameter is set
  /// to true we will add a `{"gracePeriodSeconds": 0}` body to the Kubernetes
  /// API request. The user gets a snackbar message if the saving was successful
  /// or failed.
  Future<void> _delete() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    String? body;
    if (_force) {
      body = '{"gracePeriodSeconds": 0}';
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url = widget.namespace == null
          ? '${widget.resource.path}/${widget.resource.resource}/${widget.name}'
          : '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}';

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).deleteRequest(url, body);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          '${widget.resource.singular} Deleted',
          widget.namespace == null
              ? 'The ${widget.resource.singular} ${widget.name} was deleted'
              : 'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was deleted',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'DeleteResource _delete',
        'Failed to Delete ${widget.resource.singular}',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Delete ${widget.resource.singular}',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Delete',
      subtitle: widget.namespace == null
          ? widget.name
          : '${widget.namespace}/${widget.name}',
      icon: Icons.delete,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Delete',
      actionPressed: () {
        _delete();
      },
      actionIsLoading: _isLoading,
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
              Container(
                child: widget.namespace != null
                    ? Text(
                        'Do you really want to delete ${widget.resource.singular} ${widget.namespace}/${widget.name}?',
                      )
                    : Text(
                        'Do you really want to delete ${widget.resource.singular} ${widget.name}?',
                      ),
              ),
              const SizedBox(height: Constants.spacingMiddle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Force'),
                  Switch(
                    activeColor: Theme.of(context).colorScheme.primary,
                    onChanged: (value) {
                      setState(() {
                        _force = !_force;
                      });
                    },
                    value: _force,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
