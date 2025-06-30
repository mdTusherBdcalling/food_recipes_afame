class ChangePasswordResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final bool data;

  ChangePasswordResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResponseModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'],
    );
  }
}
