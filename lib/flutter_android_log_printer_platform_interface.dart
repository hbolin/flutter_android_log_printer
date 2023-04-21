import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_android_log_printer_method_channel.dart';

abstract class FlutterAndroidLogPrinterPlatform extends PlatformInterface {
  /// Constructs a FlutterAndroidLogPrinterPlatform.
  FlutterAndroidLogPrinterPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAndroidLogPrinterPlatform _instance = MethodChannelFlutterAndroidLogPrinter();

  /// The default instance of [FlutterAndroidLogPrinterPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAndroidLogPrinter].
  static FlutterAndroidLogPrinterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAndroidLogPrinterPlatform] when
  /// they register themselves.
  static set instance(FlutterAndroidLogPrinterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
