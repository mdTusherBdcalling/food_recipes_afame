class EmailVerifyResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final UserData data;
  final String token;

  EmailVerifyResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.token,
  });

  factory EmailVerifyResponseModel.fromJson(Map<String, dynamic> json) {
    return EmailVerifyResponseModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: UserData.fromJson(json['data']['user']),
      token: json['data']['accessToken'] ?? "",

    );
  }
}

class UserData {
  final String name;
  final String email;
  final String password;
  final String role;
  final String status;
  final bool isDeleted;
  final bool isSocialLogin;
  final bool isCompleted;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  UserData({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.status,
    required this.isDeleted,
    required this.isSocialLogin,
    required this.isCompleted,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      status: json['status'],
      isDeleted: json['isDeleted'],
      isSocialLogin: json['isSocialLogin'],
      isCompleted: json['isCompleted'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
