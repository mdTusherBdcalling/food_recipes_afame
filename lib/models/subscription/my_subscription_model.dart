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
      data: MySubscriptionData.fromJson(json['data']),
    );
  }
}

class MySubscriptionData {
  final String id;
  final String userId;
  final String subscriptionId;
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
      subscriptionId: json['subscriptionId'],
      expiryIn: DateTime.parse(json['expiryIn']),
      remainingDrivers: json['remainingDrivers'],
    );
  }
}
