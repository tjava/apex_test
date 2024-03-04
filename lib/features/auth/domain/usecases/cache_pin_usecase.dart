import 'package:apex_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/core/usecase/usecase.dart';

@LazySingleton()
class CachePinUsecase extends UsecaseWithParams<bool?, String> {
  final AuthRepository authRepository;

  CachePinUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, bool?>> call(String params) {
    return authRepository.cachePin(params);
  }
}
