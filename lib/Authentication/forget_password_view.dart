import 'package:flutter/material.dart';
import 'package:food_recipes_afame/Authentication/verify_otp_view.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

class ForgotPasswordView extends StatefulWidget {
  ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar("Get Verification Code"),
      backgroundColor: AppColors.primary,
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Image.asset(ImagePaths.forgetPageImage),

            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(
                    text: "Forget Your ",
                    style: TextStyle(color: AppColors.black),
                  ),
                  const TextSpan(
                    text: "Forget Your ",
                    style: TextStyle(color: AppColors.primary),
                  ),
                  const TextSpan(
                    text: "?",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),
            commonText(
              "Enter your email address to reset your password.",
              size: 14.0,
            ),
            const SizedBox(height: 30),

            // Email TextField
            commonTextfieldWithTitle(
              "Email",
              emailController,
              hintText: "Enter your email",
              assetIconPath: ImagePaths.email,
              keyboardType: TextInputType.emailAddress,
            ),
            Spacer(),

            commonButton(
              "Get Verification Code",
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtpVerifyView()),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
