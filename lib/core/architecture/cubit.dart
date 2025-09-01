import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///CubitEventListener is a widget that listens to a [CubitWithEvent] and calls a listener
///whenever a new event is emitted.
///This is useful for listening to events that are single events and are not meant to be
///stored in the state of the [CubitWithEvent].
class CubitEventListener<C extends CubitWithEvent<S, E>, S, E>
    extends StatefulWidget {
  const CubitEventListener(
      {super.key, required this.child, required this.listener, this.cubit});

  final Widget child;
  final C? cubit;
  final BlocWidgetListener<E> listener;

  @override
  State<CubitEventListener<C, S, E>> createState() =>
      _CubitEventListenerState<C, S, E>();
}

class _CubitEventListenerState<C extends CubitWithEvent<S, E>, S, E>
    extends State<CubitEventListener<C, S, E>> {
  late final cubit = widget.cubit ?? context.read<C>();

  StreamSubscription<E>? _subscription;

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _subscribe();
  }

  void _subscribe() {
    _subscription = cubit.eventStream.listen((state) {
      widget.listener(context, state);
    });
  }

  void _unsubscribe() {
    _subscription?.cancel();
    _subscription = null;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);
}

/// CubitWithEvent is a [Cubit] that has an [eventStream] that can be listened to
/// and [emitEvent] that can be used to emit events to the [eventStream].
/// event terminology is used instead of state to avoid confusion with the
/// [state] property of [Cubit]. events are fire and forget
class CubitWithEvent<S, E> extends BaseCubit<S> {
  CubitWithEvent(
    super.initialState,
  );

  E? lastEvent;

  final _eventStream = StreamController<E>.broadcast();

  @override
  Future<void> close() {
    _eventStream.close();
    return super.close();
  }

  Stream<E> get eventStream => _eventStream.stream;

  emitEvent(E event) {
    lastEvent = event;

    if (_eventStream.isClosed || _eventStream.isPaused) return;
    _eventStream.add(event);
  }
}
