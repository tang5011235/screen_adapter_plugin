library screen_adapter;
import 'screen_adapter_method_channel.dart';
import 'screen_adapter_platform_interface.dart';

class ScreenAdapter {
  static Future<String?> getPlatformVersion() {
    return ScreenAdapterPlatform.instance.getPlatformVersion();
  }

  static Future<double?> getDevicePxRatio() {
    return ScreenAdapterPlatform.instance.getDevicePxRatio();
  }

  static Future<double?> getPhysicalHeight() {
    return ScreenAdapterPlatform.instance.getPhysicalHeight();
  }

  static Future<double?> getPhysicalWidth() {
    return ScreenAdapterPlatform.instance.getPhysicalWidth();
  }

  static Future<ScreenInfo?> getScreenInfo() {
   return ScreenAdapterPlatform.instance.getScreenInfo();
  }
}

