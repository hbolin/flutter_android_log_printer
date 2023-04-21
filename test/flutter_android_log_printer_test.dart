import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_android_log_printer/flutter_android_log_printer.dart';
import 'package:flutter_android_log_printer/flutter_android_log_printer_platform_interface.dart';
import 'package:flutter_android_log_printer/flutter_android_log_printer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAndroidLogPrinterPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAndroidLogPrinterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> logD(String tag, String info) {
    // TODO: implement logD
    throw UnimplementedError();
  }

  @override
  Future<void> logE(String tag, String info) {
    // TODO: implement logE
    throw UnimplementedError();
  }
}

void main() {
  final FlutterAndroidLogPrinterPlatform initialPlatform = FlutterAndroidLogPrinterPlatform.instance;

  test('$MethodChannelFlutterAndroidLogPrinter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAndroidLogPrinter>());
  });

  test('getPlatformVersion', () async {
    FlutterAndroidLogPrinter flutterAndroidLogPrinterPlugin = FlutterAndroidLogPrinter();
    MockFlutterAndroidLogPrinterPlatform fakePlatform = MockFlutterAndroidLogPrinterPlatform();
    FlutterAndroidLogPrinterPlatform.instance = fakePlatform;

    expect(await flutterAndroidLogPrinterPlugin.getPlatformVersion(), '42');
  });
}
