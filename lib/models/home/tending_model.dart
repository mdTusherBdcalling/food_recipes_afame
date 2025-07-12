class RelatedRecipeMeta {
  final int total;
  final int totalPage;
  final int page;
  final int limit;

  RelatedRecipeMeta({
    required this.total,
    required this.totalPage,
    required this.page,
    required this.limit,
  });

  factory RelatedRecipeMeta.fromJson(Map<String, dynamic> json) {
    return RelatedRecipeMeta(
      total: json['total'] ?? 0,
      totalPage: json['totalPage'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
    );
  }
}

class RelatedRecipeItem {
  final String id;
  final String recipeName;
  final String estimateTime;
  final String userName;
  final String userImage;
  final String userId;

  RelatedRecipeItem({
    required this.id,
    required this.recipeName,
    required this.estimateTime,
    required this.userName,
    required this.userImage,
    required this.userId,
  });

  factory RelatedRecipeItem.fromJson(Map<String, dynamic> json) {
    return RelatedRecipeItem(
      id: json['_id'] ?? '',
      recipeName: json['recipeName'] ?? '',
      estimateTime: json['estimateTime'] ?? '',
      userName: json['userName'] ?? '',
      userImage: json['userImage'] ?? '',
      userId: json['userId'] ?? '',
    );
  }
}
