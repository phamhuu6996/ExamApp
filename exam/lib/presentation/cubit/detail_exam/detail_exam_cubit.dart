import 'dart:async';

import 'package:exam/app/static.dart';
import 'package:exam/data/model/exam/data_exam.dart';
import 'package:exam/data/model/exam/push_exam.dart';
import 'package:exam/domain/repositories/exam/work_exam_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_exam_state.dart';

class DetailExamCubit extends Cubit<DetailExamState> {
  final WorkExamRepo workExamRepo;

  DetailExamCubit(this.workExamRepo) : super(const DetailExamState());

  PushExam initPushExam(DataExam dataExam) {
    List<PushQuestion> pushQuestions = [];
    for (var question in dataExam.exam.questions) {
      pushQuestions.add(PushQuestion(questionId: question.id, answerId: [], correctAnswerId: question.correctAnswerId));
    }
    return PushExam(uid: user!.uid, examId: dataExam.id, questions: pushQuestions, userName: profile?.name??'');
  }

  double score(PushExam pushExam) {
    int correctCount = pushExam.questions.length;
    for (var question in pushExam.questions) {
      for (var answerId in question.correctAnswerId) {
        if (!question.answerId.contains(answerId)) {
          correctCount--;
          break;
        }
      }
    }
    if (correctCount > 0)
      return correctCount / pushExam.questions.length * 100;
    else
      return 0;
  }

  Future<void> push(PushExam data) async {
    if (!state.isLoading) {
      try {
        emit(state.copyWith(isLoading: true));
        data.score = score(data);
        await workExamRepo.pushWorkExam(data);
        emit(state.copyWith(isPublish: true));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
    }
  }
}
