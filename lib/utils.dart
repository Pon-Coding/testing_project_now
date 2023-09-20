import 'package:flutter/services.dart';

class DeviceModel {
  static const platform =
      MethodChannel('com.example.flutter_application_1');
  static Future<bool> getDeviceModel() async {
    try {
      final result = await platform.invokeMethod('getDeviceModel');
      return result;
    } catch (e) {
      return false;
    }
  }
}
