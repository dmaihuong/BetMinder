import 'package:hive/hive.dart';

part 'bet_model.g.dart';

@HiveType(typeId: 2)
class BetModel {
  @HiveField(0)
  final int amount;
  @HiveField(1)
  final double bettingOdds;
  @HiveField(2)
  final SportBetType typeOfSport;
  @HiveField(3)
  final bool isWin;
  @HiveField(4)
  final DateTime dateTime;

  BetModel(
      {required this.amount,
      required this.bettingOdds,
      required this.typeOfSport,
      required this.isWin,
      required this.dateTime});
}

@HiveType(typeId: 3)
enum SportBetType {
  @HiveField(0)
  baseball,
  @HiveField(1)
  football,
  @HiveField(2)
  basketball,
  @HiveField(3)
  hockey,
  @HiveField(4)
  fighting,
  @HiveField(5)
  volleyball,
  @HiveField(6)
  rugby,
  @HiveField(7)
  handball,
}

extension GetNameBySport on SportBetType {
  String get nameString => [
        'Baseball',
        'Football',
        'Basketball',
        'Hockey',
        'Fighting',
        'Volleyball',
        'Rugby',
        'Handball',
      ][index];

  String get nameResponse => [
        'American-Football',
        'Soccer',
        'Basketball',
        'Ice-Hockey',
        'Fighting',
        'Volleyball',
        'Rugby',
        'Handball',
      ][index];



  String get imageSrc => 'assets/images/events/${index + 1}.png';
}
