import 'package:apex_test/features/auth/domain/entities/email_token_entity.dart';
import 'package:apex_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/core/usecase/usecase.dart';

@LazySingleton()
class VerifyEmailTokenUsecase extends UsecaseWithParams<EmailTokenEntity, Map<String, dynamic>> {
  final AuthRepository authRepository;

  VerifyEmailTokenUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, EmailTokenEntity>> call(Map<String, dynamic> params) {
    return authRepository.verifyEmailToken(params);
  }
}
