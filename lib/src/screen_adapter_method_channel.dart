import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:screen_adapter/src/screen_info.dart';

import 'screen_adapter_platform_interface.dart';

/// An implementation of [ScreenAdapterPlatform] that uses method channels.
class MethodChannelScreenAdapter extends ScreenAdapterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screen_adapter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<double?> getDevicePxRatio() async {
    return await methodChannel.invokeMethod<double>('getDevicePxRatio');
  }

  @override
  Future<double?> getPhysicalHeight() async {
    return await methodChannel.invokeMethod<double>('getPhysicalHeight');
  }

  @override
  Future<double?> getPhysicalWidth() async {
    return await methodChannel.invokeMethod<double>('getPhysicalWidth');
  }

  @override
  Future<ScreenInfo?> getScreenInfo() async {
    var s = await methodChannel.invokeMethod<String>('getScreenInfo');
    var split = s?.split(",");
    if (split == null) {
      return ScreenInfo.create();
    } else {
      return ScreenInfo.create(
          devicePixelRatio: double.parse(split[0]),
          physicalWidth: double.parse(split[1]),
          physicalHeight: double.parse(split[2]));
    }
  }
}
