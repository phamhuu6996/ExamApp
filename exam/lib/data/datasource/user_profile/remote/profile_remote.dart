import 'package:exam/core/remote/base_remote.dart';

abstract class ProfileRemote<P,R> extends BaseRemote{
 Future<R?> getProfile(P data);
}