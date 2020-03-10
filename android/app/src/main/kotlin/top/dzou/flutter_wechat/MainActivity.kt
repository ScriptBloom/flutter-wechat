package top.dzou.flutter_wechat

import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine!!.dartExecutor, ScanFlutterPlugin.CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "qrscan_page") { //跳转到指定Activity
                val intent = Intent(this, ScanActivity::class.java)
                this.startActivity(intent)
                //返回给flutter的参数
                result.success("success")
            } else {
                result.notImplemented()
            }
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
                GeneratedPluginRegistrant.registerWith(flutterEngine)
        WcQrScanPlatFactory.registerWith(flutterEngine)
    }

//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        MethodChannel(flutterEngine.dartExecutor, ScanFlutterPlugin.CHANNEL).setMethodCallHandler { call, result ->
//
//            //接收来自flutter的指令oneAct
//            //通过MethodCall可以获取参数和方法名，然后再寻找对应的平台业务，本案例做了2个跳转的业务
//            //接收来自flutter的指令oneAct
//            if (call.method == "qrscan_page") { //跳转到指定Activity
//                val intent = Intent(activity, ScanActivity::class.java)
//                activity.startActivity(intent)
//                //返回给flutter的参数
//                result.success("success")
//            } else {
//                result.notImplemented()
//            }
//        }
//    }

//    private fun registerCustomPlugin(registrar: PluginRegistry) {
//        ScanFlutterPlugin.registerWith(registrar.registrarFor(ScanFlutterPlugin.CHANNEL))
//    }

//    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
//        super.onCreate(savedInstanceState, persistentState)
//        ViewRegistrant.registerWith(this,)
//    }
}
