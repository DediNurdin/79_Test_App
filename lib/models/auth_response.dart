import 'user.dart';

class AuthResponse {
  final User user;
  final String message;
  final bool success;

  AuthResponse({
    required this.user,
    required this.message,
    required this.success,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      user: User.fromJson(json),
      message: json['message'] ?? '',
      success: json['success'] ?? false,
    );
  }
}
