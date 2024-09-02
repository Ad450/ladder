// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RevenueModelImpl _$$RevenueModelImplFromJson(Map<String, dynamic> json) =>
    _$RevenueModelImpl(
      id: json['id'] as String?,
      nameOfRevenue: json['nameOfRevenue'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$$RevenueModelImplToJson(_$RevenueModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameOfRevenue': instance.nameOfRevenue,
      'amount': instance.amount,
    };
