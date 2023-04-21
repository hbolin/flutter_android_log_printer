
import 'flutter_android_log_printer_platform_interface.dart';

class FlutterAndroidLogPrinter {
  Future<String?> getPlatformVersion() {
    return FlutterAndroidLogPrinterPlatform.instance.getPlatformVersion();
  }
}
