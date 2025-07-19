import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/recipe/recipe_controller.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/view/HomePage/recipe_details_view.dart';
import 'package:food_recipes_afame/view/Recipes/create_recipe_view.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonDesigns.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class RecipesView extends StatelessWidget {
  RecipesView({super.key});

  final RecipesController controller = Get.put(RecipesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            return SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  commonButton(
                    "  Create Recipe",
                    color: Colors.transparent,
                    textColor: AppColors.black,
                    boarderRadious: 16,
                    iconWidget: const Icon(Icons.add),
                    boarder: Border.all(width: 2, color: AppColors.primary),
                    onTap: () {
                      navigateToPage(const CreateRecipeView());
                    },
                  ),
                  const SizedBox(height: 12),
                  commonTextfieldWithTitle(
                    '',
                    controller.searchController,
                    hintText: "Search your favorite recipes...",
                    assetIconPath: ImagePaths.searchIcon,
                    borderWidth: 0.0,
                    enable: true,
                    onChnage: (p0) {
                      if(p0.isEmpty){
                        controller.onSearchChanged();
                      }
                    },
                    onsubmit: (_) => controller.onSearchChanged(),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(16),
                          child: commonDropdown<String>(
                            items: controller.difficulties,
                            value: controller.selectedDifficulty,
                            hint: "All Difficulties",
                            onChanged: (val) {
                              if (val != null) {
                                controller.onDifficultyChanged(val);
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(16),
                          child: commonDropdown<String>(
                            items: controller.sortOptions,
                            value: controller.selectedSort,
                            hint: "Sort By",
                            onChanged: (val) {
                              if (val != null) {
                                controller.onSortChanged(val);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  
                  (controller.isLoading.value && controller.currentPage == 1)
                      ? const CircularProgressIndicator()
                      : _buildRecipeGrid(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildRecipeGrid() {
    return Obx(() {
      return GridView.builder(
        itemCount: controller.allRecipes.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 28,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final item = controller.allRecipes[index];
          return RecipeCard(
            imageUrl: item.image,
            region: item.origin,
            title: item.recipeName,
            time: item.estimateTime,
            difficulty: item.difficultyLevel,
            isFavorite: item.isFavorite,
            onFavoriteTap: () {
              controller.toggleFavorite(index);
            },
            onTap: () {
              navigateToPage(RecipeDetailsView(id: item.id));
            },
          );
        },
      );
    });
  }
}

