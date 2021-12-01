import 'package:exam/data/datasource/exam/remote/exam_remote.dart';
import 'package:exam/domain/entities/exam/data_exam.dart';
import 'package:exam/domain/repositories/exam/exam_repo.dart';

class ExamRepoImpl implements ExamRepo{

  final ExamRemote examRemote;

  ExamRepoImpl(this.examRemote);

  @override
  Future<Stream<List<DataExam>>> getExams(data) {
    return examRemote.get(data);
  }

  @override
  Future<bool> publishExam(var key, var value) {
    return examRemote.update(key, value);
  }
}