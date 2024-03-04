import 'package:apex_test/features/home/domain/entities/secret_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/features/home/data/datasources/home_remote_datasource.dart';
import 'package:apex_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  const HomeRepositoryImpl(this.homeRemoteDatasource);

  @override
  Future<Either<Failure, SecretEntity>> getSecret() async {
    try {
      final SecretEntity secretEntity = await homeRemoteDatasource.getSecret();

      return Right<Failure, SecretEntity>(secretEntity);
    } on DioException catch (error) {
      if (error.response!.statusCode! >= 500) {
        return Left<Failure, SecretEntity>(
          ServerFailure(
            message: error.message,
            statusCode: error.response!.statusCode,
          ),
        );
      }

      return Left<Failure, SecretEntity>(GenericFailure(message: error.response?.data['message']));
    }
  }
}
