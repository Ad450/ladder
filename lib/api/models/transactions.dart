import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'transactions.g.dart';

@HiveType(typeId: 3)
class TransactionModel extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String uid;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String amount;

  @HiveField(4)
  final DateTime date;

  @HiveField(5)
  final String? category;

  @override
  List<Object> get props => [id];

  const TransactionModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.amount,
    required this.date,
    this.category,
  });

  factory TransactionModel.build({
    required String uid,
    required String name,
    required String amount,
    String? category,
  }) {
    return TransactionModel(
      id: const Uuid().v4(),
      uid: uid,
      name: name,
      category: category,
      date: DateTime.now(),
      amount: amount,
    );
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        amount: json["amount"],
        date: json["date"],
        category: json["category"],
      );
}
