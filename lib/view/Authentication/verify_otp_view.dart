import 'package:flutter/material.dart';
import 'package:food_recipes_afame/view/Authentication/reset_password_view.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

class OtpVerifyView extends StatefulWidget {
  OtpVerifyView({super.key});

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends State<OtpVerifyView> {
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.clear();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar("Verify Email"),
      backgroundColor: AppColors.primary,
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Image.asset(ImagePaths.verificationPageImage),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(
                    text: "Enter ",
                    style: TextStyle(color: Colors.black),
                  ),
                  const TextSpan(
                    text: "Verification",
                    style: TextStyle(color: AppColors.primary),
                  ),
                  const TextSpan(
                    text: " Code.",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            commonText(
              "Enter the code that was sent to your email.",
              size: 14.0,
            ),
            const SizedBox(height: 20),

            // OTP Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: buildOTPTextField(
                    otpControllers[index],
                    index,
                    context,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Resend Code
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonText(
                  "Didn't receive the code? ",
                  size: 14.0,
                  color: Colors.grey,
                ),
                GestureDetector(
                  onTap: () {},
                  child: commonText(
                    "Resend",
                    size: 14.0,
                    color: Colors.black,
                    isBold: true,
                  ),
                ),
              ],
            ),
            Spacer(),

            // Verify Button
            commonButton(
              "Verify",
              textColor: Colors.white,
              onTap: () {
                navigateToPage(ResetPasswordView());
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
