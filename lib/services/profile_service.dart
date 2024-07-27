import 'dart:convert';
import 'dart:developer';
import 'package:gofriendsgo/model/profile_model/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  final String _baseUrl = 'https://gofriendsgo.certumventures.in/api/user';

  Future<UserProfileModel?> fetchProfile(String token) async {
    log('Fetching profile started');
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/profile'),
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
}
