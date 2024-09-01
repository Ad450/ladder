import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'expenses.g.dart';

@HiveType(typeId: 2)
class ExpenseModel extends Equatable {
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
  final String category;

  @override
  List<Object> get props => [id];

  const ExpenseModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
  });

  factory ExpenseModel.build({
    required String uid,
    required String name,
    required String amount,
    required String category,
  }) {
    return ExpenseModel(
      id: const Uuid().v4(),
      uid: uid,
      name: name,
      category: category,
      date: DateTime.now(),
      amount: amount,
    );
  }

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        amount: json["amount"],
        date: json["date"],
        category: json["category"],
      );
}
