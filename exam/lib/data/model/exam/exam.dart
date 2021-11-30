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

  Exam.fromJson(Map<String, dynamic> json){
    title = json['title'];
    content = json['content'];
    pushed = json['pushed'];
    questions = List.from(json['questions']).map((e)=>Questions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['content'] = content;
    _data['pushed'] = pushed;
    _data['questions'] = questions.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Questions {
  Questions({
    required this.id,
    required this.question,
    required this.answers,
  });
  late final String id;
  late final String question;
  late final List<String> correctAnswerId;
  late final List<Answers> answers;

  Questions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    question = json['question'];
    correctAnswerId = List.from(json['correct_answer_id']);
    answers = List.from(json['answers']).map((e)=>Answers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['question'] = question;
    _data['correct_answer_id'] = correctAnswerId;
    _data['answers'] = answers.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Answers {
  Answers({
    required this.id,
    required this.value,
  });
  late final String id;
  late final String value;

  Answers.fromJson(Map<String, dynamic> json){
    id = json['id'];
    value = json['value'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['value'] = value;
    return _data;
  }
}