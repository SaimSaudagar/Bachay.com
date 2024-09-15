import 'package:app/API/Bloc/Login/Login_Event.dart';
import 'package:app/API/Bloc/Login/Login_State.dart';
import 'package:app/API/Repository/Login_Repo.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({
    required this.loginRepository,
  }) : super(LoginInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());
      try {
        final banners = await loginRepository.login(event.userId);
        emit(LoginSuccess(banners));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<LoginOtpRequested>((event, emit) async {
      emit(OtpLoading());
      try {
        final SharedPreferences localStorage =
            await SharedPreferences.getInstance();

        final token = await loginRepository.verifyOtp(event.otp, event.userId);
        await localStorage.setString('token', token);

        emit(OtpSuccess(token));
      } catch (e) {
        emit(OtpFailure(e.toString()));
      }
    });
  }
}
