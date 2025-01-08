import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = "https://api.spacexdata.com/v3";

  Future<List<dynamic>> fetchLaunches() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('launches_cache');

    if (cachedData != null) {
      return jsonDecode(cachedData);
    }

    // Fetch data from API
    final response = await http.get(Uri.parse('$baseUrl/launches'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Cache the data locally
      prefs.setString('launches_cache', jsonEncode(data));
      return data;
    } else {
      throw Exception('Failed to fetch launches');
    }
  }

  Future<List<dynamic>> fetchMissions() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('missions_cache');

    if (cachedData != null) {
      return jsonDecode(cachedData);
    }

    // Fetch data from API
    final response = await http.get(Uri.parse('$baseUrl/missions'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Cache the data locally
      prefs.setString('missions_cache', jsonEncode(data));
      return data;
    } else {
      throw Exception('Failed to fetch missions');
    }
  }
}
