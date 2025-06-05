class OtpVerificationResponse {
  final bool success;
  final int statusCode;
  final String message;
  final OtpVerificationData data;

  OtpVerificationResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) =>
      OtpVerificationResponse(
        success: json['success'] ?? false,
        statusCode: json['statusCode'] ?? 0,
        message: json['message'] ?? '',
        data: OtpVerificationData.fromJson(json['data'] ?? {}),
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
    'data': data.toJson(),
  };
}

class OtpVerificationData {
  final String resetPasswordToken;

  OtpVerificationData({required this.resetPasswordToken});

  factory OtpVerificationData.fromJson(Map<String, dynamic> json) =>
      OtpVerificationData(resetPasswordToken: json['resetPasswordToken'] ?? '');

  Map<String, dynamic> toJson() => {'resetPasswordToken': resetPasswordToken};
}
