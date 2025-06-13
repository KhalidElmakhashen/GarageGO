package com.example.legarage

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity()


package com.example.legarage

import android.app.*
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.util.Log
import androidx.core.app.NotificationCompat
import com.microsoft.signalr.HubConnectionBuilder
import com.microsoft.signalr.HubConnection

class SignalRService : Service() {

    private lateinit var hubConnection: HubConnection

    override fun onCreate() {
        super.onCreate()
        startForegroundService()
        startSignalR()
    }

    private fun startForegroundService() {
        val channelId = "SignalR_Channel"
        val channelName = "SignalR Background Service"

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val chan = NotificationChannel(channelId, channelName, NotificationManager.IMPORTANCE_LOW)
            val manager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            manager.createNotificationChannel(chan)
        }

        val notification = NotificationCompat.Builder(this, channelId)
            .setContentTitle("SignalR Running")
            .setContentText("Connected to SignalR in background")
            .setSmallIcon(R.mipmap.ic_launcher)
            .build()

        startForeground(1, notification)
    }

    private fun startSignalR() {
        hubConnection = HubConnectionBuilder.create("https://ispot.runasp.net/parkingHub").build()

        hubConnection.on("ReceiveSpot", { spot ->
            Log.d("SignalR", "Received spot: $spot")
            // Optionally send to Flutter via Broadcast or Local Storage
        }, String::class.java)

        hubConnection.start().doOnComplete {
            Log.d("SignalR", "Connected")
        }.doOnError {
            Log.e("SignalR", "Connection error: ${it.message}")
        }.subscribe()
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onDestroy() {
        hubConnection.stop()
        super.onDestroy()
    }
}
