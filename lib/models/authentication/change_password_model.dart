class PasswordChangeResponse {
  final bool success;
  final int statusCode;
  final String message;
  final bool data;

  PasswordChangeResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory PasswordChangeResponse.fromJson(Map<String, dynamic> json) =>
      PasswordChangeResponse(
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
