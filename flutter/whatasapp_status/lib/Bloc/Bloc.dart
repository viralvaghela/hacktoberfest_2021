import 'dart:async';

abstract class Event {}

abstract class CustomState {}

abstract class Bloc<E extends Event, T extends CustomState> {
  StreamController<E> _eventController = StreamController<E>();
  StreamController<T> _stateController = StreamController<T>.broadcast();

  late Stream<E> _eventStream;
  late Stream<T> _stateStream;

  late StreamSink<E> _eventSink;
  late StreamSink<T> _stateSink;

  StreamSink<E> get eventSink => _eventSink;

  Stream<T> get stateStream => _stateStream;

  Bloc([T? initialState]) {
    _eventStream = _eventController.stream;
    _stateStream = _stateController.stream;

    _eventSink = _eventController.sink;
    _stateSink = _stateController.sink;

    _eventStream.listen((event) {
      mapEventToState(event);
    });
  }

  void mapEventToState(event);

  void emit(T state) {
    _stateSink.add(state);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();

    _eventSink.close();
    _stateSink.close();
  }
}
