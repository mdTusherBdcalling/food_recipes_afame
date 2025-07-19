import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/favorite/favorite_controller.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/view/HomePage/recipe_details_view.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonDesigns.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class FavoritesView extends StatelessWidget {
  FavoritesView({super.key});

  final FavoriteController controller = Get.put(FavoriteController());

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



                  controller.isLoading.value && controller.currentPage == 1
                      ? const CircularProgressIndicator()
                      :(controller.allRecipes.isEmpty)?_buildEmptyState(): _buildRecipeGrid(),
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
          log(item.isFavorite.toString());
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





  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 120,),
          Material(
            borderRadius: BorderRadius.circular(50),
            shadowColor: AppColors.primary.withOpacity(0.5),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                shape: BoxShape.circle,

                border: Border.all(width: 2, color: AppColors.primary),
              ),
              padding: const EdgeInsets.all(24),
              child: Icon(
                Icons.favorite_border,
                size: 48,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          commonText("No favorites yet", size: 21, isBold: true),
          const SizedBox(height: 8),
          commonText(
            "Start exploring our recipes and save your\nfavorites to build your personal collection",
            size: 16,

            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),

            child: commonButton(
              "Start Exploring",
              width: 180,
              onTap: () {
                // TODO: Navigate to explore or home
              },
            ),
          ),
        ],
      ),
    );
  }





}

