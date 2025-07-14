class MySubscriptionModel {
  final bool success;
  final int statusCode;
  final String message;
  final MySubscriptionData? data;

  MySubscriptionModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MySubscriptionModel.fromJson(Map<String, dynamic> json) {
    return MySubscriptionModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? MySubscriptionData.fromJson(json['data'])
          : null,
    );
  }
}

class MySubscriptionData {
  final String id;
  final String userId;
  final SubscriptionPlan subscriptionId;
  final DateTime expiryIn;
  final int remainingDrivers;

  MySubscriptionData({
    required this.id,
    required this.userId,
    required this.subscriptionId,
    required this.expiryIn,
    required this.remainingDrivers,
  });

  factory MySubscriptionData.fromJson(Map<String, dynamic> json) {
    return MySubscriptionData(
      id: json['_id'],
      userId: json['userId'],
      subscriptionId: SubscriptionPlan.fromJson(json['subscriptionId']),
      expiryIn: DateTime.parse(json['expiryIn']),
      remainingDrivers: json['remainingDrivers'],
    );
  }
}

class SubscriptionPlan {
  final String id;
  final String planCategory;
  final String planName;
  final String shortBio;
  final int price;
  final int timeline;
  final List<String> facilities;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubscriptionPlan({
    required this.id,
    required this.planCategory,
    required this.planName,
    required this.shortBio,
    required this.price,
    required this.timeline,
    required this.facilities,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['_id'],
      planCategory: json['planCategory'],
      planName: json['planName'],
      shortBio: json['shortBio'],
      price: json['price'],
      timeline: json['timeline'],
      facilities: List<String>.from(json['facilities']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
