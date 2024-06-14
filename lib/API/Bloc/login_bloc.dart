// import 'package:bloc/bloc.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'login_event.dart';
// import 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginInitial()) {
//     on<LoginRequested>(_onLoginRequested);
//   }

//   Future<void> _onLoginRequested(
//     LoginRequested event,
//     Emitter<LoginState> emit,
//   ) async {
//     emit(LoginLoading());
//     try {
//       final response = await http.post(
//         Uri.parse('https://bachay.com/api/v1/customer/auth/login'),
//         headers: {'Content-Type': 'application/x-www-form-urlencoded'},
//         body: {'user_id': event.userId},
//       );

//       if (response.statusCode == 200) {
//         final responseBody = jsonDecode(response.body);
//         emit(LoginSuccess(responseBody['message']));
//       } else {
//         emit(LoginFailure('Failed to login'));
//       }
//     } catch (e) {
//       emit(LoginFailure(e.toString()));
//     }
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    print('LoginRequested event received');  // Debugging line
    emit(LoginLoading());
    try {
      final response = await http.post(
        Uri.parse('https://bachay.com/api/v1/customer/auth/login'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'user_id': event.userId},
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final message = responseBody['message'].toString(); // Ensure message is a string
        print('Login success: $message');  // Debugging line
        emit(LoginSuccess(message));
      } else {
        print('Login failed with status: ${response.statusCode}');  // Debugging line
        emit(LoginFailure('Failed to login'));
      }
    } catch (e) {
      print('Exception during login: $e');  // Debugging line
      emit(LoginFailure(e.toString()));
    }
  }
}
