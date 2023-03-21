package com.qualaroo.qualaroo

import android.content.Context
import android.widget.Toast
import androidx.annotation.NonNull
import com.qualaroo.Qualaroo

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** QualarooPlugin */
class QualarooPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var context: Context? = null
    private var qualarooAlise: String? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "qualaroo")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext;

    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {

            Qualaroo.initializeWith(context)
                .setApiKey("ODIzODk6Zjg5NDFkNThjNDZjYTYxMDJkMjA0ODliMmQ1NTJjZGQ0MWZiZWFkNzo3ODIwMA==")
                .setDebugMode(true)
                .init()
            print("eeiioewiwiewiowei");
            Qualaroo.getInstance().showSurvey("ranaBt3amlTest");


            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == Constants.INIT_METHOD_CALL) {
            val metaData = call.argument(Constants.SEND_USER_DATA) as HashMap<String, String>?

            qualarooAlise = call.argument(Constants.Qualaroo_alise);
            Qualaroo.initializeWith(context)
                .setApiKey(call.argument(Constants.Qualaroo_KEY))
                .setDebugMode(true)
                .init()

            metaData?.get(Constants.USER_ID)
                ?.let { Qualaroo.getInstance().setUserId(it.toString()) }
            metaData?.get(Constants.USER_AREA)
                ?.let { Qualaroo.getInstance().setUserProperty(Constants.USER_AREA, it.toString()) }
            metaData?.get(Constants.IndustryID)?.let {
                Qualaroo.getInstance().setUserProperty(Constants.IndustryID, it.toString())
            }
            metaData?.get(Constants.UserPhoneNumber)?.let {
                Qualaroo.getInstance().setUserProperty(Constants.UserPhoneNumber, it.toString())
            }



            Qualaroo.getInstance().showSurvey(qualarooAlise.toString())

            result.success("SuccessInit")


        }
        // "ODIzODk6Zjg5NDFkNThjNDZjYTYxMDJkMjA0ODliMmQ1NTJjZGQ0MWZiZWFkNzo3ODIwMA=="
        // "ranaBt3amlTest"
        else if (call.method == Constants.SEND_USER_DATA) {

            Qualaroo.getInstance().showSurvey("ranaBt3amlTest");
            qualarooAlise?.let {
                Qualaroo.getInstance().showSurvey(it);
            }
            result.success("SuccessInitShow")

        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
