import 'package:flutter/material.dart';
import 'package:food_recipes_afame/view/Authentication/question_view.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: commonText(
          "Edit Profile",
          size: 20,
          isBold: true,
          color: Colors.black87,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            // Avatar circle with edit icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: AppColors.primary,
                  child: Image.asset("assets/icons/profile/profile (2).png"),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(Icons.edit, size: 20, color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Full name field
            commonTextfieldWithTitle(
              "Full name",
              nameController,
              hintText: "Enter your full name",
              issuffixIconVisible: false,

              enable: true,
              textSize: 14.0,
              assetIconPath: ImagePaths.profile, // update if needed
            ),

            const SizedBox(height: 16),

            // Phone number field
            commonTextfieldWithTitle(
              "Phone Number",
              phoneController,
              hintText: "Enter your phone number",
              issuffixIconVisible: false,

              enable: true,
              textSize: 14.0,
              keyboardType: TextInputType.phone,
              assetIconPath: ImagePaths.callIcon, // update if needed
            ),

            const SizedBox(height: 32),

            // Save button
            commonButton(
              "Save",
              onTap: () {
                Get.back();
              },
            ),

            const SizedBox(height: 30),

            // Edit preferences option
            GestureDetector(
              onTap: () {
                navigateToPage(QuestionnaireFlow());
              },
              child: Row(
                children: [
                  Image.asset(
                    ImagePaths.performance, // add this icon in assets
                    height: 24,
                    width: 24,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 12),
                  commonText(
                    "Edit your Preferences",
                    size: 16,
                    color: Colors.black87,
                    isBold: false,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.black26, height: 32),
          ],
        ),
      ),
    );
  }
}
