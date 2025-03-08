import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../services/notification_service.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthService(), permanent: true);
    Get.put(DatabaseService(), permanent: true);
    Get.put(NotificationService(), permanent: true);
  }
}