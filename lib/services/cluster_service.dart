import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:kubenav/models/cluster_model.dart';

class ClusterService {
  Cluster cluster;

  ClusterService({
    required this.cluster,
  });

  HttpClient _getClient() {
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    if (cluster.clusterCertificateAuthorityData != '') {
      securityContext.setTrustedCertificatesBytes(
        base64.decode(cluster.clusterCertificateAuthorityData),
      );
    }
    if (cluster.userClientCertificateData != '' &&
        cluster.userClientKeyData != '') {
      securityContext.setClientAuthoritiesBytes(
        base64.decode(cluster.userClientCertificateData),
      );
      securityContext.usePrivateKeyBytes(
        base64.decode(cluster.userClientKeyData),
      );
    }

    HttpClient client = HttpClient(context: securityContext);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      if (cluster.clusterInsecureSkipTLSVerify) {
        return true;
      }

      return false;
    };

    return client;
  }

  HttpClientRequest _setAuthentication(HttpClientRequest request) {
    if (cluster.userToken != '') {
      request.headers.add("Authorization", "Bearer " + cluster.userToken);
    }
    if (cluster.userUsername != '' && cluster.userPassword != '') {
      request.headers.add("Authorization",
          'Basic ${base64Encode(utf8.encode('${cluster.userUsername}:${cluster.userPassword}'))}');
    }

    return request;
  }

  Future<bool> checkHealth() async {
    HttpClient client = _getClient();

    try {
      HttpClientRequest request =
          await client.getUrl(Uri.parse('${cluster.clusterServer}/readyz'));
      request = _setAuthentication(request);

      HttpClientResponse response = await request.close();
      List<String> data = await response.transform(utf8.decoder).toList();

      if (response.statusCode == 200) {
        return true;
      } else {
        return Future.error(data.join(''));
      }
    } catch (err) {
      return Future.error(err);
    } finally {
      client.close();
    }
  }

  Future<Map<String, dynamic>> getRequest(String url) async {
    HttpClient client = _getClient();

    try {
      HttpClientRequest request =
          await client.getUrl(Uri.parse('${cluster.clusterServer}$url'));
      request = _setAuthentication(request);
      request.headers.add("Accept", "application/json");

      HttpClientResponse response = await request.close();
      List<String> data = await response.transform(utf8.decoder).toList();
      Map<String, dynamic> jsonData = json.decode(data.join(''));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonData;
      } else {
        return Future.error(jsonData);
      }
    } catch (err) {
      return Future.error(err);
    } finally {
      client.close();
    }
  }

  Future<void> deleteRequest(String url, String? body) async {
    HttpClient client = _getClient();

    try {
      HttpClientRequest request =
          await client.deleteUrl(Uri.parse('${cluster.clusterServer}$url'));
      request = _setAuthentication(request);
      request.headers.add("Accept", "application/json");
      if (body != null) {
        request.write(body);
      }

      HttpClientResponse response = await request.close();
      List<String> data = await response.transform(utf8.decoder).toList();
      Map<String, dynamic> jsonData = json.decode(data.join(''));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return;
      } else {
        return Future.error(jsonData);
      }
    } catch (err) {
      return Future.error(err);
    } finally {
      client.close();
    }
  }

  Future<void> portForward(String url) async {
    // HttpClient client = _getClient();

    // try {
    //   HttpClientRequest request =
    //       await client.getUrl(Uri.parse('${cluster.clusterServer}$url'));
    //   request = _setAuthentication(request);
    //   // request.headers.add("X-Stream-Protocol-Version", "portforward.k8s.io");
    //   request.headers.add('Connection', 'upgrade');
    //   request.headers.add('Upgrade', 'websocket');

    //   Random r = Random();
    //   String key = base64.encode(List<int>.generate(16, (_) => r.nextInt(255)));
    //   request.headers.add('Sec-WebSocket-Key', key);
    //   request.headers.add('Sec-WebSocket-Version', '13');

    //   HttpClientResponse response = await request.close();
    //   print(response.statusCode);

    //   if (response.statusCode == 101) {
    //     Socket socket = await response.detachSocket();
    //     print(socket.address);
    //     print(socket.port);
    //     print(socket.remoteAddress);
    //     print(socket.remotePort);

    //     WebSocket ws = WebSocket.fromUpgradedSocket(
    //       socket,
    //       serverSide: false,
    //     );

    //     // print('send');
    //     // socket.add(utf8.encode('hello'));

    //     ws.listen(
    //       (event) {
    //         print('listen');
    //         print(utf8.decode(event));
    //       },
    //       onError: (error) => print('ws error $error'),
    //       onDone: () => print("ws done"),
    //     );
    //   } else {
    //     List<String> data = await response.transform(utf8.decoder).toList();
    //     Map<String, dynamic> jsonData = json.decode(data.join(''));
    //     return Future.error(jsonData);
    //   }
    // } catch (err) {
    //   return Future.error(err);
    // } finally {
    //   client.close();
    // }
  }
}
