package com.example.flutter_android_log_printer;

import android.util.Log;

public class LogUtil {

    /**
     * 将日志分段打印
     *
     * @param tag        日志标签
     * @param msg        日志内容
     * @param level      日志等级，如Log.DEBUG、Log.INFO等
     * @param maxLogSize 最大长度，单位为字符
     */
    public static void printLog(String tag, String msg, int level, int maxLogSize) {
        if (msg.length() > maxLogSize) {
            for (int i = 0; i <= msg.length() / maxLogSize; i++) {
                int start = i * maxLogSize;
                int end = (i + 1) * maxLogSize;
                end = end > msg.length() ? msg.length() : end;
                switch (level) {
                    case Log.DEBUG:
                        Log.d(tag, msg.substring(start, end));
                        break;
                    case Log.INFO:
                        Log.i(tag, msg.substring(start, end));
                        break;
                    case Log.WARN:
                        Log.w(tag, msg.substring(start, end));
                        break;
                    case Log.ERROR:
                        Log.e(tag, msg.substring(start, end));
                        break;
                    default:
                        Log.v(tag, msg.substring(start, end));
                        break;
                }
            }
        } else {
            switch (level) {
                case Log.DEBUG:
                    Log.d(tag, msg);
                    break;
                case Log.INFO:
                    Log.i(tag, msg);
                    break;
                case Log.WARN:
                    Log.w(tag, msg);
                    break;
                case Log.ERROR:
                    Log.e(tag, msg);
                    break;
                default:
                    Log.v(tag, msg);
                    break;
            }
        }
    }
}
