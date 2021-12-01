import 'package:equatable/equatable.dart';
import 'package:exam/domain/entities/exam/detail_exam.dart';

class DataDetailExam extends Equatable{
  final String id;
  final DetailExam pushExam;

  const DataDetailExam({required this.id, required this.pushExam});
  @override
  List<Object?> get props => [id, pushExam];
}