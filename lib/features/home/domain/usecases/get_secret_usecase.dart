import 'package:apex_test/features/home/domain/entities/secret_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/core/usecase/usecase.dart';
import 'package:apex_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton()
class GetSecretUsecase extends UsecaseWithoutParams<SecretEntity> {
  final HomeRepository homeRepository;

  GetSecretUsecase({
    required this.homeRepository,
  });

  @override
  Future<Either<Failure, SecretEntity>> call() {
    return homeRepository.getSecret();
  }
}
