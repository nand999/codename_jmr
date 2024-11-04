import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jamur/backend/user_preferences.dart';
import 'package:jamur/config.dart';


class AuthService {
  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('${Config.apiUrl}/login.php'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    // Print the raw response for debugging
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        final userData = data["data"];
        print(data["data"]);
        UserPreferences.saveUserId(userData["id_user"]);
        return data['success'];
      } catch (e) {
        print('Error decoding JSON: $e');
        return false;
      }
    } else {
      print('HTTP error: ${response.statusCode}');
      return false;
    }
  }
}
