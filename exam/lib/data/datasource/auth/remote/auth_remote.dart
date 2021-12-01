import 'package:exam/core/remote/base_remote.dart';
import 'package:exam/domain/param/auth/auth_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemote extends BaseRemote{
  Future<User> login(AuthPhoneParam param);

  Future<void> logout();
}
