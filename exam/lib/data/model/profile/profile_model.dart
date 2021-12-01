import 'package:exam/domain/entities/profile/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({required name, required role}) : super(name: name, role: role);

  ProfileModel.fromJson(Map<String, Object?> json)
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
}
