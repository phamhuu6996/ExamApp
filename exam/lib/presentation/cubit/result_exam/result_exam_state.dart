import 'package:equatable/equatable.dart';
import 'package:exam/data/model/exam/data_push_exam.dart';

class ResultExamState extends Equatable {
  final bool isLoading;
  final List<DataPushExam> dataExam;
  final String error;

  const ResultExamState(
      {this.isLoading = false, this.dataExam = const <DataPushExam>[], this.error = ''});

  ResultExamState copyWith({isLoading, dataExam, error, isPublish}) {
    return ResultExamState(
        isLoading: isLoading ?? false,
        dataExam: dataExam ?? this.dataExam,
        error: error ?? '');
  }

  @override
  List<Object?> get props => [isLoading, dataExam, error];
}
