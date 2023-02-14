import 'package:flutter_test/flutter_test.dart';
import 'package:screen_adapter/screen_adapter.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:screen_adapter/src/screen_adapter_method_channel.dart';
import 'package:screen_adapter/src/screen_adapter_platform_interface.dart';
import 'package:screen_adapter/src/screen_info.dart';

class MockScreenAdapterPlatform
    with MockPlatformInterfaceMixin
    implements ScreenAdapterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<double?> getDevicePxRatio() {
    // TODO: implement getDevicePxRatio
    throw UnimplementedError();
  }

  @override
  Future<double?> getPhysicalHeight() {
    // TODO: implement getPhysicalHeight
    throw UnimplementedError();
  }

  @override
  Future<double?> getPhysicalWidth() {
    // TODO: implement getPhysicalWidth
    throw UnimplementedError();
  }

  @override
  Future<ScreenInfo?> getScreenInfo() {
    // TODO: implement getScreenInfo
    throw UnimplementedError();
  }
}

void main() {
  final ScreenAdapterPlatform initialPlatform = ScreenAdapterPlatform.instance;

  test('$MethodChannelScreenAdapter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenAdapter>());
  });

  test('getPlatformVersion', () async {
    MockScreenAdapterPlatform fakePlatform = MockScreenAdapterPlatform();
    ScreenAdapterPlatform.instance = fakePlatform;

    expect((await ScreenAdapter.getPlatformVersion())??"", '42');
  });
}
