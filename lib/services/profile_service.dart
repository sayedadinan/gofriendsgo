import 'dart:convert';
import 'dart:developer';
import 'package:gofriendsgo/model/profile_model/profile_model.dart';
import 'package:gofriendsgo/services/api/app_apis.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  Future<UserProfileModel?> fetchProfile(String token) async {
    log('Fetching profile started');
    try {
      final response = await http.get(
        Uri.parse('${API.baseUrl}/profile'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserProfileModel.fromJson(data);
      } else {
        log('Error: Failed to load profile with status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error fetching profile: $e');
      return null;
    }
  }

  Future<bool> updateUserProfile(
      int userId, Map<String, dynamic> updatedData, String token) async {
    print('started working');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.patch(
        Uri.parse('${API.baseUrl}/profile/$userId'),
        headers: headers,
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        return true; // Indicate success
      } else {
        print('Failed to update profile. Status code: ${response.statusCode}');
        return false; // Indicate failure
      }
    } catch (e) {
      print('Error updating profile: $e');
      return false; // Indicate failure
    }
  }
}
