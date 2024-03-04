import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/data/datasources/core_local_data_source.dart';
import 'package:apex_test/core/domain/repositories/core_repository.dart';
import 'package:apex_test/core/errors/exceptions.dart';
import 'package:apex_test/core/errors/failures.dart';

@LazySingleton(as: CoreRepository)
class CoreRepositoryImpl implements CoreRepository {
  final CoreLocalDataSource coreLocalDataSource;

  CoreRepositoryImpl({
    required this.coreLocalDataSource,
  });

  @override
  Future<Either<Failure, String?>> getAccessToken() async {
    try {
      final String? token = await coreLocalDataSource.getAccessToken();
      return Right(token);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await coreLocalDataSource.logout();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
