import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofriendsgo/main.dart';
import 'package:gofriendsgo/model/service_model/serivce_model.dart';
import 'package:gofriendsgo/services/service_fetch.dart';

class ServiceViewModel extends ChangeNotifier {
  final ServiceService _service = ServiceService();
  List<ServiceModel> _services = [];
  bool _isLoading = false;

  List<ServiceModel> get services => _services;
  bool get isLoading => _isLoading;
  Future<void> fetchServices() async {
    _isLoading = true;
    notifyListeners();

    try {
      _services = await _service.fetchServices(token);
      log(_services[1].name);
    } catch (e) {
      // Handle error
     
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
