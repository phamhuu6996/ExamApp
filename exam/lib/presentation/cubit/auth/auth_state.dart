import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final DataSend? dataSend;
  final bool isLogged;
  final String error;

  const AuthState({this.isLoading = false, this.dataSend, this.isLogged = false, this.error = ''});

  AuthState copyWith({isLoading, dataSend, isLogged, error}) {
    return AuthState(
        isLoading: isLoading ?? false,
        dataSend: dataSend ?? this.dataSend,
        isLogged: isLogged ?? this.isLogged,
        error: error ?? '');
  }

  AuthState resetCodeSent({isLoading, isLogged, error}) {
    return AuthState(
        isLoading: isLoading ?? false, dataSend: null, isLogged: isLogged ?? this.isLogged, error: error ?? '');
  }

  @override
  List<Object?> get props => [isLoading, dataSend, isLogged, error];
}

class DataSend extends Equatable {
  final String id;
  final int timeOut;

  const DataSend(this.id, this.timeOut);

  @override
  List<Object?> get props => [id, timeOut];
}
