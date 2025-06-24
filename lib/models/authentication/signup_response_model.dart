class SignupResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final SignupData data;

  SignupResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: SignupData.fromJson(json['data']),
    );
  }
}

class SignupData {
  final String signUpToken;

  SignupData({required this.signUpToken});

  factory SignupData.fromJson(Map<String, dynamic> json) {
    return SignupData(signUpToken: json['signUpToken']);
  }
}
