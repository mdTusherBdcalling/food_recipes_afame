import 'package:flutter/material.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonDesigns.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

import 'package:get/get.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = [
      '2 cups of main ingredient',
      '1 tablespoon of seasoning',
      '3 cloves of garlic, minced',
      '1/2 cup of broth or water',
      'Fresh herbs to taste',
      'Salt and pepper to taste',
    ];

    final List<String> instructions = [
      'Prepare all ingredients by washing and chopping as needed',
      'Heat the cooking vessel and add oil or butter',
      'Add aromatics and cook until fragrant',
      'Add main ingredients and cook according to the recipe',
      'Season to taste and adjust flavors',
      'Serve hot with appropriate accompaniments',
    ];

    final relatedRecipes = List.generate(
      3,
      (index) => {
        "imageUrl":
            "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
        "region": "Middle East",
        "title": "Moroccan Chicken Tagine",
        "time": "25 Min",
        "difficulty": "Easy",
      },
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Top Image
            Stack(
              children: [
                Image.network(
                  'https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg',
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
                        "Moroccan Chicken Tagine",
                        size: 22,
                        isBold: true,
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time_filled_outlined,

                                    color: Colors.green,
                                  ),
                                  const SizedBox(width: 4),
                                  commonText("25 Min", size: 14),
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
                                  commonText("Origin: North Africa", size: 14),
                                ],
                              ),
                            ],
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
                              "Easy",
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
                        "A delicious traditional recipe that brings together the authentic flavors of North Africa. This dish is perfect for both special occasions and everyday meals.",
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),

                      const SizedBox(height: 20),

                      // Ingredients
                      commonText("Ingredients", size: 16, isBold: true),
                      const SizedBox(height: 8),
                      ...ingredients.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
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

                      // Instructions
                      commonText("Instructions", size: 16, isBold: true),
                      const SizedBox(height: 8),
                      ...instructions.asMap().entries.map((entry) {
                        final i = entry.key + 1;
                        final step = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonText("$i. ", size: 16, isBold: true),
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
                      }),

                      const SizedBox(height: 20),

                      // Cultural background
                      commonText("Cultural Background", size: 16, isBold: true),
                      const SizedBox(height: 8),
                      commonText(
                        "This dish has deep roots in North Africa culinary tradition. It is typically served during gatherings and celebrations, symbolizing community and shared heritage. The recipe has been passed down through generations, with each family adding their unique touches while preserving the authentic flavors.",
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
                                isFavorite: true,
                                onFavoriteTap: () {},
                                onTap: () {},
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
  }
}
