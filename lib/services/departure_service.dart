import 'dart:convert';
import 'dart:developer';
import 'package:gofriendsgo/model/detarture_model/departure_model.dart';
import 'package:gofriendsgo/services/api/app_apis.dart';
import 'package:http/http.dart' as http;

class FixedDeparturesService {

  Future<FixedDeparturesModel> fetchFixedDepartures(String token) async {
    log('Fetching fixed departures from service file');
    try {
      final response = await http.get(
        Uri.parse('${API.baseUrl}/fixeddepartures'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        return FixedDeparturesModel.fromJson(parsed);
      } else {
        log('Error: Failed to load fixed departures with status code ${response.statusCode}');
        throw Exception('Failed to load fixed departures');
      }
    } catch (e) {
      log('Exception caught: $e');
      throw Exception('Failed to load fixed departures: $e');
    }
  }
}
