import 'package:flutter_test/flutter_test.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/models/kubernetes_extensions/kubeconfig.dart';

void main() {
  group('Kubeconfig TLS server name', () {
    test('is imported into a cluster', () async {
      final kubeconfig = Kubeconfig.fromJson({
        'clusters': [
          {
            'name': 'example',
            'cluster': {
              'server': 'https://api.example.test:6443',
              'tls-server-name': 'kubernetes.default.svc',
              'certificate-authority-data': 'certificate-authority',
            },
          },
        ],
        'contexts': [
          {
            'name': 'example',
            'context': {'cluster': 'example', 'user': 'example'},
          },
        ],
        'users': [
          {
            'name': 'example',
            'user': {'token': 'token'},
          },
        ],
      });

      final clusters = await kubeconfig.getClusters(
        ClusterProviderType.kubeconfig,
        '',
      );

      expect(clusters, hasLength(1));
      expect(clusters.single.clusterTLSServerName, 'kubernetes.default.svc');
    });

    test('round-trips through kubeconfig JSON', () {
      final cluster = KubeconfigClusterCluster(
        certificateAuthorityData: 'certificate-authority',
        insecureSkipTlsVerify: false,
        server: 'https://api.example.test:6443',
        tlsServerName: 'kubernetes.default.svc',
      );

      final restored = KubeconfigClusterCluster.fromJson(cluster.toJson());

      expect(restored.tlsServerName, 'kubernetes.default.svc');
    });
  });

  group('Cluster TLS server name persistence', () {
    test('round-trips through stored JSON', () {
      final cluster = Cluster(
        id: 'example',
        name: 'example',
        clusterProviderType: ClusterProviderType.kubeconfig,
        clusterProviderId: '',
        clusterServer: 'https://api.example.test:6443',
        clusterTLSServerName: 'kubernetes.default.svc',
      );

      final restored = Cluster.fromJson(cluster.toJson());

      expect(restored.clusterTLSServerName, 'kubernetes.default.svc');
    });

    test('defaults to empty for existing stored clusters', () {
      final cluster = Cluster.fromJson({
        'id': 'example',
        'name': 'example',
        'clusterProviderType': 'kubeconfig',
        'clusterProviderId': '',
        'clusterServer': 'https://api.example.test:6443',
      });

      expect(cluster.clusterTLSServerName, isEmpty);
    });

    test('defaults to empty for a null stored value', () {
      final cluster = Cluster.fromJson({
        'id': 'example',
        'name': 'example',
        'clusterProviderType': 'kubeconfig',
        'clusterProviderId': '',
        'clusterServer': 'https://api.example.test:6443',
        'clusterTLSServerName': null,
      });

      expect(cluster.clusterTLSServerName, isEmpty);
    });
  });
}
