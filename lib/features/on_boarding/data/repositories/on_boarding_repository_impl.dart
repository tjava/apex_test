import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/exceptions.dart';

import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/features/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:apex_test/features/on_boarding/domain/repositories/on_boarding_repository.dart';

@LazySingleton(as: OnBoardingRepository)
class OnBoardingRepositoryImpl implements OnBoardingRepository {
  final OnBoardingLocalDatasource onBoardingLocalDatasource;
  OnBoardingRepositoryImpl(
    this.onBoardingLocalDatasource,
  );

  @override
  Future<Either<Failure, void>> cacheFirstTimer() async {
    try {
      await onBoardingLocalDatasource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isUserFirstTimer() async {
    try {
      final result = await onBoardingLocalDatasource.isUserFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
