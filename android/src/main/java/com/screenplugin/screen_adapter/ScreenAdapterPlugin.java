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
public class ScreenAdapterPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    private WeakReference<Context> mContext;

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;


    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
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
            default:
                result.notImplemented();
                break;
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);

    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        mContext = new WeakReference<>(binding.getActivity());
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {
        mContext.clear();
    }
}
