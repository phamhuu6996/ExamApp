import 'package:exam/core/remote/base_remote.dart';

abstract class ExamRemote<P,R> extends BaseRemote{

  Future<bool> add(P data);

  Future<bool> delete(String query);

  Future<Stream<List<R>>> get(String query);

  Future<bool> update(String key, Map<String,dynamic> value);
}