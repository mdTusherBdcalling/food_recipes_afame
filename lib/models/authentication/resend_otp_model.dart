class ResendOtpResponse {
  final bool success;
  final int statusCode;
  final String message;

  ResendOtpResponse({
    required this.success,
    required this.statusCode,
    required this.message,
  });

  factory ResendOtpResponse.fromJson(Map<String, dynamic> json) =>
      ResendOtpResponse(
        success: json['success'] ?? false,
        statusCode: json['statusCode'] ?? 0,
        message: json['message'] ?? '',
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
  };
}
