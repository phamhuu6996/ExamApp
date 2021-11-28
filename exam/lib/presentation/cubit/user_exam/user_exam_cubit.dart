import 'dart:async';
import 'package:exam/domain/repositories/exam/exam_repo.dart';
import 'package:exam/presentation/cubit/user_exam/user_exam_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserExamCubit extends Cubit<UserExamState> {
  final ExamRepo examRepo;
  StreamSubscription? examSubscription;

  UserExamCubit(this.examRepo) : super(const UserExamState());

  Future<void> getExam(String data) async {
    try {
      emit(state.copyWith(isLoading: true));
      var examStream = await examRepo.getExams(data);
      examSubscription = examStream.listen((event) {
        emit(state.copyWith(dataExam: event));
      }, onError: (e) {
        emit(state.copyWith(error: e.toString()));
      });
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    if (examSubscription != null) {
      examSubscription!.cancel();
    }
    return super.close();
  }
}
