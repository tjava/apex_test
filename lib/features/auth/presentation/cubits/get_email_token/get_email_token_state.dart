part of 'get_email_token_cubit.dart';

sealed class GetEmailTokenState extends Equatable {
  const GetEmailTokenState();

  @override
  List<Object> get props => [];
}

final class GetEmailTokenInitial extends GetEmailTokenState {}

class Loading extends GetEmailTokenState {
  const Loading();
}

class Loaded extends GetEmailTokenState {
  final EmailTokenEntity emailTokenEntity;
  const Loaded(this.emailTokenEntity);

  @override
  List<Object> get props => [emailTokenEntity];
}

class Error extends GetEmailTokenState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
