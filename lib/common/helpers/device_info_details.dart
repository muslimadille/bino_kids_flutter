import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart' as path;

class DeviceInfoDetails {
  static DeviceInfoDetails? _instance;

  DeviceInfoDetails._internal();

  factory DeviceInfoDetails() {
    return _instance ??= DeviceInfoDetails._internal();
  }

  late PackageInfo packageInfo;
  late Directory securePath;
  late Directory publicPath;
  late Directory publicPathAndroid;
  late String deviceId;
  late String deviceName;

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosInfo;


  Map<String, dynamic> deviceInfoMap = {};
  String deviceType='';

  Future<void> initPlatformState() async {
    List data = await Future.wait([
      PackageInfo.fromPlatform(),
      path.getApplicationDocumentsDirectory(),
      path.getTemporaryDirectory(),

    ]);
    packageInfo = data[0];
    securePath = data[1];
    publicPath = data[2];
    publicPathAndroid = publicPath;

    if (Platform.isAndroid) {
      deviceType="Android";
      androidInfo = await deviceInfoPlugin.androidInfo;
      deviceId = androidInfo?.id??"";
      deviceName=androidInfo?.device??'';

    } else if (Platform.isIOS) {
      deviceType="Ios";
      iosInfo = await deviceInfoPlugin.iosInfo;
      deviceId = iosInfo?.identifierForVendor??"";
      deviceName=iosInfo?.name??'';
    }
  }

  Future<void> getDeviceInfoMap() async {
    if (Platform.isAndroid) {
      deviceInfoMap = {
        "platform": "android",
        "platformVersion": androidInfo?.version.release.toString(),
        "model": "${androidInfo?.manufacturer} ${androidInfo?.brand} ${androidInfo?.model}",
        "appName": packageInfo.appName,
        "appVersion": packageInfo.version,
        "deviceId": androidInfo?.id,
      };
    } else if (Platform.isIOS) {
      deviceInfoMap = {
        "platform": "ios",
        "platformVersion": iosInfo?.systemVersion.toString(),
        "model": iosInfo?.utsname.machine,
        "appName": packageInfo.appName,
        "appVersion": packageInfo.version,
        "deviceId": iosInfo?.identifierForVendor,
      };
    }
  }
}
