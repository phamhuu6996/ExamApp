class Exam {
  Exam({
    required this.title,
    required this.content,
    required this.pushed,
    required this.questions,
  });
  late final String title;
  late final String content;
  late final bool pushed;
  late final List<Questions> questions;
}

class Questions {
  Questions({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswerId
  });
  late final String id;
  late final String question;
  late final List<String> correctAnswerId;
  late final List<Answers> answers;
}

class Answers {
  Answers({
    required this.id,
    required this.value,
  });
  late final String id;
  late final String value;
}