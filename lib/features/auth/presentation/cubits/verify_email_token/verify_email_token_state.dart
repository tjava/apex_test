part of 'verify_email_token_cubit.dart';

sealed class VerifyEmailTokenState extends Equatable {
  const VerifyEmailTokenState();

  @override
  List<Object> get props => [];
}

final class VerifyEmailTokenInitial extends VerifyEmailTokenState {}

class Loading extends VerifyEmailTokenState {
  const Loading();
}

class Loaded extends VerifyEmailTokenState {
  final EmailTokenEntity emailTokenEntity;
  const Loaded(this.emailTokenEntity);

  @override
  List<Object> get props => [emailTokenEntity];
}

class Error extends VerifyEmailTokenState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
