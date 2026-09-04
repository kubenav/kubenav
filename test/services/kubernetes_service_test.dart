import 'package:flutter/services.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/services/kubernetes_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const tlsServerName = 'kubernetes.default.svc';
  final calls = <MethodCall>[];

  final cluster = Cluster(
    id: 'example',
    name: 'example',
    clusterProviderType: ClusterProviderType.kubeconfig,
    clusterProviderId: '',
    clusterServer: 'https://api.example.test:6443',
    clusterTLSServerName: tlsServerName,
  );
  final service = KubernetesService(cluster: cluster, proxy: '', timeout: 30);

  setUp(() {
    calls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(KubernetesService.platform, (call) async {
          calls.add(call);

          switch (call.method) {
            case 'kubernetesRequest':
              return 'ok';
            case 'kubernetesGetLogs':
              return '{"logs": []}';
            case 'helmListReleases':
            case 'helmListReleaseHistory':
            case 'prometheusGetData':
              return 'null';
            case 'helmGetRelease':
              return '{}';
            case 'helmRollbackRelease':
              return '';
            case 'helmUninstallRelease':
              return 'uninstalled';
          }

          throw UnsupportedError(call.method);
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(KubernetesService.platform, null);
  });

  test('passes TLS server name to native Kubernetes operations', () async {
    await service.kubernetesRequest(cluster, '', 30, 'GET', '/readyz', '');
    await service.getLogs('pod', 'default', 'container', 300, '', false);

    expect(calls.map((call) => call.method), [
      'kubernetesRequest',
      'kubernetesGetLogs',
    ]);
    _expectTLSServerName(calls, tlsServerName);
  });

  test('passes TLS server name to native Helm operations', () async {
    await service.helmListReleases('default');
    await service.helmGetRelease('default', 'release', 1);
    await service.helmListReleaseHistory('default', 'release');
    await service.helmRollbackRelease('default', 'release', 1, '');
    await service.helmUninstallRelease('default', 'release', '');

    expect(calls.map((call) => call.method), [
      'helmListReleases',
      'helmGetRelease',
      'helmListReleaseHistory',
      'helmRollbackRelease',
      'helmUninstallRelease',
    ]);
    _expectTLSServerName(calls, tlsServerName);
  });

  test('passes TLS server name to native Prometheus operations', () async {
    await service.prometheusGetData({}, {}, [], 0, 1);

    expect(calls.map((call) => call.method), ['prometheusGetData']);
    _expectTLSServerName(calls, tlsServerName);
  });
}

void _expectTLSServerName(List<MethodCall> calls, String tlsServerName) {
  for (final call in calls) {
    expect(
      (call.arguments as Map<Object?, Object?>)['clusterTLSServerName'],
      tlsServerName,
      reason: '${call.method} must preserve the kubeconfig TLS server name',
    );
  }
}
