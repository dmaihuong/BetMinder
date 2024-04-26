import 'package:hive/hive.dart';

part 'limit_controller.g.dart';

@HiveType(typeId: 1)
class LimitControllerModel {
  @HiveField(0)
  final int dayLimit;
  @HiveField(1)
  final int monthLimit;
  @HiveField(2)
  final int yearLimit;

  LimitControllerModel(
      {required this.dayLimit,
      required this.monthLimit,
      required this.yearLimit});
}
