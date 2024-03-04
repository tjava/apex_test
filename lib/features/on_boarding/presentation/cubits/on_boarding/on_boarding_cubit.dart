import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/failures.dart';

import 'package:apex_test/features/on_boarding/domain/usecases/cache_first_timer_usecase.dart';
import 'package:apex_test/features/on_boarding/domain/usecases/is_user_first_timer_usecase.dart';

part 'on_boarding_state.dart';

@injectable
class OnBoardingCubit extends Cubit<OnBoardingState> {
  final CacheFirstTimerUsecase cacheFirstTimerUsecase;
  final IsUserFirstTimerUsecase isUserFirstTimerUsecase;

  OnBoardingCubit({
    required this.cacheFirstTimerUsecase,
    required this.isUserFirstTimerUsecase,
  }) : super(OnBoardingInitial());

  Future<void> cacheFirstTimer() async {
    emit(const CachingFirstTimer());

    final result = await cacheFirstTimerUsecase();

    result.fold(
      (Failure failure) => emit(const OnBoardingError('Oops Something went wrong.')),
      (_) => emit(const UserCached()),
    );
  }

  Future<void> isUserFirstTimer() async {
    emit(const CheckingIsUserFirstTimer());

    final result = await isUserFirstTimerUsecase();

    result.fold(
      (Failure failure) => emit(const OnBoardingStatus(true)),
      (bool status) => emit(OnBoardingStatus(status)),
    );
  }
}
