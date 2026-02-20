import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceidService {
  Future<String?> getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo
            .id; // Android ID - unique to each combination of app-signing key, user, and device
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo
            .identifierForVendor; // UUID that identifies the device to the app's vendor
      }
    } catch (e) {
      log('Failed to get device ID: $e');
    }

    return null;
  }
}
