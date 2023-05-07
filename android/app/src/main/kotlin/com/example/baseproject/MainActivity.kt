package com.example.baseproject

import android.content.Context
import android.os.BatteryManager
import android.os.Handler
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"
    private val EVENT_CHANEL = "samples.flutter.dev/event_battery"
    private var attachEvent: EventSink? = null
    val TAG_NAME = "From_Native"
    private var count = 1
    private var handler: Handler? = null
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val argument1 =  call.arguments as Map<*, *>
                val argument = argument1["increment"] as String
                val batteryLevel = getBatteryLevel() + argument.toInt()
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    attachEvent = events
                    count = 1
                    handler = Handler()
                    runnable.run()
                }

                override fun onCancel(arguments: Any?) {
                    Toast.makeText(this@MainActivity, "Cancel", Toast.LENGTH_SHORT).show()
                }

            }
        )
    }

    private val runnable: Runnable = object : Runnable {
        override fun run() {
            val TOTAL_COUNT = 100
            if (count > TOTAL_COUNT) {
                attachEvent?.endOfStream()
            } else {
                val percentage = count as Double / TOTAL_COUNT
                Log.w(TAG_NAME, "\nParsing From Native:  $percentage")
                attachEvent?.success(percentage)
            }
            count++
            handler?.postDelayed(this, 200)
        }
    }
    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)

        return batteryLevel
    }
}
