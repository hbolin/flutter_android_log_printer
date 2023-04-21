
import 'flutter_android_log_printer_platform_interface.dart';

class FlutterAndroidLogPrinter {
  Future<String?> getPlatformVersion() {
    return FlutterAndroidLogPrinterPlatform.instance.getPlatformVersion();
  }

  Future<void> logD(String tag, String info, {int maxLogSize = 1000}) {
    return FlutterAndroidLogPrinterPlatform.instance.logD(tag, info, maxLogSize);
  }

  Future<void> logE(String tag, String info, {int maxLogSize = 1000}) {
    return FlutterAndroidLogPrinterPlatform.instance.logE(tag, info, maxLogSize);
  }
}
