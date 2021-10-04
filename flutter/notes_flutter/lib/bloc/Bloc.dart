import 'dart:async';

abstract class Event {}

abstract class CustomState {}

abstract class Bloc<E extends Event, T extends CustomState> {
  StreamController<E> _eventController = StreamController<E>();
  late final StreamSink<E> _eventSink;
  late final Stream<E> _eventStream;

  StreamController<T> _stateController = StreamController<T>.broadcast();
  late final StreamSink<T> _stateSink;
  late final Stream<T> _stateStream;

  Stream<T> get stateStream => _stateStream;

  // StreamSink<T> get stateSink => _stateSink;
  StreamSink<E> get eventSink => _eventSink;

  T? _currentState;

  T? get currentState => _currentState;

  Bloc() {
    _eventSink = _eventController.sink;
    _eventStream = _eventController.stream;

    _eventStream.listen((event) {
      mapEventToState(event);
    });

    _stateSink = _stateController.sink;
    _stateStream = _stateController.stream;
  }

  // Bloc.withInitialState(T initialState) : super() {
  //   _currentState = initialState;
  //   emitState(initialState);
  // }

  void mapEventToState(Event event);

  void emitState(T state) {
    print("emitting $state");
    _currentState = state;
    _stateSink.add(state);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();

    _eventSink.close();
    _stateSink.close();
  }
}
