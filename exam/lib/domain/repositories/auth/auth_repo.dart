
abstract class AuthRepo{

  Future<void> login(var data);

  Future<void> logout();
}