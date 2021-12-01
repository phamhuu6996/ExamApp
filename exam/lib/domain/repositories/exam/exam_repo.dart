import 'package:exam/domain/entities/exam/data_exam.dart';

abstract class ExamRepo {
  Future<Stream<List<DataExam>>> getExams(var data);

  Future<bool> publishExam(var key, var value);
}
