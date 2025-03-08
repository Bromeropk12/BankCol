import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseConfig {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
    
    // Configurar notificaciones
    await _setupNotifications();
  }

  static Future<void> _setupNotifications() async {
    // Solicitar permisos para notificaciones
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Configurar canal de notificaciones
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'bankcol_high_importance_channel',
      'Notificaciones Importantes',
      description: 'Canal para notificaciones importantes de BankCol',
      importance: Importance.high,
    );

    // Crear el canal en el dispositivo
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
}