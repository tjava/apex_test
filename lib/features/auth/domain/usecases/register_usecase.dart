import 'package:apex_test/features/auth/domain/entities/register_payload_entity.dart';
import 'package:apex_test/features/auth/domain/entities/user_response_entity.dart';
import 'package:apex_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/core/usecase/usecase.dart';

@LazySingleton()
class RegisterUsecase extends UsecaseWithParams<UserResponseEntity, RegisterPayloadEntity> {
  final AuthRepository authRepository;

  RegisterUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, UserResponseEntity>> call(RegisterPayloadEntity params) {
    return authRepository.register(params);
  }
}
