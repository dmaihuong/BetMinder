// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limit_controller.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LimitControllerModelAdapter extends TypeAdapter<LimitControllerModel> {
  @override
  final int typeId = 1;

  @override
  LimitControllerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LimitControllerModel(
      dayLimit: fields[0] as int,
      monthLimit: fields[1] as int,
      yearLimit: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LimitControllerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dayLimit)
      ..writeByte(1)
      ..write(obj.monthLimit)
      ..writeByte(2)
      ..write(obj.yearLimit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LimitControllerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
