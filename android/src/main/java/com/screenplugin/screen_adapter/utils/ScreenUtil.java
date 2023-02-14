package com.screenplugin.screen_adapter.utils;

import android.content.Context;
import android.graphics.Point;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.WindowManager;

import androidx.annotation.RequiresApi;

public class ScreenUtil {


    /**
     * 获取屏幕像像素密度   对应到flutter 的 devicePxRadio
     *
     * @param context 上下文
     * @return 像素密度
     */
    public static double getDensity(Context context) {
        WindowManager windowManager = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        DisplayMetrics dm = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(dm);
        return dm.density;
    }


    /**
     * 获取手机的高像素
     *
     * @return item1 宽 item2 高
     */
    @SuppressWarnings("SuspiciousNameCombination")
    public static double getPhysicalHeight(Context context) {
        WindowManager windowManager = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            Point point = new Point();
            windowManager.getDefaultDisplay().getRealSize(point);
            return point.y;
        } else {
            DisplayMetrics metrics = new DisplayMetrics();
            //屏幕实际宽度（像素个数）
            return metrics.widthPixels;
        }
        //屏幕实际高度（像素个数）
    }

    /**
     * 获取手机的宽像素
     *
     * @return item1 宽 item2 高
     */
    public static double getPhysicalWidth(Context context) {
        WindowManager windowManager = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            Point point = new Point();
            windowManager.getDefaultDisplay().getRealSize(point);
            return point.x;
        } else {
            DisplayMetrics metrics = new DisplayMetrics();
            //屏幕实际高度度（像素个数）
            //noinspection SuspiciousNameCombination
            return metrics.heightPixels;
        }
    }

}
