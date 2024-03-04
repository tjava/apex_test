part of 'check_pin_cubit.dart';

sealed class CheckPinState extends Equatable {
  const CheckPinState();

  @override
  List<Object> get props => [];
}

final class CheckPinInitial extends CheckPinState {}

class Loading extends CheckPinState {
  const Loading();
}

class Loaded extends CheckPinState {
  const Loaded();
}

class Error extends CheckPinState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
