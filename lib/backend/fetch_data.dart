import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jamur/config.dart';

class FetchData {
  List<dynamic> _data = [];

  // Public method, bisa diakses dari luar kelas
  Future<List<dynamic>> fetchRealtimeData() async {
    final response = await http.get(
      Uri.parse('${Config.apiUrl}/get_realtime_data.php'),
    );

    if (response.statusCode == 200) {
      try {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['success']) {
          _data = jsonResponse['data'];
          return _data;  // Mengembalikan data ke pemanggil method
        } else {
          print('Error: ${jsonResponse['message']}');
          return [];
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        return [];
      }
    } else {
      print('HTTP error: ${response.statusCode}');
      return [];
    }
  }
}
