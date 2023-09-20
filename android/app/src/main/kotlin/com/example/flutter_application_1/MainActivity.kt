package com.example.flutter_application_1
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.flutter_application_1"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
                if (call.method == "getDeviceModel") {
                    val deviceModel = isVM()
                    result.success(deviceModel)
                } else {
                    // if called undefined method
                    result.notImplemented()
                }
            }
    }
    fun isVM(): Boolean {
        val radioVersion = android.os.Build.getRadioVersion()
        return radioVersion == null || radioVersion.isEmpty() || radioVersion == "1.0.0.0"
        }

        
}
