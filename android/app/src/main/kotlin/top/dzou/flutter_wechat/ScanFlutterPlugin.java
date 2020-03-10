package top.dzou.flutter_wechat;

import android.app.Activity;
import android.content.Intent;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

@Deprecated
public class ScanFlutterPlugin  implements MethodChannel.MethodCallHandler {

        public static String CHANNEL = "top.dzou.flutter_wechat/qrscan";

        static MethodChannel channel;

        private Activity activity;

        private ScanFlutterPlugin(Activity activity) {
            this.activity = activity;
        }

        public static void registerWith(PluginRegistry.Registrar registrar) {
            channel = new MethodChannel(registrar.messenger(), CHANNEL);
            ScanFlutterPlugin instance = new ScanFlutterPlugin(registrar.activity());
            //setMethodCallHandler在此通道上接收方法调用的回调
            channel.setMethodCallHandler(instance);
        }

        @Override
        public void onMethodCall(MethodCall call, MethodChannel.Result result) {

            //通过MethodCall可以获取参数和方法名，然后再寻找对应的平台业务，本案例做了2个跳转的业务

            //接收来自flutter的指令oneAct
            if (call.method.equals("qrscan_page")) {
                //跳转到指定Activity
                Intent intent = new Intent(activity, ScanActivity.class);
                activity.startActivity(intent);
                //返回给flutter的参数
                result.success("success");
            }
            else {
                result.notImplemented();
            }
        }

    }