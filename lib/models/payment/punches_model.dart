class SubscriptionPurchaseResponseModel {
  final bool success;
  final int statusCode;
  final String message;

  SubscriptionPurchaseResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
  });

  factory SubscriptionPurchaseResponseModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionPurchaseResponseModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }
}
