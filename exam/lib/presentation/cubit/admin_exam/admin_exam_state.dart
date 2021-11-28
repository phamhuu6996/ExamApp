import 'package:equatable/equatable.dart';
import 'package:exam/domain/entities/data_exam.dart';

class AdminExamState extends Equatable {
  final bool isLoading;
  final List<DataExam> dataExam;
  final String error;
  final bool isPublish;

  const AdminExamState(
      {this.isLoading = false, this.dataExam = const <DataExam>[], this.error = '', this.isPublish = false});

  AdminExamState copyWith({isLoading, dataExam, error, isPublish}) {
    return AdminExamState(
        isLoading: isLoading ?? false,
        dataExam: dataExam ?? this.dataExam,
        error: error ?? '',
        isPublish: isPublish ?? this.isPublish);
  }

  @override
  List<Object?> get props => [isLoading, dataExam, error, isPublish];
}
