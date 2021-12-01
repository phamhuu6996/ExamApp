import 'package:exam/app/static.dart';
import 'package:exam/data/datasource/auth/remote/auth_remote.dart';
import 'package:exam/domain/repositories/auth/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final AuthRemote authRemote;

  AuthRepoImpl(this.authRemote);
  @override
  Future<void> login(data) async{
    user = await authRemote.login(data);
  }

  @override
  Future<void> logout() async{
    authRemote.logout();
  }
}