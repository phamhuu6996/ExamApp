import 'package:equatable/equatable.dart';
import 'package:exam/data/model/exam/exam.dart';

class DataExam extends Equatable {
  final String id;
  final Exam exam;

  const DataExam(this.id, this.exam);

  @override
  List<Object?> get props => [id, exam];
}