import 'package:apex_test/features/auth/domain/entities/email_token_entity.dart';
import 'package:apex_test/features/auth/domain/entities/login_payload_entity.dart';
import 'package:apex_test/features/auth/domain/entities/register_payload_entity.dart';
import 'package:apex_test/features/auth/domain/entities/user_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:apex_test/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserResponseEntity>> login(LoginPayloadEntity loginPayloadEntity);
  Future<Either<Failure, UserResponseEntity>> register(RegisterPayloadEntity registerPayloadEntity);
  Future<Either<Failure, EmailTokenEntity>> getEmailToken(Map<String, dynamic> params);
  Future<Either<Failure, EmailTokenEntity>> verifyEmailToken(Map<String, dynamic> params);
  Future<Either<Failure, bool?>> cachePin(String params);
  Future<Either<Failure, String?>> getPin();
}
