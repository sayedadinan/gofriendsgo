import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/main.dart';
import 'package:gofriendsgo/model/profile_model/profile_model.dart';
import 'package:gofriendsgo/services/profile_service.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileService _service = ProfileService();
  UserProfileModel? _profileResponse;
  bool _isLoading = false;

  // Separate variables for specific data
  String? userName;
  String? userEmail;
  String? userPhone;
  String? profilePercentage;
  // Add other fields as needed

  UserProfileModel? get profileResponse => _profileResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      _profileResponse = await _service.fetchProfile(tokenss);
      if (_profileResponse != null) {
        userName = _profileResponse!.data.user.name;
        userEmail = _profileResponse!.data.user.email;
        userPhone = _profileResponse!.data.user.phone;
        // profilePercentage=_profileResponse!.data.user.
        // Extract other fields as needed

        log('Profile fetched successfully');
        log('User Name: $userName');
        log('User Email: $userEmail');
      }
    } catch (e) {
      log('Error fetching profile: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
