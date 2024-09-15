import 'dart:convert';
import 'package:app/Models/Home/Dsicount_Banner.dart';
import 'package:http/http.dart' as http;
import 'package:app/Utils/app_constants.dart';

class LoginRepository {
  Future<String> login(String userId) async {
    try {
      final response =
          await http.post(Uri.parse('${baseUrl}customer/auth/login'), body: {
        'user_id': userId,
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: ${e.toString()}');
    }
  }

  Future<String> verifyOtp(String otp, String userId) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}customer/auth/token'),
        body: {
          'user_id': userId,
          'otp': otp,
        },
      );
      if (response.statusCode == 200) {
        final data =
            jsonDecode(response.body.substring(1, response.body.length - 1));
        print(data);
        return data;
      } else {
        throw Exception('Failed to verify OTP');
      }
    } catch (e) {
      throw Exception('Failed to verify OTP: ${e.toString()}');
    }
  }
}
