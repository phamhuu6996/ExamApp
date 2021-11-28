import 'package:exam/domain/repositories/profile/profile_repo.dart';
import 'package:exam/presentation/cubit/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProfileRepo profileRepo;

  HomeCubit(this.profileRepo) : super(const HomeState());

  Future<void> getProfile(var data) async {
    try {
      emit(state.copyWith(isLoading: true));
      var profile = await profileRepo.getProfile(data);
      if (profile == null) {
        emit(state.copyWith(error: "No find usr profile"));
      }
      emit(state.copyWith(profile: DataProfile(data.key, profile)));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
