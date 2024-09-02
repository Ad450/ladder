// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseModelImpl _$$ExpenseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseModelImpl(
      id: json['id'] as String?,
      nameOfItem: json['nameOfItem'] as String,
      category: json['category'] as String,
      estimatedAmount: (json['estimatedAmount'] as num).toInt(),
    );

Map<String, dynamic> _$$ExpenseModelImplToJson(_$ExpenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameOfItem': instance.nameOfItem,
      'category': instance.category,
      'estimatedAmount': instance.estimatedAmount,
    };
