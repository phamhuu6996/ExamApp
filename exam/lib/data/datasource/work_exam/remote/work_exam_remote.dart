import 'package:exam/core/remote/base_remote.dart';
import 'package:exam/data/model/exam/detail_exam_model.dart';
import 'package:exam/domain/entities/exam/data_detail_exam.dart';

abstract class WorkExamRemote extends BaseRemote{

  Future<String> add(DetailExamModel data);

  Future<void> delete(var query);

  Future<List<DataDetailExam>> get(key, value);
}