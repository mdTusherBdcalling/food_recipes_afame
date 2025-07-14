class SubscriptionResponse {
  final bool success;
  final int statusCode;
  final String message;
  final SubscriptionData data;

  SubscriptionResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return SubscriptionResponse(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: SubscriptionData.fromJson(json['data']),
    );
  }
}

class SubscriptionData {
  final SubscriptionMeta meta;
  final List<SubscriptionPlan> result;

  SubscriptionData({
    required this.meta,
    required this.result,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) {
    return SubscriptionData(
      meta: SubscriptionMeta.fromJson(json['meta']),
      result: List<SubscriptionPlan>.from(
        json['result'].map((x) => SubscriptionPlan.fromJson(x)),
      ),
    );
  }
}

class SubscriptionMeta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  SubscriptionMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory SubscriptionMeta.fromJson(Map<String, dynamic> json) {
    return SubscriptionMeta(
      page: json['page'],
      limit: json['limit'],
      total: json['total'],
      totalPage: json['totalPage'],
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
