import 'package:get/get.dart';
import '../services/transaction_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransactionService());
  }
} 