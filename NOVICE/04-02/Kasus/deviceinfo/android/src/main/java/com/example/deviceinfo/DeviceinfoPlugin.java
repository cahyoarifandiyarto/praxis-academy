package com.example.deviceinfo;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** DeviceinfoPlugin */
public class DeviceinfoPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "deviceinfo");
    channel.setMethodCallHandler(new DeviceinfoPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      String s="Debug-info:";
      s += "\n Running On: " + android.os.Build.VERSION.RELEASE;
      s += "\n OS Version: " + System.getProperty("os.version") + "(" + android.os.Build.VERSION.INCREMENTAL + ")";
      s += "\n OS API Level: " + android.os.Build.VERSION.SDK_INT;
      s += "\n Device: " + android.os.Build.DEVICE;
      s += "\n Model (and Product): " + android.os.Build.MODEL + " ("+ android.os.Build.PRODUCT + ")";
      s += "\n Manufacturer: " + android.os.Build.MANUFACTURER;
      s += "\n Other TAGS: " + android.os.Build.TAGS;
      s += "\n SD Card state: " + Environment.getExternalStorageState();
      result.success(s);
    } else {
      result.notImplemented();
    }
  }
}
