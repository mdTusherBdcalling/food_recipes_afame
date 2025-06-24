class ResetPasswordResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final bool data;

  ResetPasswordResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] ?? false,
    );
  }
}
