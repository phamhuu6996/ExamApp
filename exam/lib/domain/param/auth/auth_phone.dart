import 'package:equatable/equatable.dart';

class AuthPhoneParam extends Equatable {
  final String id;
  final String code;

  const AuthPhoneParam(this.id, this.code);

  @override
  List<Object?> get props => [id, code];
}
