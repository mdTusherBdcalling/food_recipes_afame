import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/SigninController.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/view/Authentication/signup_view.dart';
import 'package:food_recipes_afame/view/Authentication/forget_password_view.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class SigninView extends StatelessWidget {
  SigninView({Key? key}) : super(key: key);

  final SigninController controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

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
                  controller.emailController,
                  assetIconPath: ImagePaths.email,
                  hintText: "Enter your email",
                  enable: true,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                commonTextfieldWithTitle(
                  'Password',
                  controller.passwordController,
                  assetIconPath: ImagePaths.lock,
                  hintText: "Enter your password",
                  enable: true,
                  isPasswordVisible: !controller.isPasswordVisible.value,
                  issuffixIconVisible: true,
                  changePasswordVisibility: controller.togglePasswordVisibility,
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: controller.toggleRememberMe,
                        activeColor: AppColors.gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(color: AppColors.gray),
                      ),
                    ),
                    commonText("Remember me"),
                    const Spacer(),
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
                    controller.login();
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
    });
  }
}
