part of 'setup_pin_cubit.dart';

sealed class SetupPinState extends Equatable {
  const SetupPinState();

  @override
  List<Object> get props => [];
}

final class SetupPinInitial extends SetupPinState {}

class Loading extends SetupPinState {
  const Loading();
}

class Loaded extends SetupPinState {
  const Loaded();
}

class Error extends SetupPinState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
