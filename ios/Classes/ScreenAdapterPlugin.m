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
  }else if([@"getDevicePxRatio" isEqualToString:call.method]){
   result([NSNumber numberWithFloat:UIScreen.mainScreen.scale]);
  }else if([@"getPhysicalWidth" isEqualToString:call.method]){
   result([NSNumber numberWithFloat:UIScreen.mainScreen.bounds.size.width * UIScreen.mainScreen.scale]);
  }else if([@"getPhysicalHeight" isEqualToString:call.method]){
   result([NSNumber numberWithFloat:UIScreen.mainScreen.bounds.size.height * UIScreen.mainScreen.scale]);
  }else if([@"getScreenInfo" isEqualToString:call.method]){
  float width = UIScreen.mainScreen.bounds.size.width * UIScreen.mainScreen.scale;
  float height = UIScreen.mainScreen.bounds.size.height * UIScreen.mainScreen.scale;
  float devicePixelRatio = UIScreen.mainScreen.bounds.size.height * UIScreen.mainScreen.scale;
  //"1,2,3"
  NSString * string =  [NSString  stringWithFormat: @"%f,%f,%f",devicePixelRatio,width,height];
   result(string);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
