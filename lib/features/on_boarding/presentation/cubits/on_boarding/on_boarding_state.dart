part of 'on_boarding_cubit.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

final class OnBoardingInitial extends OnBoardingState {}

class CachingFirstTimer extends OnBoardingState {
  const CachingFirstTimer();
}

class CheckingIsUserFirstTimer extends OnBoardingState {
  const CheckingIsUserFirstTimer();
}

class UserCached extends OnBoardingState {
  const UserCached();
}

class OnBoardingStatus extends OnBoardingState {
  final bool isFirstTimer;
  const OnBoardingStatus(
    this.isFirstTimer,
  );

  @override
  List<bool> get props => [isFirstTimer];
}

class OnBoardingError extends OnBoardingState {
  final String messge;
  const OnBoardingError(
    this.messge,
  );

  @override
  List<String> get props => [messge];
}
