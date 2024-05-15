import 'package:flutter/material.dart';

import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/cert-manager/actions/plugin_cert_manager_approve.dart';
import 'package:kubenav/widgets/plugins/cert-manager/actions/plugin_cert_manager_deny.dart';
import 'package:kubenav/widgets/plugins/cert-manager/actions/plugin_cert_manager_renew.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_certificaterequests.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_certificates.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_challenges.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_clusterissuers.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_issuers.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_orders.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// [CertManagerResourceCategories] defines the different categories of
/// resources supported by the cert.manager plugin.
class CertManagerResourceCategories {
  static const certificates = 'Certificates';
  static const acme = 'ACME';
}

final List<String> certManagerResourceCategories = [
  CertManagerResourceCategories.certificates,
  CertManagerResourceCategories.acme,
];

/// [certManagerResources] is a list of all supported cert-manager resources,
/// which are implementing the [Resource] model.
final List<Resource> certManagerResources = [
  certManagerResourceCertificate,
  certManagerResourceCertificateRequest,
  certManagerResourceClusterIssuer,
  certManagerResourceIssuer,
  certManagerResourceChallenge,
  certManagerResourceOrder,
];

/// [kindToCertManagerResource] is a map, which maps the kind of a cert-manager
///  resource to the [Resource] model.
final kindToCertManagerResource = {
  'Certificate': certManagerResourceCertificate,
  'CertificateRequest': certManagerResourceCertificateRequest,
  'ClusterIssuer': certManagerResourceClusterIssuer,
  'Issuer': certManagerResourceIssuer,
  'Challenge': certManagerResourceChallenge,
  'Order': certManagerResourceOrder,
};

List<AppResourceActionsModel> certManagerResourceActions(
  BuildContext context,
  String name,
  String? namespace,
  Resource resource,
  dynamic item,
) {
  if (resource.resource == certManagerResourceCertificate.resource &&
      resource.path == certManagerResourceCertificate.path) {
    return [
      AppResourceActionsModel(
        title: 'Renew',
        icon: Icons.restart_alt,
        onTap: () {
          showModal(
            context,
            PluginCertManagerRenew(
              name: name,
              namespace: namespace ?? 'default',
              resource: resource,
              certificate: item,
            ),
          );
        },
      ),
    ];
  }

  if (resource.resource == certManagerResourceCertificateRequest.resource &&
      resource.path == certManagerResourceCertificateRequest.path) {
    return [
      AppResourceActionsModel(
        title: 'Approve',
        icon: Icons.task_alt,
        onTap: () {
          showModal(
            context,
            PluginCertManagerApprove(
              name: name,
              namespace: namespace ?? 'default',
              resource: resource,
              cr: item,
            ),
          );
        },
      ),
      AppResourceActionsModel(
        title: 'Deny',
        icon: Icons.block,
        onTap: () {
          showModal(
            context,
            PluginCertManagerDeny(
              name: name,
              namespace: namespace ?? 'default',
              resource: resource,
              cr: item,
            ),
          );
        },
      ),
    ];
  }

  return [];
}
