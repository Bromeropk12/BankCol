import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static Future<void> init() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "tu_api_key",
        appId: "tu_app_id",
        messagingSenderId: "tu_messaging_sender_id",
        projectId: "tu_project_id",
        storageBucket: "tu_storage_bucket",
      ),
    );
  }
} 