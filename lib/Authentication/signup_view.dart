import 'package:flutter/material.dart';
import 'package:food_recipes_afame/Authentication/email_verify_view.dart';
import 'package:food_recipes_afame/Authentication/signin_view.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPassVisible = false;
  bool isTermsAccepted = false;

  void togglePasswordVisibility() {
    setState(() => isPasswordVisible = !isPasswordVisible);
  }

  void toggleConfirmPassVisibility() {
    setState(() => isConfirmPassVisible = !isConfirmPassVisible);
  }

  void toggleTermsAccepted(bool? val) {
    setState(() => isTermsAccepted = val ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: authAppBar("Create Account"),
      bottomSheet: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonTextfieldWithTitle(
                'Full name',
                fullNameController,
                assetIconPath: ImagePaths.profile,
                hintText: "Enter your full name",
                borderWidth: 0.0,
                enable: true,
              ),

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

              const SizedBox(height: 16),

              commonTextfieldWithTitle(
                'Confirm Password',
                confirmPassController,
                assetIconPath: ImagePaths.lock,
                hintText: "Enter your password",

                enable: true,
                isPasswordVisible: !isConfirmPassVisible,
                issuffixIconVisible: true,
                changePasswordVisibility: toggleConfirmPassVisibility,
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Checkbox(
                    value: isTermsAccepted,
                    onChanged: toggleTermsAccepted,
                    activeColor: AppColors.gray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: const BorderSide(color: Colors.black26),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "Agree with ",
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                        children: [
                          TextSpan(
                            text: "Terms and Conditions",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: AppColors.black,
                            ),
                            // Add gesture recognizer for actual navigation if needed
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              commonButton(
                "Sign Up",

                height: 50,
                onTap: () {
                  // if (!isTermsAccepted) {
                  //   Get.snackbar(
                  //     "Error",
                  //     "You must agree with Terms and Conditions",
                  //     snackPosition: SnackPosition.BOTTOM,
                  //   );
                  //   return;
                  // }

                  navigateToPage(EmailVerifyView());
                },
              ),

              const SizedBox(height: 32),

              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    commonText(
                      "Already have an account? ",
                      size: 14,
                      color: Colors.black87,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateToPage(SigninView());
                      },
                      child: commonText(
                        "Sign In",
                        size: 14,
                        color: AppColors.primary,
                        isBold: true,
                      ),
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
