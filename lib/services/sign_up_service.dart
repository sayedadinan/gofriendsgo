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

  Future<http.Response> postEmail(String email) async {
    final url = Uri.parse('$_baseUrl/login');
    final payload = jsonEncode({'email': email});
    try {
      // Send the POST request
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: payload,
      );

      // Check the response status
      if (response.statusCode == 200) {
        log('Email sent successfully');
        final responseData = jsonDecode(response.body);
        log('Response data: $responseData');
      } else {
        log('Failed to send email: ${response.statusCode}');
        log('Response body: ${response.body}');
      }
      return response;
    } catch (e) {
      log('Error occurred: $e');
      rethrow;
    }
  }

  Future<void> verifyOtp(int otp, String email) async {
    log("otp $otp");
    log(email);
    final url = 'https://gofriendsgo.teqsuit.com/api/verify/otp/$otp';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'otp': otp,
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      log('OTP sent successfully');
      final responseData = jsonDecode(response.body);
      log('Response data: $responseData');
      // Handle successful response
    } else {
      // Handle error response
      log('Failed to verify OTP: ${response.body}');
    }
  }
}
