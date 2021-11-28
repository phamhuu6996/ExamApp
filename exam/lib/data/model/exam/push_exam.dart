class PushExam {
  late final String uid;
  late final String examId;
  late final List<PushQuestion> questions;

  PushExam({required this.uid, required this.examId, required this.questions});

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'exam_id': examId, 'questions': questions.map((e) => e.toJson()).toList()};
  }

  PushExam.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    examId = json['exam_id'];
    questions = List.from(json['questions']).map((e) => PushQuestion.fromJson(e)).toList();
  }
}

class PushQuestion {
  late final String questionId;
  late List<String> answerId;

  PushQuestion({required this.questionId, required this.answerId});

  Map<String, dynamic> toJson() {
    return {'question_id': questionId, 'answer_id': answerId};
  }

  PushQuestion.fromJson(Map<String, dynamic> json) {
    answerId = List.from(json['answer_id']);
    questionId = json['question_id'];
  }
}
