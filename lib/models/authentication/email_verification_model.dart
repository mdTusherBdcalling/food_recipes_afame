import 'package:food_recipes_afame/models/common_models.dart';

class EmailVerificationResponse {
  final bool success;
  final int statusCode;
  final String message;
  final EmailVerificationData data;

  EmailVerificationResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory EmailVerificationResponse.fromJson(Map<String, dynamic> json) =>
      EmailVerificationResponse(
        success: json['success'] ?? false,
        statusCode: json['statusCode'] ?? 0,
        message: json['message'] ?? '',
        data: EmailVerificationData.fromJson(json['data'] ?? {}),
      );
}

class EmailVerificationData {
  final UserModel user;

  EmailVerificationData({required this.user});

  factory EmailVerificationData.fromJson(Map<String, dynamic> json) =>
      EmailVerificationData(user: UserModel.fromJson(json['user'] ?? {}));
}
