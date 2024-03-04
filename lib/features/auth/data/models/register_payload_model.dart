import 'package:apex_test/features/auth/domain/entities/register_payload_entity.dart';

class RegisterPayloadModel extends RegisterPayloadEntity {
  const RegisterPayloadModel({
    required super.fullName,
    required super.username,
    required super.email,
    required super.country,
    required super.password,
    required super.deviceName,
  });

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "username": username,
        "email": email,
        "country": country,
        "password": password,
        "device_name": deviceName,
      };
}
