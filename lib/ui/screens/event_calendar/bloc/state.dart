import '../../../../models/bet_model.dart';
import '../../../../models/calendar_model.dart';

abstract class ECState {}

class ECSuccess extends ECState {
  final SportBetType type;
  final bool loading;
  final List<EventCalendarModel>? models;

  ECSuccess copyWith({bool? loading, List<EventCalendarModel>? models}) {
    return ECSuccess(
      type: type,
      loading: loading ?? this.loading,
      models: models ?? this.models
    );
  }

  ECSuccess({required this.type, this.loading = true, this.models});
}

class ECInitState extends ECState {}
