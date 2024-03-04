import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/core/usecase/usecase.dart';
import 'package:apex_test/features/on_boarding/domain/repositories/on_boarding_repository.dart';

@LazySingleton()
class IsUserFirstTimerUsecase extends UsecaseWithoutParams<bool> {
  final OnBoardingRepository onBoardingRepository;
  IsUserFirstTimerUsecase({
    required this.onBoardingRepository,
  });

  @override
  Future<Either<Failure, bool>> call() {
    return onBoardingRepository.isUserFirstTimer();
  }
}
