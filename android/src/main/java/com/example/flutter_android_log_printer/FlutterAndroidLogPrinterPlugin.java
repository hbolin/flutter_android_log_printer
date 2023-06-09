package com.example.flutter_android_log_printer;

import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterAndroidLogPrinterPlugin */
public class FlutterAndroidLogPrinterPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_android_log_printer");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("logD")) {
      String tag = (String) call.argument("tag");
      int maxLogSize = (int) call.argument("maxLogSize");
      String info = (String) call.argument("info");
      assert info != null;
      LogUtil.printLog(tag, info, Log.DEBUG, maxLogSize);
    } else if (call.method.equals("logE")) {
      String tag = (String) call.argument("tag");
      Integer maxLogSize = (Integer) call.argument("maxLogSize");
      String info = (String) call.argument("info");
      assert info != null;
      LogUtil.printLog(tag, info, Log.ERROR, maxLogSize);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
