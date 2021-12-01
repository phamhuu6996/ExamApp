import 'package:equatable/equatable.dart';
import 'package:exam/domain/entities/exam/data_detail_exam.dart';

class ResultExamState extends Equatable {
  final bool isLoading;
  final List<DataDetailExam> dataExam;
  final String error;

  const ResultExamState(
      {this.isLoading = false, this.dataExam = const <DataDetailExam>[], this.error = ''});

  ResultExamState copyWith({isLoading, dataExam, error, isPublish}) {
    return ResultExamState(
        isLoading: isLoading ?? false,
        dataExam: dataExam ?? this.dataExam,
        error: error ?? '');
  }

  @override
  List<Object?> get props => [isLoading, dataExam, error];
}
