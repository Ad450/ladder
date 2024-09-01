// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RevenueModelAdapter extends TypeAdapter<RevenueModel> {
  @override
  final int typeId = 1;

  @override
  RevenueModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RevenueModel(
      id: fields[0] as String,
      uid: fields[1] as String,
      name: fields[2] as String,
      amount: fields[3] as String,
      date: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RevenueModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uid)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RevenueModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
