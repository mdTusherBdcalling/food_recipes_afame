// controllers/authentication/forgot_password_controller.dart

import 'package:flutter/material.dart';
import 'package:food_recipes_afame/models/authentication/ForgotPasswordResponseModel.dart';
import 'package:food_recipes_afame/services/local_storage_service.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';
import 'package:food_recipes_afame/view/Authentication/verify_otp_view.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class ForgotPasswordController extends GetxController {
  final ApiService _apiService = ApiService();
  final TextEditingController emailController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> sendResetCode() async {
    final email = emailController.text.trim();

    if (email.isEmpty || !email.contains("@")) {
      commonSnackbar(
        title: "Validation Error",
        message: "Please enter a valid email",
        backgroundColor: Colors.red,
      );
      return;
    }

    isLoading.value = true;

    try {
      final body = {"email": email};

      final response = await _apiService.post(
        ApiEndpoints.forgotPassword,
        body,
      );
      final forgotResponse = ForgotPasswordResponseModel.fromJson(response);

      if (forgotResponse.success) {
        commonSnackbar(
          title: "Success",
          message: forgotResponse.message,
          backgroundColor: Colors.green,
        );
        LocalStorageService().saveToken(
          forgotResponse.data.forgotPasswordToken,
        );
        Get.to(() => OtpVerifyView());
      } else {
        commonSnackbar(
          title: "Error",
          message: forgotResponse.message,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      commonSnackbar(
        title: "Error",
        message: "Something went wrong",
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
