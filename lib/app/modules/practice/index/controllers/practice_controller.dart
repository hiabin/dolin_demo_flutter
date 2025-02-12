import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_plugin_practice/flutter_plugin_practice.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PracticeController extends GetxController {
  bool b = false;

  RxString deviceData = ''.obs;
  RxString pacakgeData = ''.obs;

  RxString scanCode = ''.obs;

  RxString invokeChannelResult = ''.obs;

  void getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    if (deviceInfo is IosDeviceInfo) {
      deviceData.value = '''name:   ${deviceInfo.name ?? ''}
systemName:   ${deviceInfo.systemName ?? ''}
systemVersion:    ${deviceInfo.systemVersion ?? ''}
model:    ${deviceInfo.model ?? ''}
localizedModel:   ${deviceInfo.localizedModel ?? ''}
identifierForVendor:    ${deviceInfo.identifierForVendor ?? ''}
isPhysicalDevice:   ${deviceInfo.isPhysicalDevice}
utsname-sysname:    ${deviceInfo.utsname.sysname ?? ''}
utsname-nodename:    ${deviceInfo.utsname.nodename ?? ''}
utsname-release:    ${deviceInfo.utsname.release ?? ''}
utsname-version:    ${deviceInfo.utsname.version ?? ''}
utsname-machine:    ${deviceInfo.utsname.machine ?? ''}''';
    }
  }

  void getPackageInflo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    pacakgeData.value = '''appName:$appName
packageName:$packageName
version:$version
buildNumber:$buildNumber    
''';
  }

  void getInvokeChannelInfo() async {
    FlutterPluginPractice flutterPluginPractice = FlutterPluginPractice();

    final int? getBatteryLevel = await flutterPluginPractice.getBatteryLevel();
    final String? getPlatformVersion =
        await flutterPluginPractice.getPlatformVersion();

    invokeChannelResult.value =
        '电量：${(getBatteryLevel ?? 0).toString()}\n版本：${getPlatformVersion ?? ''}';
  }
}
