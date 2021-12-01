import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String role;

  const Profile({required this.name, required this.role});

  @override
  List<Object?> get props => [name, role];
}
