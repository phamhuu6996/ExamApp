import 'package:exam/data/datasource/auth/remote/auth_remote.dart';
import 'package:exam/domain/repositories/auth/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? user;

class AuthPhoneRepo implements AuthRepo{
  final AuthRemote authRemote;

  AuthPhoneRepo(this.authRemote);
  @override
  Future<void> login(data) async{
    user = await authRemote.login(data);
  }

  @override
  Future<void> logout() async{
    authRemote.logout();
  }
}