import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/models/authentication/reset_password_response_model.dart';
import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/services/local_storage_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';
import 'package:food_recipes_afame/view/Authentication/signin_view.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class ResetPasswordController extends GetxController {
  final ApiService _apiService = ApiService();

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> resetPassword() async {
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      commonSnackbar(
        title: 'Validation Error',
        message: 'Please fill in both fields.',
        backgroundColor: Colors.red,
      );
      return;
    }

    if (newPassword.length < 6 || newPassword.length > 8) {
      commonSnackbar(
        title: 'Invalid Password',
        message: 'Password must be 6 to 8 characters.',
        backgroundColor: Colors.red,
      );
      return;
    }

    if (newPassword != confirmPassword) {
      commonSnackbar(
        title: 'Mismatch',
        message: 'Passwords do not match.',
        backgroundColor: Colors.red,
      );
      return;
    }

    isLoading.value = true;

    try {
      final token = await LocalStorageService().getToken();
      log("Reset Token: $token");

      final response = await _apiService.post(
        ApiEndpoints.resetPassword,
        {"password": newPassword, "confirmPassword": confirmPassword},
        extraHeader: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      final resetResponse = ResetPasswordResponseModel.fromJson(response);

      if (resetResponse.success) {
        commonSnackbar(
          title: 'Success',
          message: resetResponse.message,
          backgroundColor: Colors.green,
        );
        Get.offAll(() => SigninView());
      } else {
        commonSnackbar(
          title: 'Failed',
          message: resetResponse.message,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      commonSnackbar(
        title: 'Error',
        message: e.toString(),
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
