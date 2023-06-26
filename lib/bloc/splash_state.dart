part of 'splash_bloc.dart';

enum Status {
  loading,
  done,
  error,
}

class SplashState extends Equatable {
  final Status? status;

  const SplashState({this.status});

  SplashState copyWith({Status? status}) => SplashState(
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [status];
}
