import 'package:app/Models/Profile/User_Profile.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileRepository {
  Future<UserProfile> loadProfile() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}customer/info'),
          headers: {'Authorization': jwtToken});
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
}
