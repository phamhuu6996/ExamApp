import 'package:equatable/equatable.dart';
import 'package:exam/data/model/profile/data_profile.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final DataProfile? profile;
  final bool isCreateInfo;
  final String error;

  const HomeState({this.isLoading = false, this.profile, this.isCreateInfo = true, this.error = ''});

  HomeState copyWith({isLoading, profile, isCreateInfo, error}) {
    return HomeState(
        isLoading: isLoading ?? false,
        isCreateInfo: isCreateInfo ?? this.isCreateInfo,
        profile: profile ?? this.profile,
        error: error ?? '');
  }

  @override
  List<Object?> get props => [isLoading, profile, isCreateInfo, error];
}
