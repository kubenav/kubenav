import UIKit
import TPInAppReceipt
import Flutter
import Kubenav

public class KubenavPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let taskQueue = registrar.messenger().makeBackgroundTaskQueue?()
    let channel = FlutterMethodChannel(name: "kubenav.io", binaryMessenger: registrar.messenger(), codec: FlutterStandardMethodCodec.sharedInstance(), taskQueue: taskQueue)
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
        let sessionToken = args["sessionToken"] as? String,
        let roleArn = args["roleArn"] as? String
      {
        awsGetClusters(accessKeyID: accessKeyID, secretKey: secretKey, region: region, sessionToken: sessionToken, roleArn: roleArn, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "awsGetToken" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let accessKeyID = args["accessKeyID"] as? String,
        let secretKey = args["secretKey"] as? String,
        let region = args["region"] as? String,
        let sessionToken = args["sessionToken"] as? String,
        let roleArn = args["roleArn"] as? String,
        let clusterID = args["clusterID"] as? String
      {
        awsGetToken(accessKeyID: accessKeyID, secretKey: secretKey, region: region, sessionToken: sessionToken, roleArn: roleArn, clusterID: clusterID, result: result)
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
    } else if call.method == "awsGetSSOAccounts" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let ssoRegion = args["ssoRegion"] as? String,
        let ssoClientID = args["ssoClientID"] as? String,
        let ssoClientSecret = args["ssoClientSecret"] as? String,
        let ssoDeviceCode = args["ssoDeviceCode"] as? String
      {
        awsGetSSOAccounts(ssoRegion: ssoRegion, ssoClientID: ssoClientID, ssoClientSecret: ssoClientSecret, ssoDeviceCode: ssoDeviceCode, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "helmListReleases" {
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
        helmListReleases(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, namespace: namespace, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "helmGetRelease" {
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
        helmGetRelease(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, namespace: namespace, name: name, version: version, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "helmListReleaseHistory" {
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
        helmListReleaseHistory(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, namespace: namespace, name: name, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "helmRollbackRelease" {
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
        let version = args["version"] as? Int64,
        let options = args["options"] as? String
      {
        helmRollbackRelease(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, namespace: namespace, name: name, version: version, options: options, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "helmUninstallRelease" {
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
        let options = args["options"] as? String
      {
        helmUninstallRelease(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, namespace: namespace, name: name, options: options, result: result)
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
        let verifier = args["verifier"] as? String,
        let useAccessToken = args["useAccessToken"] as? Bool
      {
        oidcGetRefreshToken(discoveryURL: discoveryURL, clientID: clientID, clientSecret: clientSecret, certificateAuthority: certificateAuthority, scopes: scopes, redirectURL: redirectURL, pkceMethod: pkceMethod, code: code, verifier: verifier, useAccessToken: useAccessToken, result: result)
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
        let refreshToken = args["refreshToken"] as? String,
        let useAccessToken = args["useAccessToken"] as? Bool
      {
        oidcGetAccessToken(discoveryURL: discoveryURL, clientID: clientID, clientSecret: clientSecret, certificateAuthority: certificateAuthority, scopes: scopes, redirectURL: redirectURL, refreshToken: refreshToken, useAccessToken: useAccessToken, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "oidcDeviceAuth" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let discoveryURL = args["discoveryURL"] as? String,
        let clientID = args["clientID"] as? String,
        let certificateAuthority = args["certificateAuthority"] as? String,
        let scopes = args["scopes"] as? String
      {
        oidcDeviceAuth(discoveryURL: discoveryURL, clientID: clientID, certificateAuthority: certificateAuthority, scopes: scopes, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "oidcDeviceAuthGetRefreshToken" {
      if let args = call.arguments as? Dictionary<String, Any>,
        let discoveryURL = args["discoveryURL"] as? String,
        let clientID = args["clientID"] as? String,
        let certificateAuthority = args["certificateAuthority"] as? String,
        let scopes = args["scopes"] as? String,
        let deviceCode = args["deviceCode"] as? String,
        let useAccessToken = args["useAccessToken"] as? Bool
      {
        oidcDeviceAuthGetRefreshToken(discoveryURL: discoveryURL, clientID: clientID, certificateAuthority: certificateAuthority, scopes: scopes, deviceCode: deviceCode, useAccessToken: useAccessToken, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "prometheusGetData" {
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
        let request = args["request"] as? String
      {
        prometheusGetData(clusterServer: clusterServer, clusterCertificateAuthorityData: clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify: clusterInsecureSkipTLSVerify, userClientCertificateData: userClientCertificateData, userClientKeyData: userClientKeyData, userToken: userToken, userUsername: userUsername, userPassword: userPassword, proxy: proxy, timeout: timeout, request: request, result: result)
      } else {
        result(FlutterError(code: "BAD_ARGUMENTS", message: nil, details: nil))
      }
    } else if call.method == "verifyIAP" {
      verifyIAP(result: result)
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

  private func awsGetClusters(accessKeyID: String, secretKey: String, region: String, sessionToken: String, roleArn: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavAWSGetClusters(accessKeyID, secretKey, region, sessionToken, roleArn, &error)
    if error != nil {
      result(FlutterError(code: "AWS_GET_CLUSTERS_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func awsGetToken(accessKeyID: String, secretKey: String, region: String, sessionToken: String, roleArn: String, clusterID: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavAWSGetToken(accessKeyID, secretKey, region, sessionToken, roleArn, clusterID, &error)
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

  private func awsGetSSOAccounts(ssoRegion: String, ssoClientID: String, ssoClientSecret: String, ssoDeviceCode: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavAWSGetSSOAccounts(ssoRegion, ssoClientID, ssoClientSecret, ssoDeviceCode, &error)
    if error != nil {
      result(FlutterError(code: "AWS_GET_SSO_ACCOUNTS_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func helmListReleases(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, namespace: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavHelmListReleases(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, &error)
    if error != nil {
      result(FlutterError(code: "HELM_LIST_RELEASES_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func helmGetRelease(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, namespace: String, name: String, version: Int64, result: FlutterResult) {
    var error: NSError?

    let data = KubenavHelmGetRelease(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, version, &error)
    if error != nil {
      result(FlutterError(code: "HELM_GET_RELEASE_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func helmListReleaseHistory(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, namespace: String, name: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavHelmListReleaseHistory(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, &error)
    if error != nil {
      result(FlutterError(code: "HELM_LIST_RELEASE_HISTORY_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func helmRollbackRelease(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, namespace: String, name: String, version: Int64, options: String, result: FlutterResult) {
    var error: NSError?

    KubenavHelmRollbackRelease(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, version, options, &error)
    if error != nil {
      result(FlutterError(code: "HELM_ROLLBACK_RELEASE_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result("")
    }
  }

  private func helmUninstallRelease(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, namespace: String, name: String, options: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavHelmUninstallRelease(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, options, &error)
    if error != nil {
      result(FlutterError(code: "HELM_UNINSTALL_RELEASE_FAILED", message: error?.localizedDescription ?? "", details: nil))
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

  private func oidcGetRefreshToken(discoveryURL: String, clientID: String, clientSecret: String, certificateAuthority: String, scopes: String, redirectURL: String, pkceMethod: String, code: String, verifier: String, useAccessToken: Bool, result: FlutterResult) {
    var error: NSError?

    let data = KubenavOIDCGetRefreshToken(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, redirectURL, pkceMethod, code, verifier, useAccessToken, &error)
    if error != nil {
      result(FlutterError(code: "OIDC_GET_REFRESH_TOKEN_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func oidcGetAccessToken(discoveryURL: String, clientID: String, clientSecret: String, certificateAuthority: String, scopes: String, redirectURL: String, refreshToken: String, useAccessToken: Bool, result: FlutterResult) {
    var error: NSError?

    let data = KubenavOIDCGetAccessToken(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, redirectURL, refreshToken, useAccessToken, &error)
    if error != nil {
      result(FlutterError(code: "OIDC_GET_ACCESS_TOKEN_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func oidcDeviceAuth(discoveryURL: String, clientID: String, certificateAuthority: String, scopes: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavOIDCDeviceAuth(discoveryURL, clientID, certificateAuthority, scopes, &error)
    if error != nil {
      result(FlutterError(code: "OIDC_DEVICE_AUTH_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func oidcDeviceAuthGetRefreshToken(discoveryURL: String, clientID: String, certificateAuthority: String, scopes: String, deviceCode: String, useAccessToken: Bool, result: FlutterResult) {
    var error: NSError?

    let data = KubenavOIDCDeviceAuthGetRefreshToken(discoveryURL, clientID, certificateAuthority, scopes, deviceCode, useAccessToken, &error)
    if error != nil {
      result(FlutterError(code: "OIDC_DEVICE_AUTH_GET_REFRESH_TOKEN_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func prometheusGetData(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Bool, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Int64, request: String, result: FlutterResult) {
    var error: NSError?

    let data = KubenavPrometheusGetData(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, request, &error)
    if error != nil {
      result(FlutterError(code: "PROMETHEUS_GET_DATA_FAILED", message: error?.localizedDescription ?? "", details: nil))
    } else {
      result(data)
    }
  }

  private func verifyIAP(result: FlutterResult) {
    do {
      let receipt = try InAppReceipt.localReceipt()
      try receipt.validate()

      let activePurchases: [InAppPurchase] = receipt.activeAutoRenewableSubscriptionPurchases
      if activePurchases.isEmpty {
        result("false")
      } else {
        result("true")
      }
    } catch {
      result(FlutterError(code: "VERIFY_IAP_FAILED", message: error.localizedDescription, details: nil))
    }
  }
}
