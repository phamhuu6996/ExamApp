import 'package:equatable/equatable.dart';
import 'package:exam/data/model/exam/push_exam.dart';

class DataPushExam extends Equatable{
  final String id;
  final PushExam pushExam;

  const DataPushExam({required this.id, required this.pushExam});
  @override
  List<Object?> get props => [id, pushExam];
}