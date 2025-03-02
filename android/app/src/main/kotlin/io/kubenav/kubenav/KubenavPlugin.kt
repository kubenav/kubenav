package io.kubenav.kubenav

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.*
import io.flutter.plugin.common.MethodChannel.*
import java.lang.Exception
import java.util.concurrent.Executors;

import kubenav.Kubenav;

class KubenavPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val taskQueue = flutterPluginBinding.binaryMessenger.makeBackgroundTaskQueue()
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kubenav.io", StandardMethodCodec.INSTANCE, taskQueue)
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "kubernetesRequest") {
      val clusterServer = call.argument<String>("clusterServer")
      val clusterCertificateAuthorityData = call.argument<String>("clusterCertificateAuthorityData")
      val clusterInsecureSkipTLSVerify = call.argument<Boolean>("clusterInsecureSkipTLSVerify")
      val userClientCertificateData = call.argument<String>("userClientCertificateData")
      val userClientKeyData = call.argument<String>("userClientKeyData")
      val userToken = call.argument<String>("userToken")
      val userUsername = call.argument<String>("userUsername")
      val userPassword = call.argument<String>("userPassword")
      val proxy = call.argument<String>("proxy")
      val timeout = call.argument<Number>("timeout")?.toLong()
      val requestMethod = call.argument<String>("requestMethod")
      val requestURL = call.argument<String>("requestURL")
      val requestBody = call.argument<String>("requestBody")

      if (clusterServer == null || clusterCertificateAuthorityData == null || clusterInsecureSkipTLSVerify == null || userClientCertificateData == null || userClientKeyData == null || userToken == null || userUsername == null || userPassword == null || proxy == null || timeout == null || requestMethod == null || requestURL == null || requestBody == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        kubernetesRequest(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, requestMethod, requestURL, requestBody, result)
      }
    } else if (call.method == "prettifyYAML") {
      val jsonStr = call.argument<String>("jsonStr")

      if (jsonStr == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        prettifyYAML(jsonStr, result)
      }
    } else if (call.method == "createJSONPatch") {
      val source = call.argument<String>("source")
      val target = call.argument<String>("target")

      if (source == null || target == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        createJSONPatch(source, target, result)
      }
    } else if (call.method == "kubernetesGetLogs") {
      val clusterServer = call.argument<String>("clusterServer")
      val clusterCertificateAuthorityData = call.argument<String>("clusterCertificateAuthorityData")
      val clusterInsecureSkipTLSVerify = call.argument<Boolean>("clusterInsecureSkipTLSVerify")
      val userClientCertificateData = call.argument<String>("userClientCertificateData")
      val userClientKeyData = call.argument<String>("userClientKeyData")
      val userToken = call.argument<String>("userToken")
      val userUsername = call.argument<String>("userUsername")
      val userPassword = call.argument<String>("userPassword")
      val proxy = call.argument<String>("proxy")
      val timeout = call.argument<Number>("timeout")?.toLong()
      val names = call.argument<String>("names")
      val namespace = call.argument<String>("namespace")
      val container = call.argument<String>("container")
      val since = call.argument<Number>("since")?.toLong()
      val filter = call.argument<String>("filter")
      val previous = call.argument<Boolean>("previous")

      if (clusterServer == null || clusterCertificateAuthorityData == null || clusterInsecureSkipTLSVerify == null || userClientCertificateData == null || userClientKeyData == null || userToken == null || userUsername == null || userPassword == null || proxy == null || timeout == null || names == null || namespace == null || container == null || since == null || filter == null || previous == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        kubernetesGetLogs(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, names, namespace, container, since, filter, previous, result)
      }
    } else if (call.method == "kubernetesStartServer") {
      kubernetesStartServer(result)
    } else if (call.method == "azureGetClusters") {
      val subscriptionID = call.argument<String>("subscriptionID")
      val tenantID = call.argument<String>("tenantID")
      val clientID = call.argument<String>("clientID")
      val clientSecret = call.argument<String>("clientSecret")
      val isAdmin = call.argument<Boolean>("isAdmin")

      if (subscriptionID == null || tenantID == null || clientID == null || clientSecret == null || isAdmin == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        azureGetClusters(subscriptionID, tenantID, clientID, clientSecret, isAdmin, result)
      }
    } else if (call.method == "awsGetClusters") {
      val accessKeyID = call.argument<String>("accessKeyID")
      val secretKey = call.argument<String>("secretKey")
      val region = call.argument<String>("region")
      val sessionToken = call.argument<String>("sessionToken")
      val roleArn = call.argument<String>("roleArn")

      if (accessKeyID == null || secretKey == null || region == null || sessionToken == null || roleArn == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        awsGetClusters(accessKeyID, secretKey, region, sessionToken, roleArn, result)
      }
    } else if (call.method == "awsGetToken") {
      val accessKeyID = call.argument<String>("accessKeyID")
      val secretKey = call.argument<String>("secretKey")
      val region = call.argument<String>("region")
      val sessionToken = call.argument<String>("sessionToken")
      val roleArn = call.argument<String>("roleArn")
      val clusterID = call.argument<String>("clusterID")

      if (accessKeyID == null || secretKey == null || region == null || sessionToken == null || roleArn == null || clusterID == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        awsGetToken(accessKeyID, secretKey, region, sessionToken, roleArn, clusterID, result)
      }
    } else if (call.method == "awsGetSSOConfig") {
      val ssoRegion = call.argument<String>("ssoRegion")
      val startURL = call.argument<String>("startURL")

      if (ssoRegion == null || startURL == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        awsGetSSOConfig(ssoRegion, startURL, result)
      }
    } else if (call.method == "awsGetSSOToken") {
      val accountID = call.argument<String>("accountID")
      val roleName = call.argument<String>("roleName")
      val ssoRegion = call.argument<String>("ssoRegion")
      val ssoClientID = call.argument<String>("ssoClientID")
      val ssoClientSecret = call.argument<String>("ssoClientSecret")
      val ssoDeviceCode = call.argument<String>("ssoDeviceCode")
      val accessToken = call.argument<String>("accessToken")
      val accessTokenExpire = call.argument<Number>("accessTokenExpire")?.toLong()

      if (accountID == null || roleName == null || ssoRegion == null || ssoClientID == null || ssoClientSecret == null || ssoDeviceCode == null || accessToken == null || accessTokenExpire == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        awsGetSSOToken(accountID, roleName, ssoRegion, ssoClientID, ssoClientSecret, ssoDeviceCode, accessToken, accessTokenExpire, result)
      }
    } else if (call.method == "awsGetSSOAccounts") {
      val ssoRegion = call.argument<String>("ssoRegion")
      val ssoClientID = call.argument<String>("ssoClientID")
      val ssoClientSecret = call.argument<String>("ssoClientSecret")
      val ssoDeviceCode = call.argument<String>("ssoDeviceCode")

      if (ssoRegion == null || ssoClientID == null || ssoClientSecret == null || ssoDeviceCode == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        awsGetSSOAccounts(ssoRegion, ssoClientID, ssoClientSecret, ssoDeviceCode, result)
      }
    } else if (call.method == "helmListReleases") {
      val clusterServer = call.argument<String>("clusterServer")
      val clusterCertificateAuthorityData = call.argument<String>("clusterCertificateAuthorityData")
      val clusterInsecureSkipTLSVerify = call.argument<Boolean>("clusterInsecureSkipTLSVerify")
      val userClientCertificateData = call.argument<String>("userClientCertificateData")
      val userClientKeyData = call.argument<String>("userClientKeyData")
      val userToken = call.argument<String>("userToken")
      val userUsername = call.argument<String>("userUsername")
      val userPassword = call.argument<String>("userPassword")
      val proxy = call.argument<String>("proxy")
      val timeout = call.argument<Number>("timeout")?.toLong()
      val namespace = call.argument<String>("namespace")

      if (clusterServer == null || clusterCertificateAuthorityData == null || clusterInsecureSkipTLSVerify == null || userClientCertificateData == null || userClientKeyData == null || userToken == null || userUsername == null || userPassword == null || proxy == null || timeout == null || namespace == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        helmListReleases(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, result)
      }
    } else if (call.method == "helmGetRelease") {
      val clusterServer = call.argument<String>("clusterServer")
      val clusterCertificateAuthorityData = call.argument<String>("clusterCertificateAuthorityData")
      val clusterInsecureSkipTLSVerify = call.argument<Boolean>("clusterInsecureSkipTLSVerify")
      val userClientCertificateData = call.argument<String>("userClientCertificateData")
      val userClientKeyData = call.argument<String>("userClientKeyData")
      val userToken = call.argument<String>("userToken")
      val userUsername = call.argument<String>("userUsername")
      val userPassword = call.argument<String>("userPassword")
      val proxy = call.argument<String>("proxy")
      val timeout = call.argument<Number>("timeout")?.toLong()
      val namespace = call.argument<String>("namespace")
      val name = call.argument<String>("name")
      val version = call.argument<Number>("version")?.toLong()

      if (clusterServer == null || clusterCertificateAuthorityData == null || clusterInsecureSkipTLSVerify == null || userClientCertificateData == null || userClientKeyData == null || userToken == null || userUsername == null || userPassword == null || proxy == null || timeout == null || namespace == null || name == null || version == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        helmGetRelease(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, version, result)
      }
    } else if (call.method == "helmListReleaseHistory") {
      val clusterServer = call.argument<String>("clusterServer")
      val clusterCertificateAuthorityData = call.argument<String>("clusterCertificateAuthorityData")
      val clusterInsecureSkipTLSVerify = call.argument<Boolean>("clusterInsecureSkipTLSVerify")
      val userClientCertificateData = call.argument<String>("userClientCertificateData")
      val userClientKeyData = call.argument<String>("userClientKeyData")
      val userToken = call.argument<String>("userToken")
      val userUsername = call.argument<String>("userUsername")
      val userPassword = call.argument<String>("userPassword")
      val proxy = call.argument<String>("proxy")
      val timeout = call.argument<Number>("timeout")?.toLong()
      val namespace = call.argument<String>("namespace")
      val name = call.argument<String>("name")

      if (clusterServer == null || clusterCertificateAuthorityData == null || clusterInsecureSkipTLSVerify == null || userClientCertificateData == null || userClientKeyData == null || userToken == null || userUsername == null || userPassword == null || proxy == null || timeout == null || namespace == null || name == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        helmListReleaseHistory(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, result)
      }
    } else if (call.method == "helmRollbackRelease") {
      val clusterServer = call.argument<String>("clusterServer")
      val clusterCertificateAuthorityData = call.argument<String>("clusterCertificateAuthorityData")
      val clusterInsecureSkipTLSVerify = call.argument<Boolean>("clusterInsecureSkipTLSVerify")
      val userClientCertificateData = call.argument<String>("userClientCertificateData")
      val userClientKeyData = call.argument<String>("userClientKeyData")
      val userToken = call.argument<String>("userToken")
      val userUsername = call.argument<String>("userUsername")
      val userPassword = call.argument<String>("userPassword")
      val proxy = call.argument<String>("proxy")
      val timeout = call.argument<Number>("timeout")?.toLong()
      val namespace = call.argument<String>("namespace")
      val name = call.argument<String>("name")
      val version = call.argument<Number>("version")?.toLong()
      val options = call.argument<String>("options")

      if (clusterServer == null || clusterCertificateAuthorityData == null || clusterInsecureSkipTLSVerify == null || userClientCertificateData == null || userClientKeyData == null || userToken == null || userUsername == null || userPassword == null || proxy == null || timeout == null || namespace == null || name == null || version == null || options == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        helmRollbackRelease(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, version, options, result)
      }
    } else if (call.method == "helmUninstallRelease") {
      val clusterServer = call.argument<String>("clusterServer")
      val clusterCertificateAuthorityData = call.argument<String>("clusterCertificateAuthorityData")
      val clusterInsecureSkipTLSVerify = call.argument<Boolean>("clusterInsecureSkipTLSVerify")
      val userClientCertificateData = call.argument<String>("userClientCertificateData")
      val userClientKeyData = call.argument<String>("userClientKeyData")
      val userToken = call.argument<String>("userToken")
      val userUsername = call.argument<String>("userUsername")
      val userPassword = call.argument<String>("userPassword")
      val proxy = call.argument<String>("proxy")
      val timeout = call.argument<Number>("timeout")?.toLong()
      val namespace = call.argument<String>("namespace")
      val name = call.argument<String>("name")
      val options = call.argument<String>("options")

      if (clusterServer == null || clusterCertificateAuthorityData == null || clusterInsecureSkipTLSVerify == null || userClientCertificateData == null || userClientKeyData == null || userToken == null || userUsername == null || userPassword == null || proxy == null || timeout == null || namespace == null || name == null || options == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        helmUninstallRelease(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, options, result)
      }
    } else if (call.method == "oidcGetLink") {
      val discoveryURL = call.argument<String>("discoveryURL")
      val clientID = call.argument<String>("clientID")
      val clientSecret = call.argument<String>("clientSecret")
      val certificateAuthority = call.argument<String>("certificateAuthority")
      val scopes = call.argument<String>("scopes")
      val addDefaultScopes = call.argument<Boolean>("addDefaultScopes")
      val redirectURL = call.argument<String>("redirectURL")
      val pkceMethod = call.argument<String>("pkceMethod")
      val state = call.argument<String>("state")

      if (discoveryURL == null || clientID == null || clientSecret == null || certificateAuthority == null || scopes == null || addDefaultScopes == null || redirectURL == null || pkceMethod == null || state == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        oidcGetLink(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, addDefaultScopes, redirectURL, pkceMethod, state, result)
      }
    } else if (call.method == "oidcGetRefreshToken") {
      val discoveryURL = call.argument<String>("discoveryURL")
      val clientID = call.argument<String>("clientID")
      val clientSecret = call.argument<String>("clientSecret")
      val certificateAuthority = call.argument<String>("certificateAuthority")
      val scopes = call.argument<String>("scopes")
      val addDefaultScopes = call.argument<Boolean>("addDefaultScopes")
      val redirectURL = call.argument<String>("redirectURL")
      val pkceMethod = call.argument<String>("pkceMethod")
      val code = call.argument<String>("code")
      val verifier = call.argument<String>("verifier")
      val useAccessToken = call.argument<Boolean>("useAccessToken")

      if (discoveryURL == null || clientID == null || clientSecret == null || certificateAuthority == null || scopes == null || addDefaultScopes == null || redirectURL == null || pkceMethod == null || code == null || verifier == null || useAccessToken == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        oidcGetRefreshToken(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, addDefaultScopes, redirectURL, pkceMethod, code, verifier, useAccessToken, result)
      }
    } else if (call.method == "oidcGetAccessToken") {
      val discoveryURL = call.argument<String>("discoveryURL")
      val clientID = call.argument<String>("clientID")
      val clientSecret = call.argument<String>("clientSecret")
      val certificateAuthority = call.argument<String>("certificateAuthority")
      val scopes = call.argument<String>("scopes")
      val addDefaultScopes = call.argument<Boolean>("addDefaultScopes")
      val redirectURL = call.argument<String>("redirectURL")
      val refreshToken = call.argument<String>("refreshToken")
      val useAccessToken = call.argument<Boolean>("useAccessToken")

      if (discoveryURL == null || clientID == null || clientSecret == null || certificateAuthority == null || scopes == null || addDefaultScopes == null || redirectURL == null || refreshToken == null || useAccessToken == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        oidcGetAccessToken(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, addDefaultScopes , redirectURL, refreshToken, useAccessToken, result)
      }
    } else if (call.method == "oidcDeviceAuth") {
      val discoveryURL = call.argument<String>("discoveryURL")
      val clientID = call.argument<String>("clientID")
      val certificateAuthority = call.argument<String>("certificateAuthority")
      val scopes = call.argument<String>("scopes")
      val addDefaultScopes = call.argument<Boolean>("addDefaultScopes")

      if (discoveryURL == null || clientID == null || certificateAuthority == null || scopes == null || addDefaultScopes == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        oidcDeviceAuth(discoveryURL, clientID, certificateAuthority, scopes, addDefaultScopes, result)
      }
    } else if (call.method == "oidcDeviceAuthGetRefreshToken") {
      val discoveryURL = call.argument<String>("discoveryURL")
      val clientID = call.argument<String>("clientID")
      val certificateAuthority = call.argument<String>("certificateAuthority")
      val scopes = call.argument<String>("scopes")
      val addDefaultScopes = call.argument<Boolean>("addDefaultScopes")
      val deviceCode = call.argument<String>("deviceCode")
      val useAccessToken = call.argument<Boolean>("useAccessToken")

      if (discoveryURL == null || clientID == null || certificateAuthority == null || scopes == null || addDefaultScopes == null || deviceCode == null || useAccessToken == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        oidcDeviceAuthGetRefreshToken(discoveryURL, clientID, certificateAuthority, scopes, addDefaultScopes, deviceCode, useAccessToken, result)
      }
    } else if (call.method == "prometheusGetData") {
      val clusterServer = call.argument<String>("clusterServer")
      val clusterCertificateAuthorityData = call.argument<String>("clusterCertificateAuthorityData")
      val clusterInsecureSkipTLSVerify = call.argument<Boolean>("clusterInsecureSkipTLSVerify")
      val userClientCertificateData = call.argument<String>("userClientCertificateData")
      val userClientKeyData = call.argument<String>("userClientKeyData")
      val userToken = call.argument<String>("userToken")
      val userUsername = call.argument<String>("userUsername")
      val userPassword = call.argument<String>("userPassword")
      val proxy = call.argument<String>("proxy")
      val timeout = call.argument<Number>("timeout")?.toLong()
      val request = call.argument<String>("request")

      if (clusterServer == null || clusterCertificateAuthorityData == null || clusterInsecureSkipTLSVerify == null || userClientCertificateData == null || userClientKeyData == null || userToken == null || userUsername == null || userPassword == null || proxy == null || timeout == null || request == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        prometheusGetData(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, request, result)
      }
    } else if (call.method == "verifyIAP") {
      result.notImplemented()
    } else {
      result.notImplemented()
    }
  }

  private fun kubernetesRequest(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Boolean, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Long, requestMethod: String, requestURL: String, requestBody: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.kubernetesRequest(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, requestMethod, requestURL, requestBody)
      result.success(data)
    } catch (e: Exception) {
      result.error("KUBERNETES_REQUEST_FAILED", e.localizedMessage, null)
    }
  }

  private fun prettifyYAML(jsonStr: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.prettifyYAML(jsonStr)
      result.success(data)
    } catch (e: Exception) {
      result.error("PRETTIFY_YAML_FAILED", e.localizedMessage, null)
    }
  }

  private fun createJSONPatch(source: String, target: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.createJSONPatch(source, target)
      result.success(data)
    } catch (e: Exception) {
      result.error("CREATE_JSON_PATCH_FAILED", e.localizedMessage, null)
    }
  }

  private fun kubernetesGetLogs(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Boolean, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Long, names: String, namespace: String, container: String, since: Long, filter: String, previous: Boolean, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.kubernetesGetLogs(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, names, namespace, container, since, filter, previous)
      result.success(data)
    } catch (e: Exception) {
      result.error("KUBERNETES_GET_LOGS_FAILED", e.localizedMessage, null)
    }
  }

  private fun kubernetesStartServer(result: MethodChannel.Result) {
    val executor = Executors.newSingleThreadExecutor()
    executor.execute {
      Kubenav.kubernetesStartServer();
    }
    result.success("")
  }

  private fun azureGetClusters(subscriptionID: String, tenantID: String, clientID: String, clientSecret: String, isAdmin: Boolean, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.azureGetClusters(subscriptionID, tenantID, clientID, clientSecret, isAdmin)
      result.success(data)
    } catch (e: Exception) {
      result.error("AZURE_GET_CLUSTERS_FAILED", e.localizedMessage, null)
    }
  }

  private fun awsGetClusters(accessKeyID: String, secretKey: String, region: String, sessionToken: String, roleArn: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.awsGetClusters(accessKeyID, secretKey, region, sessionToken, roleArn)
      result.success(data)
    } catch (e: Exception) {
      result.error("AWS_GET_CLUSTERS_FAILED", e.localizedMessage, null)
    }
  }

  private fun awsGetToken(accessKeyID: String, secretKey: String, region: String, sessionToken: String, roleArn: String, clusterID: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.awsGetToken(accessKeyID, secretKey, region, sessionToken, roleArn, clusterID)
      result.success(data)
    } catch (e: Exception) {
      result.error("AWS_GET_TOKEN_FAILED", e.localizedMessage, null)
    }
  }

  private fun awsGetSSOConfig(ssoRegion: String, startURL: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.awsGetSSOConfig(ssoRegion, startURL)
      result.success(data)
    } catch (e: Exception) {
      result.error("AWS_GET_SSO_CONFIG_FAILED", e.localizedMessage, null)
    }
  }

  private fun awsGetSSOToken(accountID: String, roleName: String, ssoRegion: String, ssoClientID: String, ssoClientSecret: String, ssoDeviceCode: String, accessToken: String, accessTokenExpire: Long, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.awsGetSSOToken(accountID, roleName, ssoRegion, ssoClientID, ssoClientSecret, ssoDeviceCode, accessToken, accessTokenExpire)
      result.success(data)
    } catch (e: Exception) {
      result.error("AWS_GET_SSO_TOKEN_FAILED", e.localizedMessage, null)
    }
  }

  private fun awsGetSSOAccounts(ssoRegion: String, ssoClientID: String, ssoClientSecret: String, ssoDeviceCode: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.awsGetSSOAccounts(ssoRegion, ssoClientID, ssoClientSecret, ssoDeviceCode)
      result.success(data)
    } catch (e: Exception) {
      result.error("AWS_GET_SSO_ACCOUNTS_FAILED", e.localizedMessage, null)
    }
  }

  private fun helmListReleases(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Boolean, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Long, namespace: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.helmListReleases(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace)
      result.success(data)
    } catch (e: Exception) {
      result.error("HELM_LIST_RELEASES_FAILED", e.localizedMessage, null)
    }
  }

  private fun helmGetRelease(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Boolean, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Long, namespace: String, name: String, version: Long, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.helmGetRelease(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, version)
      result.success(data)
    } catch (e: Exception) {
      result.error("HELM_GET_RELEASES_FAILED", e.localizedMessage, null)
    }
  }

  private fun helmListReleaseHistory(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Boolean, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Long, namespace: String, name: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.helmListReleaseHistory(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name)
      result.success(data)
    } catch (e: Exception) {
      result.error("HELM_GET_LIST_RELEASE_HISTORY_FAILED", e.localizedMessage, null)
    }
  }

  private fun helmRollbackRelease(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Boolean, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Long, namespace: String, name: String, version: Long, options: String, result: MethodChannel.Result) {
    try {
      Kubenav.helmRollbackRelease(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, version, options)
      result.success("")
    } catch (e: Exception) {
      result.error("HELM_ROLLBACK_RELEASE_FAILED", e.localizedMessage, null)
    }
  }

  private fun helmUninstallRelease(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Boolean, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Long, namespace: String, name: String, options: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.helmUninstallRelease(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, namespace, name, options)
      result.success(data)
    } catch (e: Exception) {
      result.error("HELM_UNINSTALL_RELEASE_FAILED", e.localizedMessage, null)
    }
  }

  private fun oidcGetLink(discoveryURL: String, clientID: String, clientSecret: String, certificateAuthority: String, scopes: String, addDefaultScopes: Boolean, redirectURL: String, pkceMethod: String, state: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.oidcGetLink(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, addDefaultScopes, redirectURL, pkceMethod, state)
      result.success(data)
    } catch (e: Exception) {
      result.error("OIDC_GET_LINK_FAILED", e.localizedMessage, null)
    }
  }

  private fun oidcGetRefreshToken(discoveryURL: String, clientID: String, clientSecret: String, certificateAuthority: String, scopes: String, addDefaultScopes: Boolean, redirectURL: String, pkceMethod: String, code: String, verifier: String, useAccessToken: Boolean, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.oidcGetRefreshToken(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, addDefaultScopes, redirectURL, pkceMethod, code, verifier, useAccessToken)
      result.success(data)
    } catch (e: Exception) {
      result.error("OIDC_GET_REFRESH_TOKEN_FAILED", e.localizedMessage, null)
    }
  }

  private fun oidcGetAccessToken(discoveryURL: String, clientID: String, clientSecret: String, certificateAuthority: String, scopes: String, addDefaultScopes: Boolean, redirectURL: String, refreshToken: String, useAccessToken: Boolean, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.oidcGetAccessToken(discoveryURL, clientID, clientSecret, certificateAuthority, scopes, addDefaultScopes, redirectURL, refreshToken, useAccessToken)
      result.success(data)
    } catch (e: Exception) {
      result.error("OIDC_GET_ACCESS_TOKEN_FAILED", e.localizedMessage, null)
    }
  }

  private fun oidcDeviceAuth(discoveryURL: String, clientID: String, certificateAuthority: String, scopes: String, addDefaultScopes: Boolean, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.oidcDeviceAuth(discoveryURL, clientID, certificateAuthority, scopes, addDefaultScopes)
      result.success(data)
    } catch (e: Exception) {
      result.error("OIDC_DEVICE_AUTH_FAILED", e.localizedMessage, null)
    }
  }

  private fun oidcDeviceAuthGetRefreshToken(discoveryURL: String, clientID: String, certificateAuthority: String, scopes: String, addDefaultScopes: Boolean, deviceCode: String, useAccessToken: Boolean, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.oidcDeviceAuthGetRefreshToken(discoveryURL, clientID, certificateAuthority, scopes, addDefaultScopes, deviceCode, useAccessToken)
      result.success(data)
    } catch (e: Exception) {
      result.error("OIDC_DEVICE_AUTH_GET_REFRESH_TOKEN_FAILED", e.localizedMessage, null)
    }
  }

  private fun prometheusGetData(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Boolean, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, proxy: String, timeout: Long, request: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.prometheusGetData(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, proxy, timeout, request)
      result.success(data)
    } catch (e: Exception) {
      result.error("PROMETHEUS_GET_DATA_FAILED", e.localizedMessage, null)
    }
  }
}
