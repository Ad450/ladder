import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.model.freezed.dart';
part 'expense.model.g.dart';

@freezed
abstract class ExpenseModel with _$ExpenseModel {
  factory ExpenseModel({
    @JsonKey(name: 'id') String? id,
    required String nameOfItem,
    required String category,
    required int estimatedAmount,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map json) =>
      _$ExpenseModelFromJson(Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}
