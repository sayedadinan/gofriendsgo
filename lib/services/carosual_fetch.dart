import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:gofriendsgo/model/carosual_model/carosual_model.dart';

class CarousalsService {
  final String _baseUrl = 'https://gofriendsgo.teqsuit.com/api/user';

  Future<CarouselsModel> fetchCarousals(String token) async {
    log('Fetching carousals from service file');
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/carousels'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        return CarouselsModel.fromJson(parsed);
      } else {
        log('Error: Failed to load carousals with status code ${response.statusCode}');
        throw Exception('Failed to load carousals');
      }
    } catch (e) {
      log('Exception caught: $e');
      throw Exception('Failed to load carousals: $e');
    }
  }
}
