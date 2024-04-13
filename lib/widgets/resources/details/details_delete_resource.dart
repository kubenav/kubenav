import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [DetailsDeleteResource] widget can be used to delete the resource
/// provided via the [resource], [path], [name] and [namespace] argument. Within
/// the widget a user can also select if we should force the deletion of the
/// resource or not.
class DetailsDeleteResource extends StatefulWidget {
  const DetailsDeleteResource({
    super.key,
    required this.resource,
    required this.path,
    required this.name,
    required this.namespace,
  });

  final String resource;
  final String path;
  final String name;
  final String? namespace;

  @override
  State<DetailsDeleteResource> createState() => _DetailsDeleteResourceState();
}

class _DetailsDeleteResourceState extends State<DetailsDeleteResource> {
  bool _force = false;
  bool _isLoading = false;

  /// [_deleteResource] deletes the resource. If the [_force] parameter is set
  /// to true we will add a `{"gracePeriodSeconds": 0}` body to the Kubernetes
  /// API request. If the request succeeds we show the user a success message in
  /// a snackbar and close the widget. If the API call fails we show the error
  /// message within a snackbar.
  Future<void> _deleteResource() async {
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
          ? '${widget.path}/${widget.resource}/${widget.name}'
          : '${widget.path}/namespaces/${widget.namespace}/${widget.resource}/${widget.name}';

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
          'Resource is deleted',
          widget.namespace == null
              ? 'The resource ${widget.name} is deleted'
              : 'The resource ${widget.name} in namespace ${widget.namespace} is deleted',
        );
        Navigator.pop(context);
      }
    } on PlatformException catch (err) {
      Logger.log(
        'DetailsDeleteResource _deleteResource',
        'An error was returned while deleting the resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not delete resource',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
      }
    } catch (err) {
      Logger.log(
        'DetailsDeleteResource _deleteResource',
        'An error was returned while deleting the resource',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not delete resource',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Delete',
      subtitle: widget.name,
      icon: Icons.delete,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Delete',
      actionPressed: () {
        _deleteResource();
      },
      actionIsLoading: _isLoading,
      child: Form(
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: widget.namespace != null
                  ? Text(
                      'Do you really want to delete ${widget.name} in namespace ${widget.namespace}?',
                    )
                  : Text(
                      'Do you really want to delete ${widget.name}?',
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
                  const Text('Force'),
                  Switch(
                    activeColor: theme(context).primary,
                    onChanged: (value) {
                      setState(() {
                        _force = !_force;
                      });
                    },
                    value: _force,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
