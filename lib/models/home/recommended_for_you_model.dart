import 'package:food_recipes_afame/models/recipi_model.dart';

class RecommendedForYouResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final RecipeData data;

  RecommendedForYouResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory RecommendedForYouResponseModel.fromJson(Map<String, dynamic> json) {
    return RecommendedForYouResponseModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: RecipeData.fromJson(json['data']),
    );
  }
}
