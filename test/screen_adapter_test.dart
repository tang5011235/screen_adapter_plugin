import 'package:flutter_test/flutter_test.dart';
import 'package:screen_adapter/screen_adapter.dart';
import 'package:screen_adapter/screen_adapter_platform_interface.dart';
import 'package:screen_adapter/screen_adapter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenAdapterPlatform
    with MockPlatformInterfaceMixin
    implements ScreenAdapterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ScreenAdapterPlatform initialPlatform = ScreenAdapterPlatform.instance;

  test('$MethodChannelScreenAdapter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenAdapter>());
  });

  test('getPlatformVersion', () async {
    ScreenAdapter screenAdapterPlugin = ScreenAdapter();
    MockScreenAdapterPlatform fakePlatform = MockScreenAdapterPlatform();
    ScreenAdapterPlatform.instance = fakePlatform;

    expect(await screenAdapterPlugin.getPlatformVersion(), '42');
  });
}
