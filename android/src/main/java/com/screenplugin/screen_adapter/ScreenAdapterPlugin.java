package com.screenplugin.screen_adapter;

import android.content.Context;

import androidx.annotation.NonNull;

import com.screenplugin.screen_adapter.utils.ScreenUtil;

import java.lang.ref.WeakReference;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * ScreenAdapterPlugin
 */
public class ScreenAdapterPlugin implements FlutterPlugin, MethodCallHandler {
    private WeakReference<Context> mContext;

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;


    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        mContext = new WeakReference<>(flutterPluginBinding.getApplicationContext());
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "screen_adapter");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

        switch (call.method) {
            case "getPlatformVersion":
                result.success("Android " + android.os.Build.VERSION.RELEASE);
                break;
            case "getDevicePxRatio":
                result.success(ScreenUtil.getDensity(mContext.get()));
                break;
            case "getPhysicalHeight":
                result.success(ScreenUtil.getPhysicalHeight(mContext.get()));
                break;
            case "getPhysicalWidth":
                result.success(ScreenUtil.getPhysicalWidth(mContext.get()));
                break;
            case "getScreenInfo":
                double density = ScreenUtil.getDensity(mContext.get());
                double physicalHeight = ScreenUtil.getPhysicalHeight(mContext.get());
                double physicalWidth = ScreenUtil.getPhysicalWidth(mContext.get());
                result.success(String.format("%f,%f,%f",density,physicalWidth,physicalHeight));
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        mContext.clear();
    }
}
