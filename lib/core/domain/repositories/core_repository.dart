import 'package:dartz/dartz.dart';
import 'package:apex_test/core/errors/failures.dart';

abstract class CoreRepository {
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, void>> logout();
}
