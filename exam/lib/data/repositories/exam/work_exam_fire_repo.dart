import 'package:exam/data/datasource/work_exam/remote/remote.dart';
import 'package:exam/domain/repositories/repositories.dart';

class WorkExamFireRepo implements WorkExamRepo{

  final WorkExamRemote examRemote;

  WorkExamFireRepo(this.examRemote);

  @override
  Future getWorkExams(data) {
    return examRemote.get(data);
  }

  @override
  Future pushWorkExam(data) {
    return examRemote.add(data);
  }
}