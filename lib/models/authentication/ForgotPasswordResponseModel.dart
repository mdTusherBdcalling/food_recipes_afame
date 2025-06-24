class ForgotPasswordResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final ForgotPasswordData data;

  ForgotPasswordResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponseModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: ForgotPasswordData.fromJson(json['data']),
    );
  }

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

  factory ForgotPasswordData.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordData(forgotPasswordToken: json['forgotPasswordToken']);
  }

  Map<String, dynamic> toJson() => {'forgotPasswordToken': forgotPasswordToken};
}
