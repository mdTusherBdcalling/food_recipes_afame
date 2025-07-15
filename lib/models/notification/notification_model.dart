class NotificationModel {
  final bool success;
  final int statusCode;
  final String message;
  final NotificationData data;

  NotificationModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: NotificationData.fromJson(json['data']),
    );
  }
}

class NotificationData {
  final NotificationMeta meta;
  final List<AppNotification> result;

  NotificationData({
    required this.meta,
    required this.result,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      meta: NotificationMeta.fromJson(json['meta']),
      result: (json['result'] as List)
          .map((e) => AppNotification.fromJson(e))
          .toList(),
    );
  }
}

class NotificationMeta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  NotificationMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory NotificationMeta.fromJson(Map<String, dynamic> json) {
    return NotificationMeta(
      page: json['page'],
      limit: json['limit'],
      total: json['total'],
      totalPage: json['totalPage'],
    );
  }
}

class AppNotification {
  final String id;
  final String senderId;
  final String receiverId;
  final String linkId;
  final String role;
  final String type;
  final String message;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;

  AppNotification({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.linkId,
    required this.role,
    required this.type,
    required this.message,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['_id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      linkId: json['linkId'],
      role: json['role'],
      type: json['type'],
      message: json['message'],
      isRead: json['isRead'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
