import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseUrl = 'https://ulmobservices.srilankan.com/ULRESTAPP/api';

  // Function to fetch locations
  Future<List<String>> fetchLocations() async {
    final response = await http.get(Uri.parse('$baseUrl/locations'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<String> locations = data
          .map<String>((location) => location['LocationCode'] as String) // Explicit cast to non-nullable String
          .toList();

      return locations;
    } else {
      throw Exception('Failed to fetch locations');
    }
  }
}
