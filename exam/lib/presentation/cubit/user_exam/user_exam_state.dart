import 'package:equatable/equatable.dart';
import 'package:exam/domain/entities/data_exam.dart';

class UserExamState extends Equatable {
  final bool isLoading;
  final List<DataExam> dataExam;
  final String error;

  const UserExamState(
      {this.isLoading = false, this.dataExam = const <DataExam>[], this.error = ''});

  UserExamState copyWith({isLoading, dataExam, error, isPublish}) {
    return UserExamState(
        isLoading: isLoading ?? false,
        dataExam: dataExam ?? this.dataExam,
        error: error ?? '');
  }

  @override
  List<Object?> get props => [isLoading, dataExam, error];
}
