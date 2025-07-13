import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/profile/my_recipe_controller.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/view/shared/commonDesigns.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';
import 'package:get/get.dart';

class MyRecipesView extends StatelessWidget {
  const MyRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyRecipesController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: commonText("My Recipes", size: 20, isBold: true),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.recipes.isEmpty) {
          return Center(child: commonText("No recipes found."));
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: controller.recipes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final item = controller.recipes[index];
              return RecipeCard(
                imageUrl: item.image,
                region: item.origin,
                title: item.recipeName,
                time: item.estimateTime,
                difficulty: item.difficultyLevel,
                isFavorite: item.isFavorite,
                onFavoriteTap: () {
                  // Optional: toggle favorite locally or call API
                  // item.isFavorite = !item.isFavorite;
                  // controller.recipes[index] = item;
                },
                onTap: () {
                  // Navigate to recipe details if needed
                },
              );
            },
          ),
        );
      }),
    );
  }
}
