import 'package:apex_test/core/errors/exceptions.dart';
import 'package:apex_test/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:apex_test/features/auth/data/models/login_payload_model.dart';
import 'package:apex_test/features/auth/data/models/register_payload_model.dart';
import 'package:apex_test/features/auth/domain/entities/email_token_entity.dart';
import 'package:apex_test/features/auth/domain/entities/login_payload_entity.dart';
import 'package:apex_test/features/auth/domain/entities/register_payload_entity.dart';
import 'package:apex_test/features/auth/domain/entities/user_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:apex_test/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDatasource authLocalDataSource;
  const AuthRepositoryImpl({
    required this.authRemoteDatasource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, EmailTokenEntity>> getEmailToken(Map<String, dynamic> params) async {
    try {
      final EmailTokenEntity emailTokenEntity = await authRemoteDatasource.getEmailToken(params);

      return Right<Failure, EmailTokenEntity>(emailTokenEntity);
    } on DioException catch (error) {
      if (error.response!.statusCode! >= 500) {
        return Left<Failure, EmailTokenEntity>(
          ServerFailure(
            message: error.message,
            statusCode: error.response!.statusCode,
          ),
        );
      }

      return Left<Failure, EmailTokenEntity>(
          GenericFailure(message: error.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, UserResponseEntity>> login(LoginPayloadEntity loginPayloadEntity) async {
    try {
      final LoginPayloadModel loginPayloadModel = LoginPayloadModel(
        email: loginPayloadEntity.email,
        password: loginPayloadEntity.password,
        deviceName: loginPayloadEntity.deviceName,
      );

      final UserResponseEntity userResponseEntity =
          await authRemoteDatasource.login(loginPayloadModel);

      authLocalDataSource.cacheAccessToken(userResponseEntity.userDataEntity.token);

      return Right<Failure, UserResponseEntity>(userResponseEntity);
    } on DioException catch (error) {
      if (error.response!.statusCode! >= 500) {
        return Left<Failure, UserResponseEntity>(
          ServerFailure(
            message: error.message,
            statusCode: error.response!.statusCode,
          ),
        );
      }

      return Left<Failure, UserResponseEntity>(
          GenericFailure(message: error.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, UserResponseEntity>> register(
      RegisterPayloadEntity registerPayloadEntity) async {
    try {
      final RegisterPayloadModel registerPayloadModel = RegisterPayloadModel(
        fullName: registerPayloadEntity.fullName,
        username: registerPayloadEntity.username,
        email: registerPayloadEntity.email,
        country: registerPayloadEntity.country,
        password: registerPayloadEntity.password,
        deviceName: registerPayloadEntity.deviceName,
      );

      final UserResponseEntity userResponseEntity =
          await authRemoteDatasource.register(registerPayloadModel);

      authLocalDataSource.cacheAccessToken(userResponseEntity.userDataEntity.token);

      return Right<Failure, UserResponseEntity>(userResponseEntity);
    } on DioException catch (error) {
      if (error.response!.statusCode! >= 500) {
        return Left<Failure, UserResponseEntity>(
          ServerFailure(
            message: error.message,
            statusCode: error.response!.statusCode,
          ),
        );
      }

      return Left<Failure, UserResponseEntity>(
          GenericFailure(message: error.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, EmailTokenEntity>> verifyEmailToken(Map<String, dynamic> params) async {
    try {
      final EmailTokenEntity emailTokenEntity = await authRemoteDatasource.verifyEmailToken(params);

      return Right<Failure, EmailTokenEntity>(emailTokenEntity);
    } on DioException catch (error) {
      if (error.response!.statusCode! >= 500) {
        return Left<Failure, EmailTokenEntity>(
          ServerFailure(
            message: error.message,
            statusCode: error.response!.statusCode,
          ),
        );
      }

      return Left<Failure, EmailTokenEntity>(
          GenericFailure(message: error.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, bool?>> cachePin(String params) async {
    try {
      final bool? pin = await authLocalDataSource.cachePin(params);
      return Right(pin);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String?>> getPin() async {
    try {
      final String? pin = await authLocalDataSource.getPin();
      return Right(pin);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
