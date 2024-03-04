import 'package:equatable/equatable.dart';

class EmailTokenEntity extends Equatable {
  final bool status;
  final String message;
  final String? email;
  final String? token;

  const EmailTokenEntity({
    required this.status,
    required this.message,
    this.email,
    this.token,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        email,
        token,
      ];
}
