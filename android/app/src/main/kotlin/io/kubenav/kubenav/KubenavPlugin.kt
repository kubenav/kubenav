package io.kubenav.kubenav

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.*
import io.flutter.plugin.common.MethodChannel.*
import java.lang.Exception

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
      val clusterServer = call.argument("clusterServer") as String?
      val clusterCertificateAuthorityData = call.argument("clusterCertificateAuthorityData") as String?
      val clusterInsecureSkipTLSVerify = call.argument("clusterInsecureSkipTLSVerify") as Boolean?
      val userClientCertificateData = call.argument("userClientCertificateData") as String?
      val userClientKeyData = call.argument("userClientKeyData") as String?
      val userToken = call.argument("userToken") as String?
      val userUsername = call.argument("userUsername") as String?
      val userPassword = call.argument("userPassword") as String?
      val requestMethod = call.argument("requestMethod") as String?
      val requestURL = call.argument("requestURL") as String?
      val requestBody = call.argument("requestBody") as String?

      if (clusterServer == null || clusterCertificateAuthorityData == null || clusterInsecureSkipTLSVerify == null || userClientCertificateData == null || userClientKeyData == null || userToken == null || userUsername == null || userPassword == null || requestMethod == null || requestURL == null || requestBody == null) {
        result.error("BAD_ARGUMENTS", null, null)
      } else {
        kubernetesRequest(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, requestMethod, requestURL, requestBody, result)
      }
    } else {
      result.notImplemented()
    }
  }

  private fun kubernetesRequest(clusterServer: String, clusterCertificateAuthorityData: String, clusterInsecureSkipTLSVerify: Boolean, userClientCertificateData: String, userClientKeyData: String, userToken: String, userUsername: String, userPassword: String, requestMethod: String, requestURL: String, requestBody: String, result: MethodChannel.Result) {
    try {
      val data: String = Kubenav.kubernetesRequest(clusterServer, clusterCertificateAuthorityData, clusterInsecureSkipTLSVerify, userClientCertificateData, userClientKeyData, userToken, userUsername, userPassword, requestMethod, requestURL, requestBody)
      result.success(data)
    } catch (e: Exception) {
      result.error("KUBERNETES_REQUEST_FAILED", e.localizedMessage, null)
    }
  }
}
