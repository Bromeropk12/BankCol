import 'package:get/get.dart';
import '../services/transaction_service.dart';
import '../services/auth_service.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransactionService());
    Get.put(AuthService());
  }
} 