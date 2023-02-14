library screen_adapter;

export 'package:screen_adapter/src/screen_info.dart';
export 'package:screen_adapter/src/screen_util.dart';
export 'package:screen_adapter/src/size_extension.dart';
export 'package:screen_adapter/src/r_padding.dart';
export 'package:screen_adapter/src/r_sizedbox.dart';

import 'package:screen_adapter/src/screen_adapter_platform_interface.dart';
import 'package:screen_adapter/src/screen_info.dart';

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
