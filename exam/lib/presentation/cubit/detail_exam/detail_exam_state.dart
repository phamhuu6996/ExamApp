import 'package:equatable/equatable.dart';
import 'package:exam/domain/entities/exam/data_exam.dart';

class DetailExamState extends Equatable {
  final bool isLoading;
  final DataExam? dataExam;
  final String error;
  final bool isPublish;

  const DetailExamState(
      {this.isLoading = false, this.dataExam, this.error = '', this.isPublish = false});

  DetailExamState copyWith({isLoading, dataExam, error, isPublish}) {
    return DetailExamState(
        isLoading: isLoading ?? false,
        dataExam: dataExam ?? this.dataExam,
        error: error ?? '',
        isPublish: isPublish ?? this.isPublish);
  }

  @override
  List<Object?> get props => [isLoading, dataExam, error, isPublish];
}
