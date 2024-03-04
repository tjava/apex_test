import 'package:apex_test/features/auth/domain/entities/email_token_entity.dart';

class EmailTokenModel extends EmailTokenEntity {
  const EmailTokenModel({
    required super.status,
    required super.message,
    super.email,
    super.token,
  });

  factory EmailTokenModel.fromJson(Map<String, dynamic> json) => EmailTokenModel(
        status: json["status"],
        message: json["message"],
        email: json["data"]["email"],
        token: json["data"]["token"],
      );
}
