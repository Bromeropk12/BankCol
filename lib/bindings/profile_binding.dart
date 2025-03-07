import 'package:get/get.dart';
import '../services/auth_service.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
  }
} 