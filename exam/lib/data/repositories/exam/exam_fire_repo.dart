import 'package:exam/data/datasource/exam/remote/exam_remote.dart';
import 'package:exam/domain/repositories/exam/exam_repo.dart';

class ExamFireRepo implements ExamRepo{

  final ExamRemote examRemote;

  ExamFireRepo(this.examRemote);

  @override
  Future getExams(data) {
    return examRemote.get(data);
  }

  @override
  Future publishExam(var key, var value) {
    return examRemote.update(key, value);
  }
}