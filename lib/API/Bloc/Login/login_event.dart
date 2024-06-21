abstract class LoginEvent {}

class LoginRequested extends LoginEvent {
  final String userId;

  LoginRequested(this.userId);
}
