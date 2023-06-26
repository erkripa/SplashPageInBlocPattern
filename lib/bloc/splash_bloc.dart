import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/main.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashInitialEvent>(_splashInitialEventHandler);
    on<SplashCompletedEvent>(_splashCompletedEventHandler);
    _onCreate();
    log("Bloc created");
  }

  void _splashInitialEventHandler(
      SplashInitialEvent event, Emitter<SplashState> emit) {
    log("Called ${event.runtimeType}");
    return emit(state.copyWith(status: Status.loading));
  }

  void _splashCompletedEventHandler(
      SplashCompletedEvent event, Emitter<SplashState> emit) {
    log("Called  ${event.runtimeType}");

    return emit(state.copyWith(status: Status.done));
  }

  bool isDone = false;

  @override
  void onChange(Change<SplashState> change) {
    log("current=> ${change.currentState.status}");
    log("next => ${change.nextState.status}");

    super.onChange(change);
  }

  void _onCreate() {
    add(SplashInitialEvent());
    Future.delayed(const Duration(seconds: 3))
        .then((value) => add(SplashCompletedEvent()));
  }
}
