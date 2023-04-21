import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_android_log_printer_platform_interface.dart';

/// An implementation of [FlutterAndroidLogPrinterPlatform] that uses method channels.
class MethodChannelFlutterAndroidLogPrinter extends FlutterAndroidLogPrinterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_android_log_printer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> logD(String tag, String info, int maxLogSize) async {
    await methodChannel.invokeMethod<String>('logD', {"tag": tag, "maxLogSize": maxLogSize, "info": info});
  }

  @override
  Future<void> logE(String tag, String info, int maxLogSize) async {
    await methodChannel.invokeMethod<String>('logE', {"tag": tag, "maxLogSize": maxLogSize, "info": info});
  }
}
