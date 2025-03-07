import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/transaction_model.dart';

class TransactionService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<TransactionModel> _transactions = [];
  bool _isLoading = false;

  List<TransactionModel> get transactions => _transactions;
  bool get isLoading => _isLoading;

  Future<void> createTransaction({
    required String senderId,
    required String receiverId,
    required double amount,
    required String description,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      final transaction = TransactionModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: senderId,
        receiverId: receiverId,
        amount: amount,
        description: description,
        timestamp: DateTime.now(),
        status: 'pending',
      );

      await _firestore.collection('transactions').doc(transaction.id).set(transaction.toJson());
      
      // Actualizar balances
      await _updateBalances(senderId, receiverId, amount);
      
      _transactions.add(transaction);
      notifyListeners();
    } catch (e) {
      print('Error en createTransaction: $e');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _updateBalances(String senderId, String receiverId, double amount) async {
    final batch = _firestore.batch();
    
    // Actualizar balance del remitente
    final senderRef = _firestore.collection('users').doc(senderId);
    batch.update(senderRef, {'balance': FieldValue.increment(-amount)});
    
    // Actualizar balance del destinatario
    final receiverRef = _firestore.collection('users').doc(receiverId);
    batch.update(receiverRef, {'balance': FieldValue.increment(amount)});
    
    await batch.commit();
  }

  Future<void> loadTransactions(String userId) async {
    try {
      _isLoading = true;
      notifyListeners();

      final QuerySnapshot snapshot = await _firestore
          .collection('transactions')
          .where('senderId', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .get();

      _transactions = snapshot.docs
          .map((doc) => TransactionModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      
      notifyListeners();
    } catch (e) {
      print('Error en loadTransactions: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
} 