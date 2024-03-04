// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:apex_test/core/domain/entities/user_info_entity.dart';
// import 'package:apex_test/core/domain/repositories/core_repository.dart';
// import 'package:apex_test/core/errors/failures.dart';
// import 'package:apex_test/core/usecase/usecase.dart';

// @LazySingleton()
// class GetUserProfileUsecase extends UsecaseWithoutParams<UserInfoEntity> {
//   final CoreRepository coreRepository;

//   GetUserProfileUsecase({
//     required this.coreRepository,
//   });

//   @override
//   Future<Either<Failure, UserInfoEntity>> call() {
//     return coreRepository.getUserProfile();
//   }
// }
