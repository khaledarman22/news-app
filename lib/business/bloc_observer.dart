import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('onEvent Bloc: {${bloc.runtimeType}}  Event: $event');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(
          'OnTransition bloc: {${bloc.runtimeType}}  Transition: $transition');
    }
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('\x1B[33mOnCreate ✔ {${bloc.runtimeType}}');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print(
          '\x1B[32mOnChange ♻ {${bloc.runtimeType}}\n\x1B[32m${change.currentState.runtimeType}  ➡  ${change.nextState.runtimeType}');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('\x1B[31mOnError ⛔ {${bloc.runtimeType}}, $error');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print('\x1B[31mOnClose  ✖ {${bloc.runtimeType}}');
    }
  }
}
