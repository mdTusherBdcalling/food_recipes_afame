// import 'dart:developer';

// import 'package:food_recipes_afame/services/api_service.dart';

// class AuthService {
//   final ApiService _apiService = ApiService();

//   Future<LoginResponse> login({
//     required String email,
//     required String password,
//   }) async {
//     final response = await _apiService.post(ApiEndpoints.login, {
//       'email': email,
//       'password': password,
//     });

//     return LoginResponse.fromJson(response);
//   }

//   Future<ForgotPasswordOtpResponse> forgotPasswordOtpByEmail(
//     String email,
//   ) async {
//     final response = await _apiService.post(
//       ApiEndpoints.forgotPasswordOtpByEmail,
//       {'email': email},
//     );

//     return ForgotPasswordOtpResponse.fromJson(response);
//   }

//   Future<ForgotPasswordOtpMatchResponse> forgotPasswordOtpMatch(
//     String otp,
//   ) async {
//     final response = await _apiService.patch(
//       ApiEndpoints.forgotPasswordOtpMatch,
//       {'otp': otp},
//     );

//     return ForgotPasswordOtpMatchResponse.fromJson(response);
//   }

//   Future<PasswordResetResponse> resetPassword({
//     required String newPassword,
//     required String confirmPassword,
//   }) async {
//     final response = await _apiService.patch(ApiEndpoints.forgotPasswordReset, {
//       'newPassword': newPassword,
//       'confirmPassword': confirmPassword,
//     });

//     return PasswordResetResponse.fromJson(response);
//   }

//   Future<SignupResponse> signup({
//     required String fullName,
//     required String email,
//     required String password,
//     required String phone,
//     required String gender,
//   }) async {
//     final response = await _apiService.post(ApiEndpoints.createUser, {
//       'fullName': fullName,
//       'email': email,
//       'password': password,
//       'phone': phone,
//       'gender': gender,
//     });

//     return SignupResponse.fromJson(response);
//   }

//   Future<SignupEmailVerifiedResponse> signupEmailVerified(
//     Map<String, dynamic> userData,
//   ) async {
//     log(userData.toString());
//     final response = await _apiService.post(
//       ApiEndpoints.createUserVerifyOtp,
//       userData,
//     );
//     return SignupEmailVerifiedResponse.fromJson(response);
//   }
// }
