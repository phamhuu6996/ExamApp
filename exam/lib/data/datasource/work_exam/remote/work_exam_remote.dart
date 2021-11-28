import 'package:exam/core/remote/base_remote.dart';

abstract class WorkExamRemote<P,R> extends BaseRemote{

  Future<String> add(P data);

  Future<void> delete(var query);

  Future<List<R>> get(var query);
}