import 'package:app/Models/Profile/User_Profile.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileRepository {
  Future<UserProfile> loadProfile() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}customer/info'),
          headers: {'Authorization': await getToken()});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserProfile.fromJson(data);
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      throw Exception('Failed to load profile: ${e.toString()}');
    }
  }

  Future<void> updateProfile(String name, String phone) async {
    try {
      if (name.split(" ").length < 2) {
        throw Exception('Please enter your full name');
      }

      final response = await http
          .post(Uri.parse('${baseUrl}customer/update-profile'), headers: {
        'Authorization': await getToken(),
      }, body: {
        'f_name': name.split(" ")[0],
        'l_name': name.split(" ")[1],
        'phone': phone,
      });
      print(response.body);
      if (response.statusCode != 200) {
        throw Exception(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to update profile: ${e.toString()}');
    }
  }
}
