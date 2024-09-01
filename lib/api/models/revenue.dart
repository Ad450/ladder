import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'revenue.g.dart';

@HiveType(typeId: 1)
class RevenueModel extends Equatable {
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

  @override
  List<Object> get props => [id];

  const RevenueModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.amount,
    required this.date,
  });

  factory RevenueModel.build({
    required String uid,
    required String name,
    required String amount,
  }) =>
      RevenueModel(
        id: const Uuid().v4(),
        uid: uid,
        name: name,
        amount: amount,
        date: DateTime.now(),
      );

  factory RevenueModel.fromJson(Map<String, dynamic> json) => RevenueModel(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        amount: json["amount"],
        date: json["date"],
      );
}
