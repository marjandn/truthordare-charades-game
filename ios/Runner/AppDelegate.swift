import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let truthOrDareChannel = FlutterMethodChannel(name: "ir.progrun.app/truthordare",
                                                binaryMessenger: controller.binaryMessenger)
      
     
      truthOrDareChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          
          if call.method == "setLandscape"{
              let value = UIInterfaceOrientation.landscapeLeft.rawValue
              UIDevice.current.setValue(value, forKey: "orientation")
          }
        
          if call.method == "setPortrait" {
              let value = UIInterfaceOrientation.portrait.rawValue
              UIDevice.current.setValue(value, forKey: "orientation")
          }
        
      })

      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
 
}
