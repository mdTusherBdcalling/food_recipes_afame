import 'package:flutter/material.dart';
import 'package:food_recipes_afame/models/profile/change_password_model.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class ChangePasswordController extends GetxController {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;

  var isOldPasswordVisible = false.obs;
  var isNewPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  Future<void> changePassword() async {
    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      commonSnackbar(title: "Error", message: "All fields are required");
      return;
    }

    if (newPassword != confirmPassword) {
      commonSnackbar(title: "Error", message: "New passwords do not match");
      return;
    }

    isLoading.value = true;

    try {
      final response = await ApiService().post(ApiEndpoints.changePassword, {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
      });

      final result = ChangePasswordResponseModel.fromJson(response);

      if (result.success) {
        Get.back();
        commonSnackbar(
          title: "Success",
          message: result.message,
          backgroundColor: Colors.green,
        );
      } else {
        throw result.message;
      }
    } catch (e) {
      commonSnackbar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
