import 'package:equatable/equatable.dart';
import 'package:exam/data/model/profile/profile.dart';

class ProfileParam extends Equatable {
  final String key;
  final Profile value;

  const ProfileParam({required this.key, required this.value});

  @override
  List<Object?> get props => [key, value];
}
