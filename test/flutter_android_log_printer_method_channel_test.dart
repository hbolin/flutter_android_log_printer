import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_android_log_printer/flutter_android_log_printer_method_channel.dart';

void main() {
  MethodChannelFlutterAndroidLogPrinter platform = MethodChannelFlutterAndroidLogPrinter();
  const MethodChannel channel = MethodChannel('flutter_android_log_printer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
