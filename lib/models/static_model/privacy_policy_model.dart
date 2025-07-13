class StaticContentModel {
  final String content;

  StaticContentModel({required this.content});

  factory StaticContentModel.fromJson(Map<String, dynamic> json) {
    return StaticContentModel(
      content: json['content'] ?? '',
    );
  }
}
