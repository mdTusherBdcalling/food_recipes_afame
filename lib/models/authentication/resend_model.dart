class OtpResendResponseModel {
  final bool success;
  final int statusCode;
  final String message;

  OtpResendResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
  });

  factory OtpResendResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResendResponseModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'statusCode': statusCode, 'message': message};
  }
}
