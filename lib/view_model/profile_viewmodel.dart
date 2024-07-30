import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/main.dart';
import 'package:gofriendsgo/model/profile_model/profile_model.dart';
import 'package:gofriendsgo/services/profile_service.dart';
import 'package:gofriendsgo/services/shared_preferences.dart';
import 'package:gofriendsgo/utils/constants/text_controllers.dart';
import 'package:gofriendsgo/services/api/app_apis.dart';
class ProfileViewModel extends ChangeNotifier {
  final ProfileService _service = ProfileService();
  UserProfileModel? _profileResponse;
  bool _isLoading = false;

  // Separate variables for specific data
  String? userName;
  String? userEmail;
  String? userPhone;
  String? profilePercentage;
  String? profilePic;
  String? companyName;
  String? dob;
  String? frequentFlyerNo;
  String? additionalDetails;
  String? emailVerified;
  String? referral;
  String? source;
  String? specify;
  int? status;

  UserProfileModel? get profileResponse => _profileResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      log(SharedPreferecesServices.token!);
      _profileResponse = await _service.fetchProfile("");
      if (_profileResponse != null) {
        userName = _profileResponse!.data.user.name;
        userEmail = _profileResponse!.data.user.email;
        userPhone = _profileResponse!.data.user.phone;
        nameController.text = _profileResponse!.data.user.name;
        emailController.text = _profileResponse!.data.user.email;
        mobileController.text = _profileResponse!.data.user.phone??"23423423423";
        profilePic = _profileResponse!.data.user.profilePic;
        companyNameController.text = _profileResponse!.data.user.companyName;
        dobController.text = _profileResponse!.data.user.dob;
        frequentController.text = _profileResponse!.data.user.frequentFlyerNo;
        additionalController.text =
            _profileResponse!.data.user.additionalDetails;
        emailVerified = _profileResponse!.data.user.emailVerifiedAt;
        emailVerified = _profileResponse!.data.user.profilePic;
        source = _profileResponse!.data.user.source;
        specify = _profileResponse!.data.user.specify;
        status = _profileResponse!.data.user.status;
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

  Future<void> updateProfile(int userId, updatedData) async {
    print('started');
    _isLoading = true;
    notifyListeners();

    try {
      final success = await _service.updateUserProfile(
        userId,
        updatedData,
        SharedPreferecesServices.token!,
      );
      if (success) {
        log('Profile updated successfully');
        await fetchProfile(); // Refresh profile data after update
      } else {
        log('Failed to update profile');
        // Handle failure (e.g., show error message)
      }
    } catch (e) {
      log('Error updating profile: $e');
      // Handle any exceptions (e.g., show error message)
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
