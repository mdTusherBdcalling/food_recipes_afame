import 'package:food_recipes_afame/models/common_models.dart';

class SigninResponse {
  final bool success;
  final int statusCode;
  final String message;
  final SigninData data;

  SigninResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SigninResponse.fromJson(Map<String, dynamic> json) => SigninResponse(
    success: json['success'] ?? false,
    statusCode: json['statusCode'] ?? 0,
    message: json['message'] ?? '',
    data: SigninData.fromJson(json['data'] ?? {}),
  );
}

class SigninData {
  final String accessToken;
  final String refreshToken;
  final UserModel user; // <-- Reuse UserModel from common_models.dart

  SigninData({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory SigninData.fromJson(Map<String, dynamic> json) => SigninData(
    accessToken: json['accessToken'] ?? '',
    refreshToken: json['refreshToken'] ?? '',
    user: UserModel.fromJson(json['user'] ?? {}),
  );
}
