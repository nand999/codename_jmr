// utils/user_preferences.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // Method to save the user ID
  static Future<void> saveUserId(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', userId);
    print('User ID saved: $userId'); // Log user ID saving
  }

  // Method to retrieve the user ID
  static Future<int> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id') ?? 0; // Default to 0 if not found
    print('User ID retrieved: $userId'); // Log user ID retrieval
    return userId;
  }

  // Method to save transactions
  static Future<void> saveTransactions(List<dynamic> transactions) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('transactions', jsonEncode(transactions)); // Store transactions as JSON string
    print('Transactions saved: ${transactions.length} items'); // Log transaction saving
  }

  // Method to retrieve transactions
  static Future<List<dynamic>> getTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final String? transactionsString = prefs.getString('transactions');
    if (transactionsString != null) {
      print('Transactions retrieved from SharedPreferences'); // Log transaction retrieval
      return jsonDecode(transactionsString); // Return decoded transaction list
    }
    print('No transactions found in SharedPreferences'); // Log if no transactions are found
    return [];
  }
}
