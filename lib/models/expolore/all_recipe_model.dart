import 'package:food_recipes_afame/models/recipi_model.dart';

class AllResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final RecipeData data;

  AllResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AllResponseModel.fromJson(Map<String, dynamic> json) {
    return AllResponseModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: RecipeData.fromJson(json['data']),
    );
  }
}
