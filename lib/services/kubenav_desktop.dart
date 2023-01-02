import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

import 'package:ffi/ffi.dart';

import 'package:kubenav/utils/logger.dart';

// ignore: camel_case_types
typedef freepointer_function = Void Function(Pointer<Utf8>);
typedef FreePointerFn = void Function(Pointer<Utf8>);

// ignore: camel_case_types
typedef init_func = Void Function(Pointer<Void>);
typedef InitFunc = void Function(Pointer<Void>);

// ignore: camel_case_types
typedef kubernetesclusters_func = Pointer<Utf8> Function();
typedef KubernetesClustersFunc = Pointer<Utf8> Function();

// ignore: camel_case_types
typedef kubernetesrequest_func = Void Function(
  Int64 port,
  Pointer<Utf8> contextName,
  Int32 contextNameLen,
  Pointer<Utf8> proxy,
  Int32 proxyLen,
  Int64 timeout,
  Pointer<Utf8> requestMethod,
  Int32 requestMethodLen,
  Pointer<Utf8> requestURL,
  Int32 requestURLLen,
  Pointer<Utf8> requestBody,
  Int32 requestBodyLen,
);
typedef KubernetesRequestFunc = void Function(
  int port,
  Pointer<Utf8> contextName,
  int contextNameLen,
  Pointer<Utf8> proxy,
  int proxyLen,
  int timeout,
  Pointer<Utf8> requestMethod,
  int requestMethodLen,
  Pointer<Utf8> requestURL,
  int requestURLLen,
  Pointer<Utf8> requestBody,
  int requestBodyLen,
);

// ignore: camel_case_types
typedef kubernetesgetlogs_func = Void Function(
  Int64 port,
  Pointer<Utf8> contextName,
  Int32 contextNameLen,
  Pointer<Utf8> proxy,
  Int32 proxyLen,
  Int64 timeout,
  Pointer<Utf8> names,
  Int32 namesLen,
  Pointer<Utf8> namespace,
  Int32 namespaceLen,
  Pointer<Utf8> container,
  Int32 containerLen,
  Int32 since,
  Pointer<Utf8> filter,
  Int32 filterLen,
  Int32 previous,
);
typedef KubernetesGetLogsFunc = void Function(
  int port,
  Pointer<Utf8> contextName,
  int contextNameLen,
  Pointer<Utf8> proxy,
  int proxyLen,
  int timeout,
  Pointer<Utf8> names,
  int namesLen,
  Pointer<Utf8> namespace,
  int namespaceLen,
  Pointer<Utf8> container,
  int containerLen,
  int since,
  Pointer<Utf8> filter,
  int filterLen,
  int previous,
);

// ignore: camel_case_types
typedef kubernetesstartserver_func = Void Function();
typedef KubernetesStartServerFunc = void Function();

// ignore: camel_case_types
typedef prettifyyaml_func = Void Function(
  Int64 port,
  Pointer<Utf8> jsonStr,
  Int32 jsonStrLen,
);
typedef PrettifyYAMLFunc = void Function(
  int port,
  Pointer<Utf8> jsonStr,
  int jsonStrLen,
);

// ignore: camel_case_types
typedef createjsonpatch_func = Void Function(
  Int64 port,
  Pointer<Utf8> source,
  Int32 sourceLen,
  Pointer<Utf8> target,
  Int32 targetLen,
);
typedef CreateJSONPatchFunc = void Function(
  int port,
  Pointer<Utf8> source,
  int sourceLen,
  Pointer<Utf8> target,
  int targetLen,
);

// ignore: camel_case_types
typedef helmlistcharts_func = Void Function(
  Int64 port,
  Pointer<Utf8> contextName,
  Int32 contextNameLen,
  Pointer<Utf8> proxy,
  Int32 proxyLen,
  Int64 timeout,
  Pointer<Utf8> namespace,
  Int32 namespaceLen,
);
typedef HelmListChartsFunc = void Function(
  int port,
  Pointer<Utf8> contextName,
  int contextNameLen,
  Pointer<Utf8> proxy,
  int proxyLen,
  int timeout,
  Pointer<Utf8> namespace,
  int namespaceLen,
);

