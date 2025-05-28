import 'package:flutter/material.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/shared/commonDesigns.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';
import 'package:get/get.dart';

class MyRecipesView extends StatelessWidget {
  const MyRecipesView({super.key});

  final List<Map<String, dynamic>> myRecipes = const [
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Italy",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Italy",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Italy",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Italy",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: commonText(
          "My Recipes",
          size: 20,
          isBold: true,
          color: Colors.black87,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: myRecipes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final item = myRecipes[index];
            return RecipeCard(
              imageUrl: item['imageUrl'],
              region: item['region'],
              title: item['title'],
              time: item['time'],
              difficulty: item['difficulty'],
              isFavorite: true,
              onFavoriteTap: () {
                // TODO: Remove from favorites
              },
              onTap: () {
                // TODO: Navigate to recipe details
              },
            );
          },
        ),
      ),
    );
  }
}
