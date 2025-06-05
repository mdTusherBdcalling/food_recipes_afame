class UserModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String status;
  final bool isDeleted;
  final bool isSocialLogin;
  final bool isCompleted;
  final String createdAt;
  final String updatedAt;
  final String cookingFrequency;
  final String cultureHeritage;
  final String favoriteDish;
  final String pageGoal;
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    required this.isDeleted,
    required this.isSocialLogin,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
    required this.cookingFrequency,
    required this.cultureHeritage,
    required this.favoriteDish,
    required this.pageGoal,
    required this.image,
  });

  // Factory method to create a User from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      status: json['status'],
      isDeleted: json['isDeleted'],
      isSocialLogin: json['isSocialLogin'],
      isCompleted: json['isCompleted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      cookingFrequency: json['cookingFrequency'],
      cultureHeritage: json['cultureHeritage'],
      favoriteDish: json['favoriteDish'],
      pageGoal: json['pageGoal'],
      image: json['image'],
    );
  }
}
