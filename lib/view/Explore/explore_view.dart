import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/explore_controller.dart';
import 'package:food_recipes_afame/controller/favorite/add_favorite_controller.dart';
import 'package:food_recipes_afame/view/HomePage/recipe_details_view.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonDesigns.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';
import 'package:get/get.dart';

class ExploreView extends StatefulWidget {
  ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final ExploreController exploreController = Get.put(ExploreController());

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SingleChildScrollView(
            controller: exploreController.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search bar
                commonTextfieldWithTitle(
                  '',
                  searchController,
                  hintText: "Search cultures, regions, cuisine types...",

                  assetIconPath: ImagePaths.searchIcon,
                  onsubmit: (p0) {
                    exploreController.applyFilters(
                      region: exploreController.origin,
                      search: p0,
                    );
                  },
                  onChnage: (p0) {
                    if (p0.isEmpty) {
                      exploreController.applyFilters(
                        region: exploreController.origin,
                        search: p0,
                      );
                    }
                  },
                  enable: true,
                ),

                Obx(() {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      if (exploreController.allRegions.isNotEmpty)
                        Row(
                          children: [
                            commonText(
                              "Explore by Region",
                              size: 18,
                              isBold: true,
                              color: Colors.black87,
                            ),
                          ],
                        ),

                      const SizedBox(height: 12),

                      // Regions Grid
                      SizedBox(
                        child: GridView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,

                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 2.7,
                              ),
                          itemCount: exploreController.allRegions.length,
                          itemBuilder: (context, index) {
                            final isSelected =
                                exploreController.origin ==
                                exploreController.allRegions[index].name;

                            return GestureDetector(
                              onTap: () {
                                exploreController.applyFilters(
                                  region:
                                      exploreController.allRegions[index].name,
                                );
                              },
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      exploreController.allRegions[index].image,  errorBuilder: (context, error, stackTrace) => commonImageErrorWidget(),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                      color:
                                          isSelected
                                              ? Colors.black
                                              : Colors.white38,

                                      colorBlendMode: BlendMode.screen,
                                    ),
                                  ),
                                  Center(
                                    child: commonText(
                                      exploreController.allRegions[index].name,
                                      size: 16,
                                      isBold: true,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),

                const SizedBox(height: 20),

                // Middle East Recipes header with Clear filter
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText(
                      exploreController.origin == null
                          ? "All Recipes"
                          : "${exploreController.origin} Recipes",
                      size: 18,
                      isBold: true,
                    ),
                    if (exploreController.origin != null)
                      GestureDetector(
                        onTap: () {
                          searchController.clear();
                          exploreController.clearFilters();
                        },
                        child: commonText(
                          "Clear filter",
                          size: 14,
                          isBold: true,
                          haveUnderline: true,
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 12),

                // Recipe cards horizontal scroll
                Wrap(
                  alignment: WrapAlignment.center,
                  children: List.generate(exploreController.allRecipes.length, (
                    index,
                  ) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: RecipeCard(
                          imageUrl: exploreController.allRecipes[index].image,
                          region: exploreController.allRecipes[index].origin,
                          title: exploreController.allRecipes[index].recipeName,
                          time:
                              exploreController.allRecipes[index].estimateTime,
                          difficulty:
                              exploreController
                                  .allRecipes[index]
                                  .difficultyLevel,
                          isFavorite:
                              exploreController.allRecipes[index].isFavorite,
                          onFavoriteTap: () {
                            Get.put(FavoriteRecipeController()).addRecipeToFavorites(exploreController
                                  .allRecipes[index].id,exploreController
                                  .allRecipes[index].isFavorite).then((value) {
                if(value){
                      setState(() {
                exploreController
                                  .allRecipes[index].isFavorite =!exploreController
                                  .allRecipes[index].isFavorite  ;
              });
                }
              },);
                          },
                          onTap: () {
                            navigateToPage(
                              RecipeDetailsView(
                                id: exploreController.allRecipes[index].id,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      }),
    );
  }
}
