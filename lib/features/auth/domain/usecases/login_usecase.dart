import 'package:apex_test/features/auth/domain/entities/login_payload_entity.dart';
import 'package:apex_test/features/auth/domain/entities/user_response_entity.dart';
import 'package:apex_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/core/usecase/usecase.dart';

@LazySingleton()
class LoginUsecase extends UsecaseWithParams<UserResponseEntity, LoginPayloadEntity> {
  final AuthRepository authRepository;

  LoginUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, UserResponseEntity>> call(LoginPayloadEntity params) {
    return authRepository.login(params);
  }
}
