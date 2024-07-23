import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/user_model/user_details_model.dart';
import 'package:gofriendsgo/services/sign_up_service.dart';

class UserViewModel extends ChangeNotifier {
  String sourceController = '';
  final UserService _userService = UserService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int? otpCode;
  String? _message;
  String? get message => _message;

  Future<void> registerUser(UserDetails userDetails) async {
    log('reached');
    _isLoading = true;
    _message = null;
    notifyListeners();

    final response = await _userService.registerUser(userDetails);
    _isLoading = false;

    if (response != null && response['status'] == true) {
      _message = response['message'];
      log('successfully registered');
      log(_message.toString());
    } else {
      _message = response?['message'] ?? 'Registration failed';
      log('registration failed');
    }

    notifyListeners();
  }

  Future<void> loginUser(String userEmail) async {
    log('started login fun');
    _isLoading = true;
    _message = null;
    notifyListeners();

    final response = await _userService.postEmail(userEmail);
    _isLoading = false;
    log(response.body);
    notifyListeners();
  }

  Future<void> verifyOtp(int otp, String email) async {
    try {
      await _userService.verifyOtp(otp, email);
      // Handle success
      // Update any state if needed
      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error verifying OTP: $e');
      // Update any state if needed
      notifyListeners();
    }
  }
}
