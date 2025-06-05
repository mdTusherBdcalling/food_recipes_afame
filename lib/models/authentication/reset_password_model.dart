class PasswordResetResponse {
  final bool success;
  final int statusCode;
  final String message;
  final bool data;

  PasswordResetResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory PasswordResetResponse.fromJson(Map<String, dynamic> json) =>
      PasswordResetResponse(
        success: json['success'] ?? false,
        statusCode: json['statusCode'] ?? 0,
        message: json['message'] ?? '',
        data: json['data'] ?? false,
      );

  Map<String, dynamic> toJson() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
    'data': data,
  };
}
