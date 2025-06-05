class ForgotPasswordResponse {
  final bool success;
  final int statusCode;
  final String message;
  final ForgotPasswordData data;

  ForgotPasswordResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponse(
        success: json['success'] ?? false,
        statusCode: json['statusCode'] ?? 0,
        message: json['message'] ?? '',
        data: ForgotPasswordData.fromJson(json['data'] ?? {}),
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
    'data': data.toJson(),
  };
}

class ForgotPasswordData {
  final String forgotPasswordToken;

  ForgotPasswordData({required this.forgotPasswordToken});

  factory ForgotPasswordData.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordData(
        forgotPasswordToken: json['forgotPasswordToken'] ?? '',
      );

  Map<String, dynamic> toJson() => {'forgotPasswordToken': forgotPasswordToken};
}
