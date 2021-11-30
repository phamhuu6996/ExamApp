import 'dart:async';
import 'package:exam/domain/repositories/exam/work_exam_repo.dart';
import 'package:exam/presentation/cubit/result_exam/result_exam_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultExamCubit extends Cubit<ResultExamState> {
  final WorkExamRepo examRepo;

  ResultExamCubit(this.examRepo) : super(const ResultExamState());

  Future<void> getExams(String key,String value) async {
    try {
      emit(state.copyWith(isLoading: true));
      var exams = await examRepo.getWorkExams(key, value);
      emit(state.copyWith(dataExam: exams));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
