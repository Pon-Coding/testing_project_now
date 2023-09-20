import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let deviceChannel = FlutterMethodChannel(name: "com.example.flutter_application_1",
                                                 binaryMessenger: controller.binaryMessenger)
        prepareMethodHandler(deviceChannel: deviceChannel)
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func prepareMethodHandler(deviceChannel: FlutterMethodChannel) {
                deviceChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                        if call.method == "getDeviceModel" {
                
                self.receiveDeviceModel(result: result)
            }
            else {
                result(FlutterMethodNotImplemented)
                return
            }
            
        })
    }
    func isRunningOnSimulator() -> Bool {
        if ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] != nil {
            return true
        } else {
            return false
        }
    }
    
    func isVM() -> Bool {
        
            let radioVersion = ProcessInfo.processInfo.operatingSystemVersionString
            return radioVersion == nil || radioVersion.isEmpty || radioVersion == "1.0.0.0"
        }
  
    func isRadioVersion() -> String {
            let radioVersion = ProcessInfo.processInfo.operatingSystemVersionString
            return radioVersion
        }
    
    private func receiveDeviceModel(result: FlutterResult) {
        let deviceModel = isRunningOnSimulator()
        result(deviceModel)
    }
}