// ignore: camel_case_types
typedef helmgetchart_func = Void Function(
  Int64 port,
  Pointer<Utf8> contextName,
  Int32 contextNameLen,
  Pointer<Utf8> proxy,
  Int32 proxyLen,
  Int64 timeout,
  Pointer<Utf8> namespace,
  Int32 namespaceLen,
  Pointer<Utf8> name,
  Int32 nameLen,
  Int64 version,
);
typedef HelmGetChartFunc = void Function(
  int port,
  Pointer<Utf8> contextName,
  int contextNameLen,
  Pointer<Utf8> proxy,
  int proxyLen,
  int timeout,
  Pointer<Utf8> namespace,
  int namespaceLen,
  Pointer<Utf8> name,
  int nameLen,
  int version,
);

// ignore: camel_case_types
typedef helmgethistory_func = Void Function(
  Int64 port,
  Pointer<Utf8> contextName,
  Int32 contextNameLen,
  Pointer<Utf8> proxy,
  Int32 proxyLen,
  Int64 timeout,
  Pointer<Utf8> namespace,
  Int32 namespaceLen,
  Pointer<Utf8> name,
  Int32 nameLen,
);
typedef HelmGetHistoryFunc = void Function(
  int port,
  Pointer<Utf8> contextName,
  int contextNameLen,
  Pointer<Utf8> proxy,
  int proxyLen,
  int timeout,
  Pointer<Utf8> namespace,
  int namespaceLen,
  Pointer<Utf8> name,
  int nameLen,
);

// ignore: camel_case_types
typedef prometheusgetdata_func = Void Function(
  Int64 port,
  Pointer<Utf8> contextName,
  Int32 contextNameLen,
  Pointer<Utf8> proxy,
  Int32 proxyLen,
  Int64 timeout,
  Pointer<Utf8> request,
  Int32 requestLen,
);
typedef PrometheusGetDataFunc = void Function(
  int port,
  Pointer<Utf8> contextName,
  int contextNameLen,
  Pointer<Utf8> proxy,
  int proxyLen,
  int timeout,
  Pointer<Utf8> request,
  int requestLen,
);

class KubenavDesktop {
  static final KubenavDesktop _instance = KubenavDesktop._internal();
  late DynamicLibrary _library;

  factory KubenavDesktop() {
    return _instance;
  }

  KubenavDesktop._internal() {
    String libraryPath = _getLibraryPath();
    if (libraryPath == '') {
      exit(0);
    }
    _library = DynamicLibrary.open(libraryPath);
  }

  static String _getLibraryPath() {
    Logger.log(
      'KubenavDesktop _getLibraryPath',
      'Run _getLibraryPath function',
    );

    if (Platform.isWindows) {
      return 'kubenav.dll';
    } else if (Platform.isLinux) {
      return 'kubenav.so';
    } else if (Platform.isMacOS) {
      return 'kubenav.dylib';
    } else {
      return '';
    }
  }

  Future<void> init() async {
    Logger.log(
      'KubenavDesktop init',
      'Run init function',
    );

    var initC = _library.lookup<NativeFunction<init_func>>('Init');
    final init = initC.asFunction<InitFunc>();
    init(NativeApi.initializeApiDLData);
  }

  Map<String, dynamic> kubernetesClusters() {
    Logger.log(
      'KubenavDesktop kubernetesClusters',
      'Run kubernetesClusters function',
    );

    var freePointerC =
        _library.lookup<NativeFunction<freepointer_function>>('FreePointer');
    final freePointer = freePointerC.asFunction<FreePointerFn>();

    var kubernetesClustersC = _library
        .lookup<NativeFunction<kubernetesclusters_func>>('KubernetesClusters');
    final kubernetesClusters =
        kubernetesClustersC.asFunction<KubernetesClustersFunc>();

    Pointer<Utf8> result = kubernetesClusters();
    String jsonData = result.toDartString();
    freePointer(result);

    Logger.log(
      'KubenavDesktop kubernetesClusters',
      'Result of the kubernetesClusters function',
      jsonData,
    );

    return json.decode(jsonData);
  }

