import 'package:apex_test/core/domain/entities/user_info_entity.dart';

class UserInfoModel extends UserInfoEntity {
  const UserInfoModel({
    required super.id,
    required super.username,
    required super.email,
    required super.fullname,
    required super.firstName,
    required super.lastName,
    required super.referrer,
    required super.totalReferrals,
    required super.createdAt,
    required super.updatedAt,
    required super.emailVerified,
    required super.isActive,
    required super.isBlocked,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        fullname: json["fullname"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        referrer: json["referrer"],
        totalReferrals: json["totalReferrals"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        emailVerified: json["emailVerified"],
        isActive: json["isActive"],
        isBlocked: json["isBlocked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "fullname": fullname,
        "first_name": firstName,
        "last_name": lastName,
        "referrer": referrer,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "emailVerified": emailVerified,
        "isActive": isActive,
        "isBlocked": isBlocked,
      };
}
