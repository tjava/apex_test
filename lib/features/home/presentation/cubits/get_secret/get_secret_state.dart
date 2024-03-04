part of 'get_secret_cubit.dart';

sealed class GetSecretState extends Equatable {
  const GetSecretState();

  @override
  List<Object> get props => [];
}

final class GetSecretInitial extends GetSecretState {}

class Loading extends GetSecretState {
  const Loading();
}

class Loaded extends GetSecretState {
  final SecretEntity secretEntity;
  const Loaded(this.secretEntity);

  @override
  List<Object> get props => [secretEntity];
}

class Error extends GetSecretState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
