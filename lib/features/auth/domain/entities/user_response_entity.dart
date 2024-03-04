import 'package:apex_test/features/auth/domain/entities/user_data_entity.dart';
import 'package:equatable/equatable.dart';

class UserResponseEntity extends Equatable {
  final bool status;
  final String message;
  final UserDataEntity userDataEntity;
  final List<dynamic> meta;
  final List<dynamic> pagination;

  const UserResponseEntity({
    required this.status,
    required this.message,
    required this.userDataEntity,
    required this.meta,
    required this.pagination,
  });

  @override
  List<Object> get props {
    return [
      status,
      message,
      userDataEntity,
      meta,
      pagination,
    ];
  }
}
