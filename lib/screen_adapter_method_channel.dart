import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screen_adapter_platform_interface.dart';

/// An implementation of [ScreenAdapterPlatform] that uses method channels.
class MethodChannelScreenAdapter extends ScreenAdapterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screen_adapter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }


  @override
  Future<double?> getDevicePxRatio() async {
    final version = await methodChannel.invokeMethod<double>('getDevicePxRatio');
    return version;
  }

  @override
  Future<double?> getPhysicalHeight() async {
    final version = await methodChannel.invokeMethod<double>('getPhysicalHeight');
    return version;
  }

  @override
  Future<double?> getPhysicalWidth() async {
    final version = await methodChannel.invokeMethod<double>('getPhysicalWidth');
    return version;
  }
}
