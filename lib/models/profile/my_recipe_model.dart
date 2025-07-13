
import 'package:food_recipes_afame/utils/helper.dart';

class MyRecipeData {
  final MyRecipeMeta meta;
  final List<RecipeItem> result;

  MyRecipeData({
    required this.meta,
    required this.result,
  });

  factory MyRecipeData.fromJson(Map<String, dynamic> json) {
    return MyRecipeData(
      meta: MyRecipeMeta.fromJson(json['meta']),
      result: (json['result'] as List)
          .map((e) => RecipeItem.fromJson(e))
          .toList(),
    );
  }
}
class MyRecipeMeta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  MyRecipeMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory MyRecipeMeta.fromJson(Map<String, dynamic> json) {
    return MyRecipeMeta(
      page: json['page'],
      limit: json['limit'],
      total: json['total'],
      totalPage: json['totalPage'],
    );
  }
}
class RecipeItem {
  final String id;
  final String userId;
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
  final String music;
  final bool isAccepted;
  final String createdAt;
  final String updatedAt;
  bool isFavorite;

  RecipeItem({
    required this.id,
    required this.userId,
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
    required this.music,
    required this.isAccepted,
    required this.createdAt,
    required this.updatedAt,
    required this.isFavorite
  });

  factory RecipeItem.fromJson(Map<String, dynamic> json) {
    return RecipeItem(
      id: json['_id'],
      userId: json['userId'],
      recipeName: json['recipeName'],
      estimateTime: json['estimateTime'],
      difficultyLevel: json['difficultyLevel'],
      origin: json['origin'],
      description: json['description'],
      ingredients: json['ingredients'],
      instruction: json['instruction'],
      cultureBackground: json['cultureBackground'],
      clickCount: json['clickCount'],
      image: getFullImagePath(json['image']??""),
      music: json['music'],
      isAccepted: json['isAccepted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      isFavorite: json['isFavorite']??false
    );
  }
}
