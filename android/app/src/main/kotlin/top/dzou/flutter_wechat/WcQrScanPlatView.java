package top.dzou.flutter_wechat;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Vibrator;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;

import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.bingoogolapple.qrcode.core.QRCodeView;
import cn.bingoogolapple.qrcode.zbar.ZBarView;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;
import pub.devrel.easypermissions.AfterPermissionGranted;
import pub.devrel.easypermissions.EasyPermissions;

import static android.content.Context.VIBRATOR_SERVICE;

public class WcQrScanPlatView implements PlatformView, MethodChannel.MethodCallHandler, QRCodeView.Delegate {

    private static final String TAG = "wcQrScanPlatView";
    private static final int REQUEST_CODE_QRCODE_PERMISSIONS = 3131;
    private static final String CHANNEL_NAME = "top.dzou.qrscan.double_direction";
    private BinaryMessenger messenger;
//    private LinearLayout mLinearLayout;
    private ZBarView mZBarView;
    private View view;
    private Context mContext;
    private MethodChannel methodChannel;

    WcQrScanPlatView(Context context, BinaryMessenger messenger, int id, Map<String, Object> params) {
        this.messenger = messenger;
        this.mContext = context;
//        LinearLayout mLinearLayout = new LinearLayout(context);
        this.view = LayoutInflater.from(context).inflate(R.layout.activity_test_scan,null,false);
        mZBarView = view.findViewById(R.id.zbarview);
        methodChannel = new MethodChannel(messenger, CHANNEL_NAME);
//        methodChannel.
        methodChannel.setMethodCallHandler(this);
        mZBarView.setDelegate(this);
//        mLinearLayout.addView(view);
//        mLinearLayout.setBackgroundColor(Color.rgb(100, 200, 100));
//        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(900, 900);
//        mLinearLayout.setLayoutParams(lp);
    }

    private void vibrate() {
        Vibrator vibrator = (Vibrator) mContext.getSystemService(VIBRATOR_SERVICE);
        vibrator.vibrate(200);
    }
    @Override
    public View getView() { return view; }

    @Override
    public void dispose() {}

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        switch (call.method){
            case "openFlash":
                mZBarView.openFlashlight();break;
            case "stopQrScan":
                mZBarView.stopCamera();mZBarView.stopSpot();mZBarView.onDestroy();break;
            case "startQrScan":
                mZBarView.startCamera();mZBarView.startSpotAndShowRect();break;
        }
    }

    @Override
    public void onScanQRCodeSuccess(String result) {
        Log.i(TAG, "result:" + result);
        vibrate();
        mZBarView.startSpot(); // 开始识别
    }

    @Override
    public void onCameraAmbientBrightnessChanged(boolean isDark) {
        // 这里是通过修改提示文案来展示环境是否过暗的状态，接入方也可以根据 isDark 的值来实现其他交互效果
        String tipText = mZBarView.getScanBoxView().getTipText();
        String ambientBrightnessTip = "\n环境过暗，请打开闪光灯";
        if (isDark) {
            if (!tipText.contains(ambientBrightnessTip)) {
                mZBarView.getScanBoxView().setTipText(tipText + ambientBrightnessTip);
            }
        } else {
            if (tipText.contains(ambientBrightnessTip)) {
                tipText = tipText.substring(0, tipText.indexOf(ambientBrightnessTip));
                mZBarView.getScanBoxView().setTipText(tipText);
            }
        }
    }

    @Override
    public void onScanQRCodeOpenCameraError() {
        Log.e(TAG, "打开相机出错");
    }
}
