#import "ScreenAdapterPlugin.h"

@implementation ScreenAdapterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"screen_adapter"
            binaryMessenger:[registrar messenger]];
  ScreenAdapterPlugin* instance = [[ScreenAdapterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if([@"getDevicePxRadio" isEqualToString:call.method]){
   result(UIScreen.mainScreen.scale);
  }else if([@"getPhysicalHeight" isEqualToString:call.method]){
   result(UIScreen.mainScreen.bounds.size.width);
  }else if([@"getPhysicalWidth" isEqualToString:call.method]){
   result(UIScreen.mainScreen.bounds.size.height);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
