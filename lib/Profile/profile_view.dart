import 'package:flutter/material.dart';
import 'package:food_recipes_afame/Profile/my_recipes_view.dart';
import 'package:food_recipes_afame/Profile/privacy_policy.dart';
import 'package:food_recipes_afame/Profile/settings.dart';
import 'package:food_recipes_afame/Profile/terms_and_condition.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Avatar, name, phone, premium badge, edit button
              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/46.jpg',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText("Shihab Ahmed", size: 20, isBold: true),

                        commonText("+123 456 789", size: 14),

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
                      // TODO: Edit profile action
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
                        commonText(
                          "Next billing date: May 24, 2025",
                          size: 14,
                          color: Colors.black87,
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: Manage subscription
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
              Spacer(),
              ListTile(
                leading: Image.asset(ImagePaths.logoutIcon),
                title: commonText(
                  "Log Out",
                  size: 16,
                  color: Colors.amber.shade700,
                  isBold: true,
                ),
                onTap: () {
                  // TODO: Logout action
                },
              ),
              Divider(color: Colors.black),
            ],
          ),
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
            color: Colors.amber.shade700,
          ),
          title: commonText(
            text,
            size: 16,
            color: Colors.black87,
            isBold: false,
          ),
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
