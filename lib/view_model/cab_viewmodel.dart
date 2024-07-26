import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/main.dart';
import 'package:gofriendsgo/model/cab_model/cab_model.dart';
import 'package:gofriendsgo/services/cab_service.dart';

class CabViewModel extends ChangeNotifier {
  final CabService _service = CabService();
  CabModel? _cabResponse;
  bool _isLoading = false;

  CabModel? get cabResponse => _cabResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchCabs() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cabResponse = await _service.fetchCabs(tokenss);
      if (_cabResponse != null) {
        log('Cabs fetched successfully');
        if (_cabResponse!.data.cabs.isNotEmpty) {
          log(_cabResponse!.data.cabs[0].type);
        }
      }
    } catch (e) {
      log('Error fetching cabs: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
