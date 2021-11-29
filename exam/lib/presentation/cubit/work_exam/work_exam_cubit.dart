import 'dart:async';

import 'package:exam/data/model/exam/data_exam.dart';
import 'package:exam/data/model/exam/push_exam.dart';
import 'package:exam/data/repositories/auth/auth_repo.dart';
import 'package:exam/domain/repositories/exam/work_exam_repo.dart';
import 'package:exam/presentation/cubit/work_exam/work_exam_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkExamCubit extends Cubit<WorkExamState>{
  final WorkExamRepo workExamRepo;
  WorkExamCubit(this.workExamRepo) : super(const WorkExamState());

 PushExam initPushExam(DataExam dataExam){
    List<PushQuestion> pushQuestions = [];
    for(var question in dataExam.exam.questions){
      pushQuestions.add(PushQuestion(questionId: question.id, answerId: []));
    }
    return PushExam(uid: user!.uid, examId: dataExam.id, questions: pushQuestions);
  }

Future<void>  push(var data)async{
  if(!state.isLoading) {
    try {
      emit(state.copyWith(isLoading: true));
      await workExamRepo.pushWorkExam(data);
      emit(state.copyWith(isPublish: true));
    }catch(e){
      emit(state.copyWith(error: e.toString()));
    }
  }
  }
}