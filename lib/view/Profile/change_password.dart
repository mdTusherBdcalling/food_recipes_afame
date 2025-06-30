import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/profile/ChangePasswordController.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';
import 'package:food_recipes_afame/view/Authentication/forget_password_view.dart';

class ChangePasswordScreen extends StatelessWidget {
  final controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: commonText("Change Password", size: 18, isBold: true),
        centerTitle: true,
      ),
      body: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// Current Password
              commonTextfieldWithTitle(
                "Current Password",
                controller.oldPasswordController,
                hintText: "Enter your password",
                assetIconPath: ImagePaths.lock,
                isPasswordVisible: controller.isOldPasswordVisible.value,
                issuffixIconVisible: true,
                changePasswordVisibility: () {
                  controller.isOldPasswordVisible.toggle();
                },
              ),

              const SizedBox(height: 15),

              /// New Password
              commonTextfieldWithTitle(
                "New Password",
                controller.newPasswordController,
                hintText: "Enter new password",
                assetIconPath: ImagePaths.lock,
                isPasswordVisible: controller.isNewPasswordVisible.value,
                issuffixIconVisible: true,
                changePasswordVisibility: () {
                  controller.isNewPasswordVisible.toggle();
                },
              ),

              const SizedBox(height: 15),

              /// Confirm Password
              commonTextfieldWithTitle(
                "Confirm New Password",
                controller.confirmPasswordController,
                hintText: "Re-enter new password",
                assetIconPath: ImagePaths.lock,
                isPasswordVisible: controller.isConfirmPasswordVisible.value,
                issuffixIconVisible: true,
                changePasswordVisibility: () {
                  controller.isConfirmPasswordVisible.toggle();
                },
              ),

              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Get.to(ForgotPasswordView()),
                    child: commonText("Forgot Password", isBold: true),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : commonButton(
                    "Change Password",
                    textColor: AppColors.white,
                    onTap: controller.changePassword,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
