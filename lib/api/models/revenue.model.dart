import 'package:freezed_annotation/freezed_annotation.dart';

part 'revenue.model.freezed.dart';
part 'revenue.model.g.dart';

@freezed
abstract class RevenueModel with _$RevenueModel {
  factory RevenueModel({
    @JsonKey(name: 'id') String? id,
    required String nameOfRevenue,
    required int amount,
  }) = _RevenueModel;

  factory RevenueModel.fromJson(Map json) =>
      _$RevenueModelFromJson(Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}
