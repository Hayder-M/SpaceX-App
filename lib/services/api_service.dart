import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = "https://api.spacexdata.com/v3";

  Future<List<dynamic>> fetchLaunches() async {
    return await _fetchData(
      endpoint: '/launches',
      cacheKey: 'launches_cache',
    );
  }

  Future<List<dynamic>> fetchMissions() async {
    return await _fetchData(
      endpoint: '/missions',
      cacheKey: 'missions_cache',
    );
  }

  Future<List<dynamic>> _fetchData({
    required String endpoint,
    required String cacheKey,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString(cacheKey);

    if (cachedData != null) {
      return jsonDecode(cachedData);
    }

    // Fetch data from API
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Cache the data locally
      await prefs.setString(cacheKey, jsonEncode(data));
      return data;
    } else {
      throw Exception('Failed to fetch data from $endpoint');
    }
  }
}
