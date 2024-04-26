import 'package:bet_minder/services/bloc/simple_bloc.dart';
import 'package:bet_minder/ui/screens/best_analyst/bloc/event.dart';
import 'package:bet_minder/ui/screens/best_analyst/bloc/state.dart';

class BABloc extends DSimpleBloc<BAState, BAEvent> {
  BABloc() {
    setScreenState = BAState(type: BAType.sportType);
  }

  @override
  void mapEventToState(BAEvent event) {
    if (event is BASelectType) {
      newState(screenState!.copyWith(type: event.type));
    }
  }
}
