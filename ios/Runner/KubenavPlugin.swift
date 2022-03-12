import UIKit
import Flutter
import Kubenav

public class KubenavPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // Note: In release 2.10, the Task Queue API is only available on the master channel for iOS.
    // let taskQueue = registrar.messenger.makeBackgroundTaskQueue()
    // let channel = FlutterMethodChannel(name: "kubenav.io", binaryMessenger: registrar.messenger(), codec: FlutterStandardMethodCodec.sharedInstance, taskQueue: taskQueue)
    let channel = FlutterMethodChannel(name: "kubenav.io", binaryMessenger: registrar.messenger())
    let instance = KubenavPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "kubernetesRequest" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let clusterServer = args["clusterServer"] as? String,
        let clusterCertificateAuthorityData = args["clusterCertificateAuthorityData"] as? String,
        let clusterInsecureSkipTLSVerify = args["clusterInsecureSkipTLSVerify"] as? Bool,
        let userClientCertificateData = args["userClientCertificateData"] as? String,
        let userClientKeyData = args["userClientKeyData"] as? String,
        let userToken = args["userToken"] as? String,
        let userUsername = args["userUsername"] as? String,
        let userPassword = args["userPassword"] as? String,
        let requestMethod = args["requestMethod"] as? String,
        let requestURL = args["requestURL"] as? String,
        let requestBody = args["requestBody"] as? String
      {
        kubernetesRequest(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, requestMethod: requestMethod, requestURL: requestURL, requestBody: requestBody, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "prettifyYAML" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let jsonStr = args["jsonStr"] as? String
      {
        prettifyYAML(jsonStr: jsonStr, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "createJSONPatch" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let source = args["source"] as? String,
        let target = args["target"] as? String
      {
        createJSONPatch(source: source, target: target, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "kubernetesGetLogs" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let clusterServer = args["clusterServer"] as? String,
        let clusterCertificateAuthorityData = args["clusterCertificateAuthorityData"] as? String,
        let clusterInsecureSkipTLSVerify = args["clusterInsecureSkipTLSVerify"] as? Bool,
        let userClientCertificateData = args["userClientCertificateData"] as? String,
        let userClientKeyData = args["userClientKeyData"] as? String,
        let userToken = args["userToken"] as? String,
        let userUsername = args["userUsername"] as? String,
        let userPassword = args["userPassword"] as? String,
        let names = args["names"] as? String,
        let namespace = args["namespace"] as? String,
        let container = args["container"] as? String,
        let since = args["since"] as? Int64,
        let filter = args["filter"] as? String,
        let previous = args["previous"] as? Bool
      {
        kubernetesGetLogs(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, names: names, namespace: namespace, container: container, since: since, filter: filter, previous: previous, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "kubernetesStartServer" {
      kubernetesStartServer(result: result)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func kubernetesRequest(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, requestMethod: String, requestURL: String, requestBody: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavKubernetesRequest(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, requestMethod, requestURL, requestBody, &error)
    if error != nil {
      result(FlutterError(code: "KUBERNETES_REQUEST_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func prettifyYAML(jsonStr: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavPrettifyYAML(jsonStr, &error)
    if error != nil {
      result(FlutterError(code: "PRETTIFY_YAML_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func createJSONPatch(source: String, target: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavCreateJSONPatch(source, target, &error)
    if error != nil {
      result(FlutterError(code: "CREATE_JSON_PATCH_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func kubernetesGetLogs(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, names: String, namespace: String, container: String, since: Int64, filter: String, previous: Bool, result: FlutterResult) {
    var error: NSError?

    let data = KubenavKubernetesGetLogs(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, names, namespace, container, since, filter, previous, &error)
    if error != nil {
      result(FlutterError(code: "KUBERNETES_GET_LOGS_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func kubernetesStartServer(result: FlutterResult) {
    DispatchQueue.background {
      KubenavKubernetesStartServer()
    }
    result("")
  }
}
