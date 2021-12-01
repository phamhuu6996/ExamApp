 class DetailExam {
  late final String uid;
  late final String examId;
  late final List<DetailQuestion> questions;
  late final String userName;
  late double score;

  DetailExam({required this.uid, required this.examId, required this.questions, required this.userName, this.score = 0});
}

 class DetailQuestion {
  late final String questionId;
  late final List<String> correctAnswerId;
  late List<String> answerId;

  DetailQuestion({required this.questionId, required this.correctAnswerId, required this.answerId});
}
