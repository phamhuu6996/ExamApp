import 'package:exam/domain/entities/exam/data_detail_exam.dart';

abstract class WorkExamRepo{
  Future<List<DataDetailExam>> getWorkExams(var key, var value);
  Future<String> pushWorkExam(var data);
}