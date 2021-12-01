import 'package:exam/domain/entities/exam/exam.dart';

class ExamModel extends Exam {
  ExamModel({
    required title,
    required content,
    required pushed,
    required questions,
  }) : super(title: title, content: content, pushed: pushed, questions: questions);

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
        title: json['title'],
        content: json['content'],
        pushed: json['pushed'],
        questions: List.from(json['questions']).map((e) => QuestionsModel.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['content'] = content;
    _data['pushed'] = pushed;
    _data['questions'] = questions.map((e) => (e as QuestionsModel).toJson()).toList();
    return _data;
  }
}

class QuestionsModel extends Questions {
  QuestionsModel({
    required id,
    required question,
    required answers,
    required correctAnswerId,
  }) : super(id: id, question: question, answers: answers, correctAnswerId: correctAnswerId);

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
        id: json['id'],
        question: json['question'],
        answers: List.from(json['answers']).map((e) => AnswersModel.fromJson(e)).toList(),
        correctAnswerId: List<String>.from(json['correct_answer_id']));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['question'] = question;
    _data['correct_answer_id'] = correctAnswerId;
    _data['answers'] = answers.map((e) => (e as AnswersModel).toJson()).toList();
    return _data;
  }
}

class AnswersModel extends Answers {
  AnswersModel({
    required id,
    required value,
  }) : super(id: id, value: value);

  factory AnswersModel.fromJson(Map<String, dynamic> json) {
    return AnswersModel(id: json['id'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['value'] = value;
    return _data;
  }
}
