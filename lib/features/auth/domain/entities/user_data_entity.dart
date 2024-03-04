import 'package:equatable/equatable.dart';

import 'package:apex_test/features/auth/domain/entities/user_entity.dart';

class UserDataEntity extends Equatable {
  final UserEntity userEntity;
  final String token;

  const UserDataEntity({
    required this.userEntity,
    required this.token,
  });

  @override
  List<Object> get props => [userEntity, token];
}
