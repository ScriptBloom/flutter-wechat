package top.dzou.flutter_wechat;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;

import java.util.Map;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class WcQrScanPlatFactory extends PlatformViewFactory {

    private static final String VIEW_TYPE_ID = "top.dzou.wechat_qrscan";
    private final BinaryMessenger messenger;

    public WcQrScanPlatFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        Map<String, Object> params = (Map<String, Object>) o;
        return new WcQrScanPlatView(context, messenger, i, params);
    }

    public static void registerWith(FlutterEngine flutterEngine) {
        ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
        final String key = "wxQrscan";
        PluginRegistry.Registrar registrar = shimPluginRegistry.registrarFor(key);
        registrar.platformViewRegistry().registerViewFactory(VIEW_TYPE_ID, new WcQrScanPlatFactory(registrar.messenger()));
    }
}