import 'package:equatable/equatable.dart';
import 'package:exam/domain/entities/profile/profile.dart';

class DataProfile extends Equatable {
  final String key;
  final Profile profile;

  const DataProfile({required this.key, required this.profile});

  @override
  List<Object?> get props => [key, profile];
}
