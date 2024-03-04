import 'package:apex_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/core/usecase/usecase.dart';

@LazySingleton()
class GetPinUsecase extends UsecaseWithoutParams<String?> {
  final AuthRepository authRepository;

  GetPinUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, String?>> call() {
    return authRepository.getPin();
  }
}
