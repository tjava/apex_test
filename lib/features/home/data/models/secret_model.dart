import 'package:apex_test/features/home/domain/entities/secret_entity.dart';

class SecretModel extends SecretEntity {
  const SecretModel({
    required super.status,
    required super.message,
    required super.secret,
  });

  factory SecretModel.fromJson(Map<String, dynamic> json) => SecretModel(
        status: json["status"],
        message: json["message"],
        secret: json["data"]["secret"],
      );
}
