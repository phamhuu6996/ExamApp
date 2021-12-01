import 'package:exam/core/remote/base_remote.dart';
import 'package:exam/data/model/exam/exam_model.dart';
import 'package:exam/domain/entities/exam/data_exam.dart';

abstract class ExamRemote extends BaseRemote{

  Future<bool> add(ExamModel data);

  Future<bool> delete(String query);

  Future<Stream<List<DataExam>>> get(String query);

  Future<bool> update(String key, Map<String,dynamic> value);
}