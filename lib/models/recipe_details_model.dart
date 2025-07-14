import 'package:food_recipes_afame/utils/helper.dart';

class RecipeDetailModel {
  final bool success;
  final int statusCode;
  final String message;
  final RecipeDetail data;

  RecipeDetailModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message']??"",
      data: RecipeDetail.fromJson(json['data']),
    );
  }
}

class RecipeDetail {
  final String id;
  final User userId;
  final String music;
  final String recipeName;
  final String estimateTime;
  final String difficultyLevel;
  final String origin;
  final String description;
  final String ingredients;
  final String instruction;
  final String cultureBackground;
  final String image;
  final bool isAccepted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int clickCount;
  bool isFavorite;

  RecipeDetail({
    required this.id,
    required this.userId,
    required this.music,
    required this.recipeName,
    required this.estimateTime,
    required this.difficultyLevel,
    required this.origin,
    required this.description,
    required this.ingredients,
    required this.instruction,
    required this.cultureBackground,
    required this.image,
    required this.isAccepted,
    required this.createdAt,
    required this.updatedAt,
    required this.clickCount,
    required this.isFavorite
  });

  factory RecipeDetail.fromJson(Map<String, dynamic> json) {
    return RecipeDetail(
      id: json['_id']??"",
      userId: User.fromJson(json['userId']),
      music: json['music']??"",
      recipeName: json['recipeName']??"",
      estimateTime: json['estimateTime']??"",
      difficultyLevel: json['difficultyLevel']??"",
      origin: json['origin']??"",
      description: json['description']??"",
      ingredients: json['ingredients']??"",
      instruction: json['instruction']??"",
      cultureBackground: json['cultureBackground']??"",
      image: getFullImagePath(json['image'] ?? ""),
      isAccepted: json['isAccepted']??false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      clickCount: json['clickCount'],
      isFavorite: json["isFavorite"]??false
    );
  }
}

class User {
  final String id;
  final String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['_id'], name: json['name']);
  }
}