  Future<String> kubernetesRequest(
    String contextName,
    String proxy,
    int timeout,
    String method,
    String url,
    String body,
  ) async {
    Logger.log(
      'KubenavDesktop kubernetesRequest',
      'Run kubernetesRequest function',
      '$contextName, $method, $url, $body',
    );

    var kubernetesRequestC = _library
        .lookup<NativeFunction<kubernetesrequest_func>>('KubernetesRequest');
    final kubernetesRequest =
        kubernetesRequestC.asFunction<KubernetesRequestFunc>();

    String receiveData = '';
    bool receivedCallback = false;

    var receivePort = ReceivePort()
      ..listen((data) {
        receiveData = data;
        receivedCallback = true;
      });
    final nativeSendPort = receivePort.sendPort.nativePort;

    kubernetesRequest(
      nativeSendPort,
      contextName.toNativeUtf8(),
      contextName.length,
      proxy.toNativeUtf8(),
      proxy.length,
      timeout,
      method.toNativeUtf8(),
      method.length,
      url.toNativeUtf8(),
      url.length,
      body.toNativeUtf8(),
      body.length,
    );

    while (!receivedCallback) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    receivePort.close();

    Logger.log(
      'KubenavDesktop kubernetesRequest',
      'Result of the kubernetesRequest function',
      receiveData,
    );

    if (receiveData.startsWith('{"error":')) {
      Map<String, dynamic> jsonData = json.decode(receiveData);
      throw Exception(jsonData['error']);
    }

    return receiveData;
  }

  Future<String> kubernetesGetLogs(
    String contextName,
    String proxy,
    int timeout,
    String names,
    String namespace,
    String container,
    int since,
    String filter,
    bool previous,
  ) async {
    Logger.log(
      'KubenavDesktop kubernetesGetLogs',
      'Run kubernetesGetLogs function',
      '$contextName, $names, $namespace, $container, $since, $filter, $previous',
    );

    var kubernetesGetLogsC = _library
        .lookup<NativeFunction<kubernetesgetlogs_func>>('KubernetesGetLogs');
    final kubernetesGetLogs =
        kubernetesGetLogsC.asFunction<KubernetesGetLogsFunc>();

    String receiveData = '';
    bool receivedCallback = false;

    var receivePort = ReceivePort()
      ..listen((data) {
        receiveData = data;
        receivedCallback = true;
      });
    final nativeSendPort = receivePort.sendPort.nativePort;

    kubernetesGetLogs(
      nativeSendPort,
      contextName.toNativeUtf8(),
      contextName.length,
      proxy.toNativeUtf8(),
      proxy.length,
      timeout,
      names.toNativeUtf8(),
      names.length,
      namespace.toNativeUtf8(),
      namespace.length,
      container.toNativeUtf8(),
      container.length,
      since,
      filter.toNativeUtf8(),
      filter.length,
      previous ? 1 : 0,
    );

    while (!receivedCallback) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    receivePort.close();

    Logger.log(
      'KubenavDesktop kubernetesGetLogs',
      'Result of the kubernetesGetLogs function',
      receiveData,
    );

    if (receiveData.startsWith('{"error":')) {
      Map<String, dynamic> jsonData = json.decode(receiveData);
      throw Exception(jsonData['error']);
    }

    return receiveData;
  }

  Future<void> kubernetesStartServer() async {
    Logger.log(
      'KubenavDesktop kubernetesStartServer',
      'Run kubernetesStartServer function',
    );

    var kubernetesStartServerC =
        _library.lookup<NativeFunction<kubernetesstartserver_func>>(
            'KubernetesStartServer');
    final kubernetesStartServer =
        kubernetesStartServerC.asFunction<KubernetesStartServerFunc>();

    kubernetesStartServer();

    return;
  }

