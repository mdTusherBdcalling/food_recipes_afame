import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/profile/profile_controller.dart';
import 'package:food_recipes_afame/services/local_storage_service.dart';
import 'package:food_recipes_afame/view/Authentication/signin_view.dart';
import 'package:food_recipes_afame/view/Profile/edit_profile_view.dart';
import 'package:food_recipes_afame/view/Profile/my_recipes_view.dart';
import 'package:food_recipes_afame/view/Profile/plan_management_view.dart';
import 'package:food_recipes_afame/view/Profile/privacy_policy.dart';
import 'package:food_recipes_afame/view/Profile/settings.dart';
import 'package:food_recipes_afame/view/Profile/terms_and_condition.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.user.value == null)
              return commonText("No user data", size: 16, isBold: true);

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundImage: NetworkImage(
                          controller.user.value!.image,
                        ),
                      ),
              
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonText(
                              controller.user.value!.name,
                              size: 20,
                              isBold: true,
                            ),
              
                            commonText(
                              (controller.user.value!.phone != null)
                                  ? controller.user.value!.phone!
                                  : controller.user.value!.email,
                              maxline: 1,
                              size: 14,
                            ),
              
                            if (!(controller.subscription.value == null ||
                                DateTime.now().isAfter(
                                  controller.subscription.value!.expiryIn,
                                )))
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade100,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(ImagePaths.starIcon, scale: 2),
                                      const SizedBox(width: 6),
                                      commonText(
                                        "Premium User",
                                        size: 14,
                                        isBold: true,
                                        color: Colors.amber.shade700,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateToPage(
                            EditProfileView(),
                            ontap: (p0) {
                              controller.fetchUserProfile();
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(ImagePaths.editProfileIcon),
                            const SizedBox(width: 4),
                            commonText("Edit Profile", size: 14, isBold: true),
                          ],
                        ),
                      ),
                    ],
                  ),
              
                  const SizedBox(height: 24),
              
                  // Premium plan card
                  if (controller.subscription.value != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText("Premium Plan", size: 18, isBold: true),
                          commonText(
                            "You have access to all premium features",
                            size: 14,
                          ),
                          const Divider(color: Colors.black),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Check expiration
                              DateTime.now().isAfter(
                                    controller.subscription.value!.expiryIn,
                                  )
                                  ? commonText(
                                    "Subscription Expired",
                                    size: 14,
                                    color: Colors.red,
                                    isBold: true,
                                  )
                                  : Flexible(
                                    child: commonText(
                                      "Next billing date: ${DateFormat('MMMM dd, yyyy').format(controller.subscription.value!.expiryIn)}",
                                      size: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                              GestureDetector(
                                onTap: () {
                                  navigateToPage(PlanManagementView(data: controller.subscription.value,));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.black),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: commonText(
                                    "Manage",
                                    size: 14,
                                    color: AppColors.black,
                                    isBold: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              
                  const SizedBox(height: 32),
              
                  // Menu items list
                  _buildMenuItem(
                    imagePath: ImagePaths.accountIcon,
                    text: "Account Settings",
                    onTap: () {
                      navigateToPage(SettingsScreen());
                    },
                  ),
                  _buildMenuItem(
                    imagePath: ImagePaths.myRecipesIcon,
                    text: "My Recipes",
                    onTap: () {
                      navigateToPage(MyRecipesView());
                    },
                  ),
                  _buildMenuItem(
                    imagePath: ImagePaths.privacyPolicyIcon,
                    text: "Privacy Policy",
                    onTap: () {
                      navigateToPage(PrivacyPolicyScreen());
                    },
                  ),
                  _buildMenuItem(
                    imagePath: ImagePaths.termsConditionsIcon,
                    text: "Terms & Policies",
                    onTap: () {
                      navigateToPage(TermsAndConditonScreen());
                    },
                  ),
                  
                  ListTile(
                    leading: Image.asset(ImagePaths.logoutIcon),
                    title: commonText(
                      "Log Out",
                      size: 16,
                      color: Colors.amber.shade700,
                      isBold: true,
                    ),
                    onTap: () {
                      Get.offAll(SigninView());
                      LocalStorageService().removeToken();
                    },
                  ),
                  Divider(color: Colors.black),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String imagePath,
    required String text,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            imagePath,
            width: 24,
            height: 24,
            color: AppColors.primary,
          ),
          title: commonText(text, size: 16, isBold: false),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.black38,
          ),
          onTap: onTap,
        ),
        const Divider(color: Colors.black),
      ],
    );
  }
}
