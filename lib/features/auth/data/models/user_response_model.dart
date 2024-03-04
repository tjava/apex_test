import 'package:apex_test/features/auth/data/models/user_data_model.dart';
import 'package:apex_test/features/auth/domain/entities/user_response_entity.dart';

class UserResponseModel extends UserResponseEntity {
  const UserResponseModel({
    required super.status,
    required super.message,
    required super.userDataEntity,
    required super.meta,
    required super.pagination,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
        status: json["status"],
        message: json["message"],
        userDataEntity: UserDataModel.fromJson(json["data"]),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        pagination: List<dynamic>.from(json["pagination"].map((x) => x)),
      );
}
