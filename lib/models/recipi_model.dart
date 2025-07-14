import 'package:food_recipes_afame/utils/helper.dart';

class RecipeModel {
  final String id;
  final String userId;
  final String? music;
  final String recipeName;
  final String estimateTime;
  final String difficultyLevel;
  final String origin;
  final String description;
  final String ingredients;
  final String instruction;
  final String cultureBackground;
  final int clickCount;
  final String image;
  final bool isAccepted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Local UI state (not from server)
  bool isFavorite;

  RecipeModel({
    required this.id,
    required this.userId,
    this.music,
    required this.recipeName,
    required this.estimateTime,
    required this.difficultyLevel,
    required this.origin,
    required this.description,
    required this.ingredients,
    required this.instruction,
    required this.cultureBackground,
    required this.clickCount,
    required this.image,
    required this.isAccepted,
    this.createdAt,
    this.updatedAt,
    required this.isFavorite,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      music: json['music']??"",
      recipeName: json['recipeName'] ?? '',
      estimateTime: formatEstimateTime(json['estimateTime'] ?? ''),
      difficultyLevel: json['difficultyLevel'] ?? '',
      origin: json['origin'] ?? '',
      description: json['description'] ?? '',
      ingredients: json['ingredients'] ?? '',
      instruction: json['instruction'] ?? '',
      cultureBackground: json['cultureBackground'] ?? '',
      clickCount: json['clickCount'] ?? 0,
      image: getFullImagePath(json['image'] ?? ''),
      isAccepted: json['isAccepted'] ?? false,
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt']??"")
              : null,
      updatedAt:
          json['updatedAt'] != null
              ? DateTime.tryParse(json['updatedAt']??"")
              : null,
      isFavorite: json['isFavorite']??false
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'music': music,
      'recipeName': recipeName,
      'estimateTime': estimateTime,
      'difficultyLevel': difficultyLevel,
      'origin': origin,
      'description': description,
      'ingredients': ingredients,
      'instruction': instruction,
      'cultureBackground': cultureBackground,
      'clickCount': clickCount,
      'image': image,
      'isAccepted': isAccepted,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class RecipeMeta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  RecipeMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory RecipeMeta.fromJson(Map<String, dynamic> json) {
    return RecipeMeta(
      page: json['page'],
      limit: json['limit'],
      total: json['total'],
      totalPage: json['totalPage'],
    );
  }
}

class RecipeData {
  final RecipeMeta meta;
  final List<RecipeModel> result;

  RecipeData({required this.meta, required this.result});

  factory RecipeData.fromJson(Map<String, dynamic> json) {
    return RecipeData(
      meta: RecipeMeta.fromJson(json['meta']),
      result: List<RecipeModel>.from(
        json['result'].map((x) => RecipeModel.fromJson(x)),
      ),
    );
  }
}
