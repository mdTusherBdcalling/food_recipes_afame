import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/notification/notification_controller.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});

  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: commonText("Notifications", size: 20, isBold: true),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.notifications.isEmpty) {
          return _buildEmptyState();
        }

        return _buildNotificationList();
      }),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(ImagePaths.noNotifications, scale: 4),
          const SizedBox(height: 24),
          commonText("There’s no notifications", size: 21, isBold: true),
          const SizedBox(height: 8),
          commonText(
            "Your notifications will appear on\nthis page.",
            size: 18,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    return Obx(() {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: controller.notifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final notif = controller.notifications[index];
          final bool isHighlighted = notif.isRead == false;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: isHighlighted
                  ? AppColors.primary.withOpacity(0.25)
                  : AppColors.white,
            ),
            child: Row(
              children: [
                Icon(Icons.notifications, color: AppColors.primary, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(
                        notif.message,
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 4),
                      commonText(
                        _formatDate(notif.createdAt),
                        size: 12,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else {
      return "${difference.inDays} days ago";
    }
  }
}
