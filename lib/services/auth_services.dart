import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tujuh_sembilan_test_app/utils/utils.dart';
import '../models/auth_response.dart';
import '../models/user.dart';

class AuthService {
  static const String baseUrl = 'https://dummyjson.com/auth';

  // Login
  static Future<AuthResponse> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': 30,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final userAccessToken = data['accessToken'];
      Utils.saveToken(userAccessToken);
      return AuthResponse(
        user: User.fromJson(data),
        message: 'Login successful',
        success: true,
      );
    } else {
      final error = jsonDecode(response.body);
      return AuthResponse(
        user: User(
          id: 0,
          username: '',
          email: '',
          firstName: '',
          lastName: '',
          gender: '',
          image: '',
          accessToken: '',
          refreshToken: '',
        ),
        message: error['message'] ?? 'Login failed',
        success: false,
      );
    }
  }

  // Get current user
  static Future<User> getCurrentUser(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/me'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
