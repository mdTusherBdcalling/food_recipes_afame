import 'package:flutter/material.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

class RoleChooseView extends StatelessWidget {
  const RoleChooseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              ImagePaths
                  .registerBackground, // replace with your background image path
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.55)),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // Logo
                  Image.asset(ImagePaths.logo),

                  const Spacer(),

                  // Welcome Text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: commonText(
                      "Welcome",
                      size: 28,
                      isBold: true,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Description with bold "Mamafé"
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        children: [
                          const TextSpan(
                            text: "Now continue after register in ",
                          ),
                          TextSpan(
                            text: "“Mamafé”.",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Sign In Button (Filled)
                  commonButton(
                    "Sign In",

                    onTap: () {
                      // TODO: Navigate to Sign In page
                    },
                  ),

                  const SizedBox(height: 16),

                  // Sign Up Button (Outlined)
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to Sign Up page
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.8,
                        ),
                      ),
                      child: Center(
                        child: commonText(
                          "Sign Up",
                          size: 18,
                          color: Colors.white,
                          isBold: true,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
