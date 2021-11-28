//P : param
//R : Response
import 'package:exam/core/remote/base_remote.dart';

abstract class AuthRemote<P,R> extends BaseRemote{
  Future<R> login(P param);

  Future<void> logout();
}
