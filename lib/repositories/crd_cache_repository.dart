import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_definition.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/storage.dart';
import 'package:kubenav/widgets/resources/resources/resources_customresourcedefinitions.dart';

/// The [CRDsCacheRepository] is used to cache all the users CRDs, so that we
/// don't need to fetch them every time we need them in the `goToReference`
/// function.
class CRDsCacheRepository {
  static final CRDsCacheRepository _instance = CRDsCacheRepository._internal();

  factory CRDsCacheRepository() {
    return _instance;
  }

  CRDsCacheRepository._internal();

  List<
    IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition
  >?
  _crds;

  /// [init] reads the CRDs from the storage. If there are already CRDs saved,
  /// we will decode the storage entry into the [_crds] list.
  Future<void> init() async {
    try {
      final data = await Storage().read('kubenav-crds');
      if (data != null) {
        _crds =
            List<
              IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition
            >.from(
              json
                  .decode(data)
                  .map(
                    (e) =>
                        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition.fromJson(
                          e,
                        ),
                  ),
            );
      }
    } catch (err) {
      Logger.log('CRDsCacheRepository _init', 'Failed to Load CRDs', err);
    }
  }

  /// [_save] writes the [_crds] list to the storage.
  Future<void> _save() async {
    try {
      if (_crds != null) {
        await Storage().write(
          'kubenav-crds',
          json.encode(_crds!.map((e) => e.toJson()).toList()),
        );
      }
    } catch (err) {
      Logger.log('CRDsCacheRepository _save', 'Failed to Save CRDs', err);
    }
  }

  /// [_getCRDs] fetches all CRDs from the Kubernetes API and saves them to the
  /// [_crds] list.
  Future<void> _getCRDs(
    BuildContext context,
    String kind,
    String apiVersion,
  ) async {
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

    final result =
        await KubernetesService(
          cluster: cluster!,
          proxy: appRepository.settings.proxy,
          timeout: appRepository.settings.timeout,
        ).getRequest(
          '${resourceCustomResourceDefinition.path}/${resourceCustomResourceDefinition.resource}',
        );

    _crds =
        (await compute(resourceCustomResourceDefinition.decodeList, result))
            as List<
              IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition
            >;
    await _save();
  }

  /// [_getCRD] returns a CRD from the [_crds] list by the kind and apiVersion.
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition?
  _getCRD(String kind, String apiVersion) {
    if (_crds != null) {
      for (var crd in _crds!) {
        if (kind == crd.spec.names.kind) {
          for (var version in crd.spec.versions) {
            if (apiVersion == '${crd.spec.group}/${version.name}') {
              return crd;
            }
          }
        }
      }
    }

    return null;
  }

  /// [getCRD] returns a CRD from the [_crds] list by the kind and apiVersion.
  /// If the CRDs list is empty we fetch the CRDs from the Kubernetes API. If
  /// the list is not empty we directly try to return the CRD. If we are not
  /// able to find the CRD in the list, we fetch the CRDs from the Kubernetes
  /// API again and try to return the CRD.
  Future<
    IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition?
  >
  getCRD(BuildContext context, String kind, String apiVersion) async {
    if (_crds == null) {
      await _getCRDs(context, kind, apiVersion);
      return _getCRD(kind, apiVersion);
    } else {
      final crd = _getCRD(kind, apiVersion);
      if (crd != null) {
        return crd;
      } else {
        await _getCRDs(context, kind, apiVersion);
        return _getCRD(kind, apiVersion);
      }
    }
  }
}
