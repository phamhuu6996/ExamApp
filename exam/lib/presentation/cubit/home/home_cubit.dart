import 'package:exam/data/model/profile/data_profile.dart';
import 'package:exam/domain/repositories/profile/profile_repo.dart';
import 'package:exam/presentation/cubit/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProfileRepo profileRepo;

  HomeCubit(this.profileRepo) : super(const HomeState());

  Future<void> getProfile(String data) async {
    try {
      emit(state.copyWith(isLoading: true));
      var profile = await profileRepo.getProfile(data);
      if (profile == null) {
        emit(state.copyWith(isCreateInfo: false));
      } else {
        emit(state.copyWith(profile: DataProfile(key: profile.key, profile: profile.profile)));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> addProfile(DataProfile dataProfile) async {
    try {
      emit(state.copyWith(isLoading: true));
      var profile = await profileRepo.addProfile(dataProfile);
      if (profile == null) {
        emit(state.copyWith(error: "No find usr profile"));
      } else
        emit(state.copyWith(profile: DataProfile(key: profile.key, profile: profile.profile), isCreateInfo: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
