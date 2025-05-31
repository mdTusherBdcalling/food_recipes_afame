import 'package:flutter/material.dart';
import 'package:food_recipes_afame/Authentication/signup_view.dart';
import 'package:food_recipes_afame/Authentication/forget_password_view.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/root_view.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  bool remenberMe = false;
  bool isPasswordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    setState(() => isPasswordVisible = !isPasswordVisible);
  }

  void toggleTermsAccepted(bool? val) {
    setState(() => remenberMe = val ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: commonText(
          "Sign In to Your Account",
          size: 20,
          isBold: true,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      bottomSheet: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              commonTextfieldWithTitle(
                'Email',
                emailController,
                assetIconPath: ImagePaths.email,
                hintText: "Enter your email",

                enable: true,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              commonTextfieldWithTitle(
                'Password',
                passwordController,
                assetIconPath: ImagePaths.lock,
                hintText: "Enter your password",

                enable: true,
                isPasswordVisible: !isPasswordVisible,
                issuffixIconVisible: true,
                changePasswordVisibility: togglePasswordVisibility,
              ),

              Row(
                children: [
                  Checkbox(
                    value: remenberMe,
                    onChanged: toggleTermsAccepted,
                    activeColor: AppColors.gray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: const BorderSide(color: AppColors.gray),
                  ),
                  commonText("Remember me"),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      navigateToPage(ForgotPasswordView());
                    },
                    child: commonText("Forgot Password", isBold: true),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              commonButton(
                "Sign In",
                onTap: () {
                  navigateToPage(MainScreen());
                },
              ),

              const SizedBox(height: 32),

              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    commonText(
                      "Don’t have an account?   ",
                      size: 14,
                      color: Colors.black87,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateToPage(SignUpView());
                      },
                      child: commonText("Sign Up", size: 14, isBold: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
