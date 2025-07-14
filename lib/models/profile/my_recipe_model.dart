import 'package:food_recipes_afame/utils/helper.dart';

class MyRecipesResponse {
  final bool success;
  final int statusCode;
  final String message;
  final MyRecipesData data;

  MyRecipesResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MyRecipesResponse.fromJson(Map<String, dynamic> json) {
    return MyRecipesResponse(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: MyRecipesData.fromJson(json['data']),
    );
  }
}

class MyRecipesData {
  final MetaData meta;
  final List<MyRecipe> result;

  MyRecipesData({
    required this.meta,
    required this.result,
  });

  factory MyRecipesData.fromJson(Map<String, dynamic> json) {
    return MyRecipesData(
      meta: MetaData.fromJson(json['meta']),
      result: (json['result'] as List<dynamic>)
          .map((e) => MyRecipe.fromJson(e))
          .toList(),
    );
  }
}

class MetaData {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  MetaData({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      page: json['page'],
      limit: json['limit'],
      total: json['total'],
      totalPage: json['totalPage'],
    );
  }
}

class MyRecipe {
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
  final bool isAccepted;
  final DateTime createdAt;
  final DateTime updatedAt;

  MyRecipe({
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
    required this.isAccepted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyRecipe.fromJson(Map<String, dynamic> json) {
    return MyRecipe(
      id: json['_id']??"",
      userId: json['userId']??"",
      recipeName: json['recipeName']??"",
      estimateTime: json['estimateTime']??"",
      difficultyLevel: json['difficultyLevel']??"",
      origin: json['origin']??"",
      description: json['description']??"",
      ingredients: json['ingredients']??"",
      instruction: json['instruction']??"",
      cultureBackground: json['cultureBackground']??"",
      clickCount: json['clickCount']??"",
      image: getFullImagePath(json['image']??""),
      isAccepted: json['isAccepted']??"",
      createdAt: DateTime.parse(json['createdAt']??""),
      updatedAt: DateTime.parse(json['updatedAt']??""),
    );
  }
}
