part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props {
    return [];
  }
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  String loadingMessage;
  LoginLoading({required this.loadingMessage});

  @override
  List<Object> get props => [loadingMessage];
}

/// a new class should be created for a new state
///

class LoginErrorState extends LoginState {
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginState {}
