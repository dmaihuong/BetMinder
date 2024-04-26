import 'package:bet_minder/models/bet_model.dart';

abstract class ECEvent {}

class ECSelectedSportType extends ECEvent {
  final SportBetType type;

  ECSelectedSportType(this.type);
}

class ECCLoseView extends ECEvent {}
