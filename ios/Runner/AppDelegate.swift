import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    KubenavPlugin.register(with: registrar(forPlugin: "io.kubenav.kubenav")!)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
