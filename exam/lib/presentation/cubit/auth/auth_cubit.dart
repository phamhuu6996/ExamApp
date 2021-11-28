import 'package:exam/domain/repositories/auth/auth_repo.dart';
import 'package:exam/presentation/cubit/auth/auth_state.dart';
import 'package:exam/until/until.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(const AuthState());

  Future<void> login(var data) async {
    emit(state.copyWith(isLoading: true));
    try {
      await authRepo.login(data);
      emit(state.copyWith(isLogged: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(isLoading: true));
    try {
      await authRepo.logout();
      emit(state.copyWith(isLogged: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}

class AuthFirebasePhoneCubit extends AuthCubit {
  final int timeOut = 30;

  AuthFirebasePhoneCubit(AuthRepo authRepo) : super(authRepo);

  void sendCode(String phone) {
    phone = convertPhone(phone.trim());
    if (validateMobile(phone)) {
      emit(state.copyWith(isLoading: true));
      if(state.dataSend == null) {
        FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: Duration(seconds: timeOut),
          verificationCompleted: (credential) async {},
          verificationFailed: (exception) {
            emit(state.copyWith(error: exception.message));
          },
          codeSent: (String verificationId, int? resendToken) {
            emit(state.copyWith(dataSend: DataSend(verificationId, timeOut)));
          },
          codeAutoRetrievalTimeout: (verificationId) {
            emit(state.resetCodeSent());
          });
      }else {
        emit(state.copyWith(isLoading: false));
      }
    } else {
      emit(state.copyWith(error: 'It do not phone number.'));
    }
  }
}
