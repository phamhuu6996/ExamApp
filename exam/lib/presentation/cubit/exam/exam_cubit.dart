import 'dart:async';
import 'package:exam/domain/repositories/exam/exam_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  final ExamRepo examRepo;
  StreamSubscription? streamSubscription;

  ExamCubit(this.examRepo) : super(const ExamState());

  Future<void> getExam(var data) async {
    try {
      emit(state.copyWith(isLoading: true));
      var examStream = await examRepo.getExams(data);
        streamSubscription = examStream.listen((event) {
          emit(state.copyWith(dataExam: event));
        }, onError: (e) {
          emit(state.copyWith(error: e.toString()));
        });
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

 Future<void> publishExam(String key, Map<String,dynamic> value)async {
    try{
      emit(state.copyWith(isLoading: true));
      await examRepo.publishExam(key, value);
      emit(state.copyWith(isPublish: true));
    }
    catch(e){
      emit(state.copyWith(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    if(streamSubscription != null) {
      streamSubscription!.cancel();
    }
    return super.close();
  }

}
