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
   
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Cache the data with a timestamp
        await prefs.setString(cacheKey, jsonEncode(data));
        await prefs.setString(
            '${cacheKey}_timestamp', DateTime.now().toIso8601String());

        return data;
      } else {
        throw Exception(
            'Failed to fetch data from $endpoint: ${response.statusCode}');
      }
    } catch (e) {
      print("Network request failed: $e");
      final cachedData = prefs.getString(cacheKey);

      // Check if cached data is available
      if (cachedData != null) {
        print("Using stale cached data.");
        return jsonDecode(cachedData);
      } else {
        throw Exception('No cached data available and network request failed.');
      }
    }
  }

  Future<bool> isCacheExpired(String cacheKey, Duration expiryDuration) async {
    final prefs = await SharedPreferences.getInstance();
    final timestamp = prefs.getString('${cacheKey}_timestamp');
    if (timestamp != null) {
      final cacheTime = DateTime.parse(timestamp);
      return DateTime.now().difference(cacheTime) > expiryDuration;
    }
    return true;
  }
}
