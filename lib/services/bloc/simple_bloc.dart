import 'dart:async';

abstract class DSimpleBloc<DState, DEvent> {
  final _inputController = StreamController<DEvent>.broadcast();
  final _outputController = StreamController<DState>.broadcast();

  Stream<DState> get stream => _outputController.stream;

  Sink<DEvent> get sink => _inputController.sink;

  DState? _screenState;

  DState? get screenState => _screenState;

  set setScreenState(DState state) => _screenState = state;

  DSimpleBloc() {
    _inputController.stream.listen((event) => mapEventToState(event));
  }

  void mapEventToState(DEvent event);

  void newState(screenState) {
    if (!_outputController.isClosed) {
      _screenState = screenState;
      _outputController.add(screenState);
    }
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
