class AddFavoriteResponseModel {
  final String userId;
  final String recipeId;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  AddFavoriteResponseModel({
    required this.userId,
    required this.recipeId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AddFavoriteResponseModel.fromJson(Map<String, dynamic> json) {
    return AddFavoriteResponseModel(
      userId: json['userId'],
      recipeId: json['recipeId'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
