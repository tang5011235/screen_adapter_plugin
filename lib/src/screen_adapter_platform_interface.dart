import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:screen_adapter/src/screen_info.dart';

import 'screen_adapter_method_channel.dart';

abstract class ScreenAdapterPlatform extends PlatformInterface {
  /// Constructs a ScreenAdapterPlatform.
  ScreenAdapterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenAdapterPlatform _instance = MethodChannelScreenAdapter();

  /// The default instance of [ScreenAdapterPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenAdapter].
  static ScreenAdapterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenAdapterPlatform] when
  /// they register themselves.
  static set instance(ScreenAdapterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<double?> getDevicePxRatio() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<double?> getPhysicalHeight() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<double?> getPhysicalWidth() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<ScreenInfo?> getScreenInfo() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
