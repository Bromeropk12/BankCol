enum TransactionType { deposit, withdrawal, transfer }

class TransactionModel {
  final String id;
  final String senderId;
  final String? receiverId;
  final double amount;
  final TransactionType type;
  final DateTime timestamp;
  final String description;

  TransactionModel({
    required this.id,
    required this.senderId,
    this.receiverId,
    required this.amount,
    required this.type,
    required this.timestamp,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'amount': amount,
      'type': type.toString(),
      'timestamp': timestamp.toIso8601String(),
      'description': description,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      amount: map['amount']?.toDouble() ?? 0.0,
      type: TransactionType.values.firstWhere(
        (e) => e.toString() == map['type'],
      ),
      timestamp: DateTime.parse(map['timestamp']),
      description: map['description'],
    );
  }
}