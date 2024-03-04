import 'package:equatable/equatable.dart';

class SecretEntity extends Equatable {
  final bool status;
  final String message;
  final String secret;

  const SecretEntity({
    required this.status,
    required this.message,
    required this.secret,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        secret,
      ];
}
