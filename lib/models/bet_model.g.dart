// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BetModelAdapter extends TypeAdapter<BetModel> {
  @override
  final int typeId = 2;

  @override
  BetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BetModel(
      amount: fields[0] as int,
      bettingOdds: fields[1] as double,
      typeOfSport: fields[2] as SportBetType,
      isWin: fields[3] as bool,
      dateTime: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BetModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.bettingOdds)
      ..writeByte(2)
      ..write(obj.typeOfSport)
      ..writeByte(3)
      ..write(obj.isWin)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SportBetTypeAdapter extends TypeAdapter<SportBetType> {
  @override
  final int typeId = 3;

  @override
  SportBetType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SportBetType.baseball;
      case 1:
        return SportBetType.football;
      case 2:
        return SportBetType.basketball;
      case 3:
        return SportBetType.hockey;
      case 4:
        return SportBetType.fighting;
      case 5:
        return SportBetType.volleyball;
      case 6:
        return SportBetType.rugby;
      case 7:
        return SportBetType.handball;
      default:
        return SportBetType.baseball;
    }
  }

  @override
  void write(BinaryWriter writer, SportBetType obj) {
    switch (obj) {
      case SportBetType.baseball:
        writer.writeByte(0);
        break;
      case SportBetType.football:
        writer.writeByte(1);
        break;
      case SportBetType.basketball:
        writer.writeByte(2);
        break;
      case SportBetType.hockey:
        writer.writeByte(3);
        break;
      case SportBetType.fighting:
        writer.writeByte(4);
        break;
      case SportBetType.volleyball:
        writer.writeByte(5);
        break;
      case SportBetType.rugby:
        writer.writeByte(6);
        break;
      case SportBetType.handball:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SportBetTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