  Future<String> prettifyYAML(
    String jsonStr,
  ) async {
    Logger.log(
      'KubenavDesktop prettifyYAML',
      'Run prettifyYAML function',
      jsonStr,
    );

    var prettifyYAMLC =
        _library.lookup<NativeFunction<prettifyyaml_func>>('PrettifyYAML');
    final prettifyYAML = prettifyYAMLC.asFunction<PrettifyYAMLFunc>();

    String receiveData = '';
    bool receivedCallback = false;

    var receivePort = ReceivePort()
      ..listen((data) {
        receiveData = data;
        receivedCallback = true;
      });
    final nativeSendPort = receivePort.sendPort.nativePort;

    prettifyYAML(
      nativeSendPort,
      jsonStr.toNativeUtf8(),
      jsonStr.length,
    );

    while (!receivedCallback) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    receivePort.close();

    Logger.log(
      'KubenavDesktop prettifyYAML',
      'Result of the prettifyYAML function',
      receiveData,
    );

    if (receiveData.startsWith('{"error":')) {
      Map<String, dynamic> jsonData = json.decode(receiveData);
      throw Exception(jsonData['error']);
    }

    return receiveData;
  }

  Future<String> createJSONPatch(
    String source,
    String target,
  ) async {
    Logger.log(
      'KubenavDesktop createJSONPatch',
      'Run createJSONPatch function',
      '$source, $target',
    );

    var createJSONPatchC = _library
        .lookup<NativeFunction<createjsonpatch_func>>('CreateJSONPatch');
    final createJSONPatch = createJSONPatchC.asFunction<CreateJSONPatchFunc>();

    String receiveData = '';
    bool receivedCallback = false;

    var receivePort = ReceivePort()
      ..listen((data) {
        receiveData = data;
        receivedCallback = true;
      });
    final nativeSendPort = receivePort.sendPort.nativePort;

    createJSONPatch(
      nativeSendPort,
      source.toNativeUtf8(),
      source.length,
      target.toNativeUtf8(),
      target.length,
    );

    while (!receivedCallback) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    receivePort.close();

    Logger.log(
      'KubenavDesktop createJSONPatch',
      'Result of the createJSONPatch function',
      receiveData,
    );

    if (receiveData.startsWith('{"error":')) {
      Map<String, dynamic> jsonData = json.decode(receiveData);
      throw Exception(jsonData['error']);
    }

    return receiveData;
  }

  Future<String> helmListCharts(
    String contextName,
    String proxy,
    int timeout,
    String namespace,
  ) async {
    Logger.log(
      'KubenavDesktop helmListCharts',
      'Run helmListCharts function',
      '$contextName, $namespace',
    );

    var helmListChartsC =
        _library.lookup<NativeFunction<helmlistcharts_func>>('HelmListCharts');
    final helmListCharts = helmListChartsC.asFunction<HelmListChartsFunc>();

    String receiveData = '';
    bool receivedCallback = false;

    var receivePort = ReceivePort()
      ..listen((data) {
        receiveData = data;
        receivedCallback = true;
      });
    final nativeSendPort = receivePort.sendPort.nativePort;

    helmListCharts(
      nativeSendPort,
      contextName.toNativeUtf8(),
      contextName.length,
      proxy.toNativeUtf8(),
      proxy.length,
      timeout,
      namespace.toNativeUtf8(),
      namespace.length,
    );

    while (!receivedCallback) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    receivePort.close();

    Logger.log(
      'KubenavDesktop helmListCharts',
      'Result of the helmListCharts function',
      receiveData,
    );

    if (receiveData.startsWith('{"error":')) {
      Map<String, dynamic> jsonData = json.decode(receiveData);
      throw Exception(jsonData['error']);
    }

    return receiveData;
  }

