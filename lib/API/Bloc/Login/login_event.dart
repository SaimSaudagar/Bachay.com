abstract class LoginEvent {}

class LoginRequested extends LoginEvent {
  final String userId;

  LoginRequested(this.userId);
}

class LoginOtpRequested extends LoginEvent {
  final String otp;
  final String userId;

  LoginOtpRequested(this.otp, this.userId);
}