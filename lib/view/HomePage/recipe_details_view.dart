import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/home/recipe_details_controller.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonDesigns.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

import 'package:get/get.dart';

class RecipeDetailsView extends StatefulWidget {
  const RecipeDetailsView({super.key, required this.id});
  final String id;

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  final List<String> instructions = [
    'Prepare all ingredients by washing and chopping as needed',
    'Heat the cooking vessel and add oil or butter',
    'Add aromatics and cook until fragrant',
    'Add main ingredients and cook according to the recipe',
    'Season to taste and adjust flavors',
    'Serve hot with appropriate accompaniments',
  ];

  final List<Map<String, dynamic>> relatedRecipes = List.generate(
    3,
    (index) => {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Middle East",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
      "isFavorite": false,
    },
  );

  @override
  Widget build(BuildContext context) {
    final RecipeDetailController controller = Get.put(
      RecipeDetailController(id: widget.id),
    );
    return Obx(() {
      if (controller.isLoading.value || controller.recipeDetail.value == null) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      }
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Top Image
              Stack(
                children: [
                  Image.network(
                    controller.recipeDetail.value!.image,
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ),
                ],
              ),

              // Content
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top labels
                        Row(
                          children: [
                            Image.asset(ImagePaths.musicIcon, scale: 3),
                            const SizedBox(width: 6),
                            commonText("Food Music", size: 14),
                          ],
                        ),
                        const SizedBox(height: 8),

                        commonText(
                          controller.recipeDetail.value!.recipeName,
                          size: 22,
                          isBold: true,
                        ),
                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time_filled_outlined,

                                        color: Colors.green,
                                      ),
                                      const SizedBox(width: 4),
                                      commonText(
                                        controller
                                            .recipeDetail
                                            .value!
                                            .estimateTime,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.language,
                                        color: Colors.orange,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            commonText("Origin: ", size: 14),
                                            Flexible(
                                              child: commonText(
                                                controller
                                                    .recipeDetail
                                                    .value!
                                                    .origin,
                                                size: 14,
                                                maxline: 1,
                                                isBold: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.35),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: commonText(
                                controller.recipeDetail.value!.difficultyLevel,
                                size: 13,
                                color: AppColors.secondary,
                                isBold: true,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Description
                        commonText("Description", size: 16, isBold: true),
                        const SizedBox(height: 8),
                        commonText(
                          controller.recipeDetail.value!.description,
                          size: 14,
                          fontWeight: FontWeight.w500,
                        ),

                        const SizedBox(height: 20),

                        // Ingredients
                        commonText("Ingredients", size: 16, isBold: true),
                        const SizedBox(height: 8),

                        ...controller.recipeDetail.value!.ingredients
                            .split(',')
                            .map((item) => item.trim())
                            .where((item) => item.isNotEmpty)
                            .map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonText("• ", size: 18),
                                    Expanded(
                                      child: commonText(
                                        item,
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                        const SizedBox(height: 20),

                        // Process instruction into steps

                        // Instructions UI
                        commonText("Instructions", size: 16, isBold: true),
                        const SizedBox(height: 8),

                        ...List.generate(
                          controller.recipeDetail.value!.instruction
                              .split(',')
                              .length,
                          (index) {
                            final step =
                                controller.recipeDetail.value!.instruction
                                    .split(',')[index];
                            final stepNumber = index + 1;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  commonText(
                                    "$stepNumber. ",
                                    size: 16,
                                    isBold: true,
                                  ),
                                  Expanded(
                                    child: commonText(
                                      step,
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        // Cultural background
                        commonText(
                          "Cultural Background",
                          size: 16,
                          isBold: true,
                        ),
                        const SizedBox(height: 8),
                        commonText(
                          controller.recipeDetail.value!.cultureBackground,
                          size: 14,
                          fontWeight: FontWeight.w500,
                        ),

                        const SizedBox(height: 24),

                        // Related recipes
                        commonText("Related Recipes", size: 16, isBold: true),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 230,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: relatedRecipes.length,
                            separatorBuilder:
                                (_, __) => const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              final item = relatedRecipes[index];
                              return SizedBox(
                                width: 180,
                                child: RecipeCard(
                                  imageUrl: item['imageUrl']!,
                                  region: item['region']!,
                                  title: item['title']!,
                                  time: item['time']!,
                                  difficulty: item['difficulty']!,
                                  isFavorite: item["isFavorite"]!,
                                  onFavoriteTap: () {
                                    setState(() {
                                      relatedRecipes[index]['isFavorite'] =
                                          !relatedRecipes[index]['isFavorite'];
                                    });
                                  },
                                  onTap: () {
                                    navigateToPage(
                                      const RecipeDetailsView(id: ""),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Explore CTA
                        Material(
                          borderRadius: BorderRadius.circular(16),
                          elevation: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Column(
                              children: [
                                Image.network(
                                  "https://th.bing.com/th/id/OIP.yy3jF0Tt5iILVLWk-Avm9AHaEK?cb=iwp2&rs=1&pid=ImgDetMain",
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: commonText(
                                    "Discover more delicious recipes from this region and learn about its rich culinary heritage.",
                                    size: 14,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: commonButton(
                                    "Explore North African Recipe",
                                    color: Colors.transparent,
                                    textColor: Colors.black,
                                    boarder: Border.all(
                                      width: 2,
                                      color: AppColors.primary,
                                    ),
                                    boarderRadious: 16.0,
                                    onTap: () {
                                      // TODO: Navigate to regional recipe list
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
