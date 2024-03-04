import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/core/usecase/usecase.dart';
import 'package:apex_test/features/on_boarding/domain/repositories/on_boarding_repository.dart';

@LazySingleton()
class CacheFirstTimerUsecase extends UsecaseWithoutParams<void> {
  final OnBoardingRepository onBoardingRepository;
  CacheFirstTimerUsecase({
    required this.onBoardingRepository,
  });

  @override
  Future<Either<Failure, void>> call() {
    return onBoardingRepository.cacheFirstTimer();
  }
}
