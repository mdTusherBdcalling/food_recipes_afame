import 'package:flutter/material.dart';
import 'package:food_recipes_afame/view/Subscription/subscription_view.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';
import 'package:get/get.dart';

class PlanManagementView extends StatelessWidget {
  const PlanManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: commonText(
          "Plan Management",
          size: 18,
          isBold: true,
          color: Colors.black87,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Top Icon + Title + Badge
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImagePaths.managePlanIcon, // plan icon
                    height: 36,
                    width: 36,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText("Current Plan", size: 16, isBold: true),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset(ImagePaths.starIcon, height: 16, width: 16),
                        const SizedBox(width: 6),
                        commonText("Premium User", size: 14),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Billing Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildInfoRow("Next Billing Date", "25th May, 2025"),
                  const Divider(),
                  _buildInfoRow("Plan", "Premium"),
                  const Divider(),
                  _buildInfoRow("Amount", "\$9.99/month"),
                  const Divider(),
                  const SizedBox(height: 16),

                  // Renew button
                  InkWell(
                    onTap: () {
                      navigateToPage(SubscriptionView());
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Center(
                        child: commonText(
                          "Renew Plan",
                          size: 16,
                          isBold: true,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Change Plan button
                  commonButton(
                    "Change Plan",
                    color: AppColors.primary,
                    textColor: Colors.white,
                    onTap: () {
                      navigateToPage(SubscriptionView());
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Cancel Button
            commonButton(
              "Cancel Plan",
              color: Colors.red,
              textColor: Colors.white,
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonText(label, size: 14),
          commonText(value, size: 14, isBold: true),
        ],
      ),
    );
  }
}
