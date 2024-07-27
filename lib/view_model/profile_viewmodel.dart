import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/main.dart';
import 'package:gofriendsgo/model/profile_model/profile_model.dart';
import 'package:gofriendsgo/services/profile_service.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileService _service = ProfileService();
  UserProfileModel? _profileResponse;
  bool _isLoading = false;

  UserProfileModel? get profileResponse => _profileResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      _profileResponse = await _service.fetchProfile(tokenss);
      if (_profileResponse != null) {
        log('Profile fetched successfully');
        log('User Name: ${_profileResponse!.data.user.name}');
      }
    } catch (e) {
      log('Error fetching profile: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
