import 'package:equatable/equatable.dart';
import 'package:exam/domain/entities/exam/data_exam.dart';

class ExamState extends Equatable {
  final bool isLoading;
  final List<DataExam> dataExam;
  final String error;
  final bool isPublish;

  const ExamState(
      {this.isLoading = false, this.dataExam = const <DataExam>[], this.error = '', this.isPublish = false});

  ExamState copyWith({isLoading, dataExam, error, isPublish}) {
    return ExamState(
        isLoading: isLoading ?? false,
        dataExam: dataExam ?? this.dataExam,
        error: error ?? '',
        isPublish: isPublish ?? this.isPublish);
  }

  @override
  List<Object?> get props => [isLoading, dataExam, error, isPublish];
}
