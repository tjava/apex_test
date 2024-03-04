import 'package:dartz/dartz.dart';
import 'package:apex_test/core/errors/failures.dart';

abstract class OnBoardingRepository {
  Future<Either<Failure, void>> cacheFirstTimer();
  Future<Either<Failure, bool>> isUserFirstTimer();
}
