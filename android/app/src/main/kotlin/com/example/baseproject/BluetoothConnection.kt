package com.example.baseproject

import android.Manifest
import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothSocket
import android.content.Context
import android.content.pm.PackageManager
import androidx.core.app.ActivityCompat
import java.util.*

@SuppressLint("MissingPermission")
class ConnectThread(private val address: String, private val  context:Context) : Thread() {

    private val bluetoothDevice : BluetoothDevice = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(address)

    private val mmSocket: BluetoothSocket? by lazy(LazyThreadSafetyMode.NONE) {
        bluetoothDevice.createRfcommSocketToServiceRecord(UUID.fromString("00001101-0000-1000-8000-00805F9B34FB"))
    }

    override fun run() {
        BluetoothAdapter.getDefaultAdapter().cancelDiscovery()
        mmSocket?.use { socket ->
            socket.connect()
            val inputStream = socket.inputStream
            val outputStream = socket.outputStream
            val buffer = ByteArray(1024)
            var bytes: Int
            while (true) {
                bytes = inputStream.read(buffer)
                // Xử lý dữ liệu đọc được ob    tại đây
            }
        }
    }

    fun cancel() {
        mmSocket?.close()
    }
}
