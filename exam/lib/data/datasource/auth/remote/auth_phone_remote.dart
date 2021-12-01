

import 'package:exam/core/exception/exception_app.dart';
import 'package:exam/domain/param/param.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'remote.dart';

class AuthPhoneRemote implements AuthRemote {
  final FirebaseAuth firebaseAuth;

  AuthPhoneRemote(this.firebaseAuth);

  @override
  Future<User> login(AuthPhoneParam param) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: param.id, smsCode: param.code);
    var user = (await firebaseAuth.signInWithCredential(credential)).user;
    if (user != null) {
      return user;
    } else {
      throw ExceptionApp('Error');
    }
  }

  @override
  Future<void> logout() async{
    firebaseAuth.signOut();
  }
}