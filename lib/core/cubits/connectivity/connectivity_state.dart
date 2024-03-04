part of 'connectivity_cubit.dart';

sealed class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object> get props => [];
}

final class ConnectivityInitial extends ConnectivityState {}

class Connected extends ConnectivityState {
  const Connected();
}

class Disconnected extends ConnectivityState {
  const Disconnected();
}
