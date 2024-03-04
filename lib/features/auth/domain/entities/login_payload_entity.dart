import 'package:equatable/equatable.dart';

class LoginPayloadEntity extends Equatable {
  final String email;
  final String password;
  final String deviceName;

  const LoginPayloadEntity({
    required this.email,
    required this.password,
    required this.deviceName,
  });

  @override
  List<Object> get props {
    return [
      email,
      password,
      deviceName,
    ];
  }
}
