class PushExam {
  late final String uid;
  late final String examId;
  late final List<PushQuestion> questions;
  late final String userName;
  late double score;

  PushExam({required this.uid, required this.examId, required this.questions, required this.userName, this.score = 0});

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'exam_id': examId,
      'questions': questions.map((e) => e.toJson()).toList(),
      'user_name': userName,
      'score': score
    };
  }

  PushExam.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    examId = json['exam_id'];
    questions = List.from(json['questions']).map((e) => PushQuestion.fromJson(e)).toList();
    userName = json['user_name'];
    score = json['score'];
  }
}

class PushQuestion {
  late final String questionId;
  late final List<String> correctAnswerId;
  late List<String> answerId;

  PushQuestion({required this.questionId, required this.correctAnswerId, required this.answerId});

  Map<String, dynamic> toJson() {
    return {'question_id': questionId, 'correct_answer_id': correctAnswerId, 'answer_id': answerId};
  }

  PushQuestion.fromJson(Map<String, dynamic> json) {
    answerId = List.from(json['answer_id']);
    correctAnswerId = List.from(json['correct_answer_id']);
    ;
    questionId = json['question_id'];
  }
}
