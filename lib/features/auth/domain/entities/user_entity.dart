import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String fullName;
  final String username;
  final String email;
  final dynamic phone;
  final dynamic phoneCountry;
  final String country;
  final dynamic avatar;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
    required this.phone,
    required this.phoneCountry,
    required this.country,
    required this.avatar,
  });

  @override
  List<Object?> get props {
    return [
      id,
      fullName,
      username,
      email,
      phone,
      phoneCountry,
      country,
      avatar,
    ];
  }
}
