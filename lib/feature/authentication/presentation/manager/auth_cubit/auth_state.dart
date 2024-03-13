part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessfulState extends AuthState {
  final dynamic uId;

  RegisterSuccessfulState(this.uId);
}

class RegisterErrorState extends AuthState {
  final String errMassage;

  RegisterErrorState(
    this.errMassage,
  );
}

class LoginLoadingState extends AuthState {}

class LoginSuccessfulState extends AuthState {
  final dynamic uId;

  LoginSuccessfulState(this.uId);
}

class LoginErrorState extends AuthState {
  final String errMassage;

  LoginErrorState(
    this.errMassage,
  );
}

class AuthShowPasswordState extends AuthState {}

class SendEmailState extends AuthState {}

class SendEmailForPasswordSuccessfullyState extends AuthState {}

class SendEmailForPasswordErrorState extends AuthState {
  final String errMassage;

  SendEmailForPasswordErrorState(
    this.errMassage,
  );
}

class LoginWithGoogleSuccessfullyState extends AuthState {}

class LoginWithGoogleErrorState extends AuthState {
  final String errMassage;

  LoginWithGoogleErrorState(this.errMassage);
}

class LoginWithGoogleLoadingState extends AuthState {}