  Future<String> helmGetChart(
    String contextName,
    String proxy,
    int timeout,
    String namespace,
    String name,
    int version,
  ) async {
    Logger.log(
      'KubenavDesktop helmGetChart',
      'Run helmGetChart function',
      '$contextName, $namespace, $name, $version',
    );

    var helmGetChartC =
        _library.lookup<NativeFunction<helmgetchart_func>>('HelmGetChart');
    final helmGetChart = helmGetChartC.asFunction<HelmGetChartFunc>();

    String receiveData = '';
    bool receivedCallback = false;

    var receivePort = ReceivePort()
      ..listen((data) {
        receiveData = data;
        receivedCallback = true;
      });
    final nativeSendPort = receivePort.sendPort.nativePort;

    helmGetChart(
      nativeSendPort,
      contextName.toNativeUtf8(),
      contextName.length,
      proxy.toNativeUtf8(),
      proxy.length,
      timeout,
      namespace.toNativeUtf8(),
      namespace.length,
      name.toNativeUtf8(),
      name.length,
      version,
    );

    while (!receivedCallback) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    receivePort.close();

    Logger.log(
      'KubenavDesktop helmGetChart',
      'Result of the helmGetChart function',
      receiveData,
    );

    if (receiveData.startsWith('{"error":')) {
      Map<String, dynamic> jsonData = json.decode(receiveData);
      throw Exception(jsonData['error']);
    }

    return receiveData;
  }

  Future<String> helmGetHistory(
    String contextName,
    String proxy,
    int timeout,
    String namespace,
    String name,
  ) async {
    Logger.log(
      'KubenavDesktop helmGetHistory',
      'Run helmGetHistory function',
      '$contextName, $namespace, $name',
    );

    var helmGetHistoryC =
        _library.lookup<NativeFunction<helmgethistory_func>>('HelmGetHistory');
    final helmGetHistory = helmGetHistoryC.asFunction<HelmGetHistoryFunc>();

    String receiveData = '';
    bool receivedCallback = false;

    var receivePort = ReceivePort()
      ..listen((data) {
        receiveData = data;
        receivedCallback = true;
      });
    final nativeSendPort = receivePort.sendPort.nativePort;

    helmGetHistory(
      nativeSendPort,
      contextName.toNativeUtf8(),
      contextName.length,
      proxy.toNativeUtf8(),
      proxy.length,
      timeout,
      namespace.toNativeUtf8(),
      namespace.length,
      name.toNativeUtf8(),
      name.length,
    );

    while (!receivedCallback) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    receivePort.close();

    Logger.log(
      'KubenavDesktop helmGetHistory',
      'Result of the helmGetHistory function',
      receiveData,
    );

    if (receiveData.startsWith('{"error":')) {
      Map<String, dynamic> jsonData = json.decode(receiveData);
      throw Exception(jsonData['error']);
    }

    return receiveData;
  }

  Future<String> prometheusGetData(
    String contextName,
    String proxy,
    int timeout,
    String request,
  ) async {
    Logger.log(
      'KubenavDesktop prometheusGetData',
      'Run prometheusGetData function',
      '$contextName, $request',
    );

    var prometheusGetDataC = _library
        .lookup<NativeFunction<prometheusgetdata_func>>('PrometheusGetData');
    final prometheusGetData =
        prometheusGetDataC.asFunction<PrometheusGetDataFunc>();

    String receiveData = '';
    bool receivedCallback = false;

    var receivePort = ReceivePort()
      ..listen((data) {
        receiveData = data;
        receivedCallback = true;
      });
    final nativeSendPort = receivePort.sendPort.nativePort;

    prometheusGetData(
      nativeSendPort,
      contextName.toNativeUtf8(),
      contextName.length,
      proxy.toNativeUtf8(),
      proxy.length,
      timeout,
      request.toNativeUtf8(),
      request.length,
    );

    while (!receivedCallback) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    receivePort.close();

    Logger.log(
      'KubenavDesktop prometheusGetData',
      'Result of the prometheusGetData function',
      receiveData,
    );

    if (receiveData.startsWith('{"error":')) {
      Map<String, dynamic> jsonData = json.decode(receiveData);
      throw Exception(jsonData['error']);
    }

    return receiveData;
  }
}
