import 'package:flutter/material.dart';
import 'package:food_recipes_afame/view/Authentication/signin_view.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  @override
  void dispose() {
    newPasswordController.clear();
    confirmPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar("Reset Password"),
      backgroundColor: AppColors.primary,
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(ImagePaths.resetPageImage),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(
                    text: "Now Reset Your ",
                    style: TextStyle(color: AppColors.black),
                  ),
                  const TextSpan(
                    text: "Password",
                    style: TextStyle(color: AppColors.primary),
                  ),
                  const TextSpan(
                    text: ".",
                    style: TextStyle(color: AppColors.black, fontSize: 28),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            commonText("Password  must have 6-8 characters.", size: 14.0),
            const SizedBox(height: 30),

            // New Password TextField
            commonTextfieldWithTitle(
              "New Password",
              newPasswordController,
              hintText: "Enter your password",
              assetIconPath: ImagePaths.lock,

              isPasswordVisible: isPasswordVisible,
              issuffixIconVisible: true,
              changePasswordVisibility: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 15),

            // Confirm New Password TextField
            commonTextfieldWithTitle(
              "Confirm New Password",
              confirmPasswordController,
              hintText: "Enter your password",
              assetIconPath: ImagePaths.lock,

              isPasswordVisible: isConfirmPasswordVisible,
              issuffixIconVisible: true,
              changePasswordVisibility: () {
                setState(() {
                  isConfirmPasswordVisible = !isConfirmPasswordVisible;
                });
              },
            ),
            Spacer(),
            commonButton(
              "Reset Password",
              textColor: Colors.white,
              onTap: () {
                Get.to(SigninView());
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
