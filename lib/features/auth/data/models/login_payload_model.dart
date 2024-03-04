import 'package:apex_test/features/auth/domain/entities/login_payload_entity.dart';

class LoginPayloadModel extends LoginPayloadEntity {
  const LoginPayloadModel({
    required super.email,
    required super.password,
    required super.deviceName,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "device_name": deviceName,
      };
}
