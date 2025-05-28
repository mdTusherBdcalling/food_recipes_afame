import 'package:flutter/material.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

class NotificationsView extends StatelessWidget {
  final List<Map<String, String>> notifications;

  const NotificationsView({super.key, required this.notifications});

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
      body:
          notifications.isEmpty ? _buildEmptyState() : _buildNotificationList(),
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
            "Your notifications will be appear on\nthis page.",
            size: 18,

            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: notifications.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final notif = notifications[index];
        final bool isHighlighted = index == 0;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

          decoration: BoxDecoration(
            color:
                isHighlighted
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
                      notif['message'] ?? '',
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 4),
                    commonText(notif['time'] ?? '', size: 12),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
