import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/bookings_model/bookings_model.dart';
import 'package:gofriendsgo/services/booking_service.dart';
import 'package:gofriendsgo/services/shared_preferences.dart';

class BookingViewModel extends ChangeNotifier {
  final BookingService _service = BookingService();
  BookingResponse? _bookingResponse;
  bool _isLoading = false;

  BookingResponse? get bookingResponse => _bookingResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchBookingsfromservice() async {
    log('message');
    _isLoading = true;
// Notify listeners that loading has started

    try {
      _bookingResponse =
          await _service.fetchBookings(SharedPreferecesServices.token!);
      if (_bookingResponse != null) {
        log('Bookings fetched successfully');
        // Example: logging the user name of the first booking if it exists
        if (_bookingResponse!.data.bookings.isNotEmpty) {
          log(_bookingResponse!.data.bookings[0].services);
        }
      }
      notifyListeners();
    } catch (e) {
      // Handle error
      log('Error fetching bookings: $e');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners that loading has ended
    }
  }
}
