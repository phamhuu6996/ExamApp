import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String role;

  const Profile({required this.name, required this.role});

  Profile.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          role: json['role']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'role': role,
    };
  }

  @override
  List<Object?> get props => [name, role];
}
