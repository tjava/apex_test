import 'package:apex_test/features/auth/data/models/user_model.dart';
import 'package:apex_test/features/auth/domain/entities/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  const UserDataModel({required super.userEntity, required super.token});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userEntity: UserModel.fromJson(json["user"]),
        token: json["token"],
      );
}
