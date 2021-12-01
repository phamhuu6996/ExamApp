import 'package:exam/data/datasource/work_exam/remote/remote.dart';
import 'package:exam/domain/entities/exam/data_detail_exam.dart';
import 'package:exam/domain/repositories/repositories.dart';

class WorkExamRepoImpl implements WorkExamRepo{

  final WorkExamRemote examRemote;

  WorkExamRepoImpl(this.examRemote);

  @override
  Future<List<DataDetailExam>> getWorkExams(key, value) {
    return examRemote.get(key, value);
  }

  @override
  Future<String> pushWorkExam(data) {
    return examRemote.add(data);
  }
}