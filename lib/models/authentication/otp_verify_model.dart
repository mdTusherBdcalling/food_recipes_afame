class OtpVerifyResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final String resetPasswordToken;

  OtpVerifyResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.resetPasswordToken,
  });

  factory OtpVerifyResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpVerifyResponseModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      resetPasswordToken: json['data']['resetPasswordToken'] ?? '',
    );
  }
}
