part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class Loading extends LoginState {
  const Loading();
}

class Loaded extends LoginState {
  final UserResponseEntity userResponseEntity;
  const Loaded(this.userResponseEntity);

  @override
  List<Object> get props => [userResponseEntity];
}

class Error extends LoginState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}

class ShowPassword extends LoginState {
  final bool showPassword;

  const ShowPassword(
    this.showPassword,
  );

  @override
  List<Object> get props => [showPassword];
}
