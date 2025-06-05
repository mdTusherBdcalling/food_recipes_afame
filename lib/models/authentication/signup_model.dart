class SignUpResponse {
  final bool success;
  final int statusCode;
  final String message;
  final SignUpData data;

  SignUpResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    success: json['success'] ?? false,
    statusCode: json['statusCode'] ?? 0,
    message: json['message'] ?? '',
    data: SignUpData.fromJson(json['data'] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
    'data': data.toJson(),
  };
}

class SignUpData {
  final String signUpToken;

  SignUpData({required this.signUpToken});

  factory SignUpData.fromJson(Map<String, dynamic> json) =>
      SignUpData(signUpToken: json['signUpToken'] ?? '');

  Map<String, dynamic> toJson() => {'signUpToken': signUpToken};
}
