import 'package:food_recipes_afame/utils/helper.dart';

class RegionResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final RegionData data;

  RegionResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory RegionResponseModel.fromJson(Map<String, dynamic> json) {
    return RegionResponseModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: RegionData.fromJson(json['data']),
    );
  }
}

class RegionData {
  final RegionMeta meta;
  final List<Region> result;

  RegionData({required this.meta, required this.result});

  factory RegionData.fromJson(Map<String, dynamic> json) {
    return RegionData(
      meta: RegionMeta.fromJson(json['meta']),
      result: (json['result'] as List).map((e) => Region.fromJson(e)).toList(),
    );
  }
}

class RegionMeta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  RegionMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory RegionMeta.fromJson(Map<String, dynamic> json) {
    return RegionMeta(
      page: json['page'],
      limit: json['limit'],
      total: json['total'],
      totalPage: json['totalPage'],
    );
  }
}

class Region {
  final String id;
  final String name;
  final String image;
  final int serialNo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Region({
    required this.id,
    required this.name,
    required this.image,
    required this.serialNo,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['_id'],
      name: json['name'],
      image: getFullImagePath(json['image'] ?? ""),
      serialNo: json['serialNo'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}
