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
        let proxy = args["proxy"] as? String,
        let timeout = args["timeout"] as? Int64,
        let requestMethod = args["requestMethod"] as? String,
        let requestURL = args["requestURL"] as? String,
        let requestBody = args["requestBody"] as? String
      {
        kubernetesRequest(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, requestMethod: requestMethod, requestURL: requestURL, requestBody: requestBody, result: result)
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
        let proxy = args["proxy"] as? String,
        let timeout = args["timeout"] as? Int64,
        let names = args["names"] as? String,
        let namespace = args["namespace"] as? String,
        let container = args["container"] as? String,
        let since = args["since"] as? Int64,
        let filter = args["filter"] as? String,
        let previous = args["previous"] as? Bool
      {
        kubernetesGetLogs(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, names: names, namespace: namespace, container: container, since: since, filter: filter, previous: previous, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "kubernetesStartServer" {
      kubernetesStartServer(result: result)
    } else if call.method == "azureGetClusters" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let subscriptionID = args["subscriptionID"] as? String,
        let tenantID = args["tenantID"] as? String,
        let clientID = args["clientID"] as? String,
        let clientSecret = args["clientSecret"] as? String,
        let isAdmin = args["isAdmin"] as? Bool
      {
        azureGetClusters(subscriptionID: subscriptionID, tenantID: tenantID, clientID: clientID, clientSecret: clientSecret, isAdmin: isAdmin, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "awsGetClusters" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let accessKeyID = args["accessKeyID"] as? String,
        let secretKey = args["secretKey"] as? String,
        let region = args["region"] as? String,
        let sessionToken = args["sessionToken"] as? String
      {
        awsGetClusters(accessKeyID: accessKeyID, secretKey: secretKey, region: region, sessionToken: sessionToken, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "awsGetToken" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let accessKeyID = args["accessKeyID"] as? String,
        let secretKey = args["secretKey"] as? String,
        let region = args["region"] as? String,
        let sessionToken = args["sessionToken"] as? String,
        let clusterID = args["clusterID"] as? String
      {
        awsGetToken(accessKeyID: accessKeyID, secretKey: secretKey, region: region, sessionToken: sessionToken, clusterID: clusterID, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "awsGetSSOConfig" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let ssoRegion = args["ssoRegion"] as? String,
        let startURL = args["startURL"] as? String
      {
        awsGetSSOConfig(ssoRegion: ssoRegion, startURL: startURL, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "awsGetSSOToken" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let accountID = args["accountID"] as? String,
        let roleName = args["roleName"] as? String,
        let ssoRegion = args["ssoRegion"] as? String,
        let ssoClientID = args["ssoClientID"] as? String,
        let ssoClientSecret = args["ssoClientSecret"] as? String,
        let ssoDeviceCode = args["ssoDeviceCode"] as? String,
        let accessToken = args["accessToken"] as? String,
        let accessTokenExpire = args["accessTokenExpire"] as? Int64
      {
        awsGetSSOToken(accountID: accountID, roleName: roleName, ssoRegion: ssoRegion, ssoClientID: ssoClientID, ssoClientSecret: ssoClientSecret, ssoDeviceCode: ssoDeviceCode, accessToken: accessToken, accessTokenExpire: accessTokenExpire, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "helmListCharts" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let clusterServer = args["clusterServer"] as? String,
        let clusterCertificateAuthorityData = args["clusterCertificateAuthorityData"] as? String,
        let clusterInsecureSkipTLSVerify = args["clusterInsecureSkipTLSVerify"] as? Bool,
        let userClientCertificateData = args["userClientCertificateData"] as? String,
        let userClientKeyData = args["userClientKeyData"] as? String,
        let userToken = args["userToken"] as? String,
        let userUsername = args["userUsername"] as? String,
        let userPassword = args["userPassword"] as? String,
        let proxy = args["proxy"] as? String,
        let timeout = args["timeout"] as? Int64,
        let namespace = args["namespace"] as? String
      {
        helmListCharts(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, namespace: namespace, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "helmGetChart" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let clusterServer = args["clusterServer"] as? String,
        let clusterCertificateAuthorityData = args["clusterCertificateAuthorityData"] as? String,
        let clusterInsecureSkipTLSVerify = args["clusterInsecureSkipTLSVerify"] as? Bool,
        let userClientCertificateData = args["userClientCertificateData"] as? String,
        let userClientKeyData = args["userClientKeyData"] as? String,
        let userToken = args["userToken"] as? String,
        let userUsername = args["userUsername"] as? String,
        let userPassword = args["userPassword"] as? String,
        let proxy = args["proxy"] as? String,
        let timeout = args["timeout"] as? Int64,
        let namespace = args["namespace"] as? String,
        let name = args["name"] as? String,
        let version = args["version"] as? Int64
      {
        helmGetChart(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, namespace: namespace, name: name, version: version, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "helmGetHistory" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let clusterServer = args["clusterServer"] as? String,
        let clusterCertificateAuthorityData = args["clusterCertificateAuthorityData"] as? String,
        let clusterInsecureSkipTLSVerify = args["clusterInsecureSkipTLSVerify"] as? Bool,
        let userClientCertificateData = args["userClientCertificateData"] as? String,
        let userClientKeyData = args["userClientKeyData"] as? String,
        let userToken = args["userToken"] as? String,
        let userUsername = args["userUsername"] as? String,
        let userPassword = args["userPassword"] as? String,
        let proxy = args["proxy"] as? String,
        let timeout = args["timeout"] as? Int64,
        let namespace = args["namespace"] as? String,
        let name = args["name"] as? String
      {
        helmGetHistory(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, namespace: namespace, name: name, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "oidcGetLink" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let discoveryURL = args["discoveryURL"] as? String,
        let clientID = args["clientID"] as? String,
        let clientSecret = args["clientSecret"] as? String,
        let certificateAuthority = args["certificateAuthority"] as? String,
        let scopes = args["scopes"] as? String,
        let redirectURL = args["redirectURL"] as? String,
        let pkceMethod = args["pkceMethod"] as? String
      {
        oidcGetLink(discoveryURL: discoveryURL, clientID: clientID, clientSecret: clientSecret, certificateAuthority: certificateAuthority, scopes: scopes, redirectURL: redirectURL, pkceMethod: pkceMethod, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "oidcGetRefreshToken" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let discoveryURL = args["discoveryURL"] as? String,
        let clientID = args["clientID"] as? String,
        let clientSecret = args["clientSecret"] as? String,
        let certificateAuthority = args["certificateAuthority"] as? String,
        let scopes = args["scopes"] as? String,
        let redirectURL = args["redirectURL"] as? String,
        let pkceMethod = args["pkceMethod"] as? String,
        let code = args["code"] as? String,
        let verifier = args["verifier"] as? String
      {
        oidcGetRefreshToken(discoveryURL: discoveryURL, clientID: clientID, clientSecret: clientSecret, certificateAuthority: certificateAuthority, scopes: scopes, redirectURL: redirectURL, pkceMethod: pkceMethod, code: code, verifier: verifier, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "oidcGetAccessToken" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let discoveryURL = args["discoveryURL"] as? String,
        let clientID = args["clientID"] as? String,
        let clientSecret = args["clientSecret"] as? String,
        let certificateAuthority = args["certificateAuthority"] as? String,
        let scopes = args["scopes"] as? String,
        let redirectURL = args["redirectURL"] as? String,
        let refreshToken = args["refreshToken"] as? String
      {
        oidcGetAccessToken(discoveryURL: discoveryURL, clientID: clientID, clientSecret: clientSecret, certificateAuthority: certificateAuthority, scopes: scopes, redirectURL: redirectURL, refreshToken: refreshToken, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func kubernetesRequest(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, requestMethod: String, requestURL: String, requestBody: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavKubernetesRequest(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, requestMethod, requestURL, requestBody, &error)
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

  private func kubernetesGetLogs(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, names: String, namespace: String, container: String, since: Int64, filter: String, previous: Bool, result: FlutterResult) {
    var error: NSError?

    let data = KubenavKubernetesGetLogs(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, names, namespace, container, since, filter, previous, &error)
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

  private func azureGetClusters(subscriptionID: String, tenantID: String, clientID: String, clientSecret: String, isAdmin: Bool, result: FlutterResult) {
    var error: NSError?

    let data = KubenavAzureGetClusters(subscriptionID, tenantID, clientID, clientSecret, isAdmin, &error)
    if error != nil {
      result(FlutterError(code: "AZURE_GET_CLUSTERS_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func awsGetClusters(accessKeyID: String, secretKey: String, region: String, sessionToken: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavAWSGetClusters(accessKeyID, secretKey, region, sessionToken, &error)
    if error != nil {
      result(FlutterError(code: "AWS_GET_CLUSTERS_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func awsGetToken(accessKeyID: String, secretKey: String, region: String, sessionToken: String, clusterID: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavAWSGetToken(accessKeyID, secretKey, region, sessionToken, clusterID, &error)
    if error != nil {
      result(FlutterError(code: "AWS_GET_TOKEN_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func awsGetSSOConfig(ssoRegion: String, startURL: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavAWSGetSSOConfig(ssoRegion, startURL, &error)
    if error != nil {
      result(FlutterError(code: "AWS_GET_SSO_CONFIG_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func awsGetSSOToken(accountID: String, roleName: String, ssoRegion: String, ssoClientID: String, ssoClientSecret: String, ssoDeviceCode: String, accessToken: String, accessTokenExpire: Int64, result: FlutterResult) {
    var error: NSError?

    let data = KubenavAWSGetSSOToken(accountID, roleName, ssoRegion, ssoClientID, ssoClientSecret, ssoDeviceCode, accessToken, accessTokenExpire, &error)
    if error != nil {
      result(FlutterError(code: "AWS_GET_SSO_TOKEN_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func helmListCharts(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, namespace: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavHelmListCharts(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, &error)
    if error != nil {
      result(FlutterError(code: "HELM_LIST_CHARTS_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func helmGetChart(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, namespace: String, name: String, version: Int64, result: FlutterResult) {
    var error: NSError?

    let data = KubenavHelmGetChart(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, version, &error)
    if error != nil {
      result(FlutterError(code: "HELM_GET_CHART_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func helmGetHistory(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, namespace: String, name: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavHelmGetHistory(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, &error)
    if error != nil {
      result(FlutterError(code: "HELM_GET_HISTORY_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func oidcGetLink(discoveryURL: String, clientID: String, clientSecret: String, certificateAuthority: String, scopes: String, redirectURL: String, pkceMethod: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavOIDCGetLink(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, redirectURL, pkceMethod, &error)
    if error != nil {
      result(FlutterError(code: "OIDC_GET_LINK_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func oidcGetRefreshToken(discoveryURL: String, clientID: String, clientSecret: String, certificateAuthority: String, scopes: String, redirectURL: String, pkceMethod: String, code: String, verifier: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavOIDCGetRefreshToken(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, redirectURL, pkceMethod, code, verifier, &error)
    if error != nil {
      result(FlutterError(code: "OIDC_GET_REFRESH_TOKEN_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func oidcGetAccessToken(discoveryURL: String, clientID: String, clientSecret: String, certificateAuthority: String, scopes: String, redirectURL: String, refreshToken: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavOIDCGetAccessToken(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, redirectURL, refreshToken, &error)
    if error != nil {
      result(FlutterError(code: "OIDC_GET_ACCESS_TOKEN_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }
}
