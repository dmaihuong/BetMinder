import 'state.dart';

abstract class BAEvent{}

class BASelectType extends BAEvent {
  final BAType type;

  BASelectType(this.type);
}