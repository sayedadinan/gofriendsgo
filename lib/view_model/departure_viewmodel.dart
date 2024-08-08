import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/detarture_model/departure_model.dart';
import 'package:gofriendsgo/services/departure_service.dart';
import 'package:gofriendsgo/services/shared_preferences.dart';

class FixedDeparturesViewModel extends ChangeNotifier {
  final FixedDeparturesService _service = FixedDeparturesService();
  FixedDeparturesModel? _fixedDeparturesResponse;
  bool _isLoading = false;

  FixedDeparturesModel? get fixedDeparturesResponse => _fixedDeparturesResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchFixedDepartures() async {
    _isLoading = true;

    try {
      _fixedDeparturesResponse =
          await _service.fetchFixedDepartures(SharedPreferecesServices.token!);
      if (_fixedDeparturesResponse != null) {
        log('Fixed departures fetched successfully');
        // if (_fixedDeparturesResponse!.data.fixedDepartures.isNotEmpty) {
        //   log(_fixedDeparturesResponse!.data.fixedDepartures[0].);
        // }
      }
    } catch (e) {
      log('Error fetching fixed departuress: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
