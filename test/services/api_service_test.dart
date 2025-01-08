/*import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:spacex_lm/services/api_service.dart';

// Mock the http.Client
class MockClient extends Mock implements http.Client {}

void main() {
  group('ApiService', () {
    late ApiService apiService;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      apiService = ApiService( mockClient);
    });

    test('fetchLaunches returns data if the API call is successful', () async {
      // Simulate a successful API response
      final response = http.Response(
        jsonEncode([
          {"name": "Launch 1", "details": "Details of Launch 1"},
          {"name": "Launch 2", "details": "Details of Launch 2"}
        ]),
        200,
      );

      // Mock the API call to return the response
      when(mockClient.get(Uri.parse('https://api.spacexdata.com/v3/launches')))
          .thenAnswer((_) async => response);

      // Call the method
      final launches = await apiService.fetchLaunches();

      // Verify the result
      expect(launches, isA<List>());
      expect(launches.length, 2);
      expect(launches[0]['name'], 'Launch 1');
      expect(launches[1]['name'], 'Launch 2');
    });
  });
}
*/