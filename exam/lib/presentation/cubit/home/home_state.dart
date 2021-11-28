import 'package:equatable/equatable.dart';
import 'package:exam/data/model/profile/profile.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final DataProfile? profile;
  final String error;

  const HomeState({this.isLoading = false, this.profile, this.error = ''});

  HomeState copyWith({isLoading, profile, error}) {
    return HomeState(
        isLoading: isLoading ?? false,
        profile: profile ?? this.profile,
        error: error ?? '');
  }

  @override
  List<Object?> get props => [isLoading, profile, error];
}

class DataProfile extends Equatable {
  final String id;
  final Profile profile;

  const DataProfile(this.id, this.profile);

  @override
  List<Object?> get props => [id, profile];
}