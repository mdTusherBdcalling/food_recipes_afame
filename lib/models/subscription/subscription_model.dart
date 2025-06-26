class SubscriptionModel {
  final bool success;
  final int statusCode;
  final String message;
  final SubscriptionData? data;

  SubscriptionModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: SubscriptionData.fromJson(json['data']),
    );
  }
}

class SubscriptionData {
  final String id;
  final String userId;
  final String subscriptionId;
  final DateTime expiryIn;
  final int remainingDrivers;

  SubscriptionData({
    required this.id,
    required this.userId,
    required this.subscriptionId,
    required this.expiryIn,
    required this.remainingDrivers,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) {
    return SubscriptionData(
      id: json['_id'],
      userId: json['userId'],
      subscriptionId: json['subscriptionId'],
      expiryIn: DateTime.parse(json['expiryIn']),
      remainingDrivers: json['remainingDrivers'],
    );
  }
}
