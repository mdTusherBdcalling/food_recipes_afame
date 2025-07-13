import 'package:food_recipes_afame/utils/helper.dart';

class BlogModel {
  final String id;
  final String userId;
  final String headline;
  final String description;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  BlogModel({
    required this.id,
    required this.userId,
    required this.headline,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      headline: json['headline'] ?? '',
      description: json['description'] ?? '',
      image: getFullImagePath(json['image'] ?? ''),
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }
}
