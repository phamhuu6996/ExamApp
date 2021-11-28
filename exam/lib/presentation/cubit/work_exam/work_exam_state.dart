import 'package:equatable/equatable.dart';
import 'package:exam/domain/entities/data_exam.dart';

class WorkExamState extends Equatable {
  final bool isLoading;
  final DataExam? dataExam;
  final String error;
  final bool isPublish;

  const WorkExamState(
      {this.isLoading = false, this.dataExam, this.error = '', this.isPublish = false});

  WorkExamState copyWith({isLoading, dataExam, error, isPublish}) {
    return WorkExamState(
        isLoading: isLoading ?? false,
        dataExam: dataExam ?? this.dataExam,
        error: error ?? '',
        isPublish: isPublish ?? this.isPublish);
  }

  @override
  List<Object?> get props => [isLoading, dataExam, error, isPublish];
}
