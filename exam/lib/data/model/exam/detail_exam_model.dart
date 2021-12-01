import 'package:exam/domain/entities/exam/detail_exam.dart';

class DetailExamModel extends DetailExam {
  DetailExamModel({required uid, required examId, required questions, required userName, score = 0})
      : super(uid: uid, examId: examId, questions: questions, userName: userName, score: score);

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'exam_id': examId,
      'questions': questions.map((e) => (e as DetailQuestionModel).toJson()).toList(),
      'user_name': userName,
      'score': score
    };
  }

  factory DetailExamModel.fromJson(Map<String, dynamic> json) {
    return DetailExamModel(
        uid: json['uid'],
        examId: json['exam_id'],
        questions: List.from(json['questions']).map((e) => DetailQuestionModel.fromJson(e)).toList(),
        userName: json['user_name'],
        score: json['score']);
  }
}

class DetailQuestionModel extends DetailQuestion {
  DetailQuestionModel({required questionId, required correctAnswerId, required answerId})
      : super(questionId: questionId, correctAnswerId: correctAnswerId, answerId: answerId);

  Map<String, dynamic> toJson() {
    return {'question_id': questionId, 'correct_answer_id': correctAnswerId, 'answer_id': answerId};
  }

  factory DetailQuestionModel.fromJson(Map<String, dynamic> json) {
    return DetailQuestionModel(
        questionId: json['question_id'],
        correctAnswerId: List.from(json['correct_answer_id']),
        answerId: List.from(json['answer_id']));
  }
}
