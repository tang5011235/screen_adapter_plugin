
import 'screen_adapter_platform_interface.dart';

class ScreenAdapter {
  Future<String?> getPlatformVersion() {
    return ScreenAdapterPlatform.instance.getPlatformVersion();
  }

  Future<double?> getDevicePxRadio() {
    return ScreenAdapterPlatform.instance.getDevicePxRadio();
  }

  Future<double?> getPhysicalHeight() {
    return ScreenAdapterPlatform.instance.getPhysicalHeight();
  }

  Future<double?> getPhysicalWidth() {
    return ScreenAdapterPlatform.instance.getPhysicalWidth();
  }
}
