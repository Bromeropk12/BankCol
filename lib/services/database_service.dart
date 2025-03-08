import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../models/transaction_model.dart';

class DatabaseService extends GetxService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<UserModel?> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return null;
    }
  }

  Future<bool> createUser(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).set(user.toMap());
      return true;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return false;
    }
  }

  Future<List<TransactionModel>> getUserTransactions(String uid) async {
    try {
      QuerySnapshot query = await _db
          .collection('transactions')
          .where('senderId', isEqualTo: uid)
          .orderBy('timestamp', descending: true)
          .get();

      return query.docs
          .map((doc) => TransactionModel.fromMap(
              doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return [];
    }
  }

  Future<bool> createTransaction(TransactionModel transaction) async {
    try {
      await _db
          .collection('transactions')
          .doc(transaction.id)
          .set(transaction.toMap());
      return true;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return false;
    }
  }
}