import 'package:equatable/equatable.dart';

class RegisterPayloadEntity extends Equatable {
  final String fullName;
  final String username;
  final String email;
  final String country;
  final String password;
  final String deviceName;

  const RegisterPayloadEntity({
    required this.fullName,
    required this.username,
    required this.email,
    required this.country,
    required this.password,
    required this.deviceName,
  });

  @override
  List<Object> get props {
    return [
      fullName,
      username,
      email,
      country,
      password,
      deviceName,
    ];
  }
}
