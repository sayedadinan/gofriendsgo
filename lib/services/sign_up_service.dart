import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:gofriendsgo/model/user_model/user_details_model.dart';

//from here the user informations are sending to the backend
class UserService {
  final String _baseUrl = 'https://gofriendsgo.teqsuit.com/api';
  Future<Map<String, dynamic>?> registerUser(UserDetails userDetails) async {
    final url = Uri.parse('$_baseUrl/register');
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(userDetails.toJson());

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        log('Failed to register user: ${response.statusCode}');
        log('Error: ${response.body}');
        return null;
      }
    } catch (error) {
      log('Error registering user: $error');
      return null;
    }
  }
}
