abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;

  LoginSuccess(this.message);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

class OtpLoading extends LoginState {}

class OtpSuccess extends LoginState {
  final String message;

  OtpSuccess(this.message);
}

class OtpFailure extends LoginState {
  final String error;

  OtpFailure(this.error);
}
