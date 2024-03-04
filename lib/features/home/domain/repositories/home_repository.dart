import 'package:dartz/dartz.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/features/home/domain/entities/secret_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, SecretEntity>> getSecret();
}
