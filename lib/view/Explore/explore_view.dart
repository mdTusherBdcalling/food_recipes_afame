import 'package:flutter/material.dart';
import 'package:food_recipes_afame/view/HomePage/recipe_details_view.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonDesigns.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> regions = [
    {
      'name': 'North America',
      'image': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    },
    {
      'name': 'Asia',
      'image': 'https://images.unsplash.com/photo-1501594907352-04cda38ebc29',
    },
    {
      'name': 'Latin America',
      'image': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    },
    {
      'name': 'Europe',
      'image': 'https://images.unsplash.com/photo-1467269204594-9661b134dd2b',
    },
    {
      'name': 'Middle East',
      'image': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    },
    {
      'name': 'Africa',
      'image': 'https://images.unsplash.com/photo-1467269204594-9661b134dd2b',
    },
  ];

  String? selectedRegion;

  final List<Map<String, dynamic>> recipes = [
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Middle East",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
      "isFavorite": false,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Europe",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
      "isFavorite": false,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Middle East",
      "title": "Asia",
      "time": "25 Min",
      "isFavorite": false,
      "difficulty": "Easy",
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Asia",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
      "isFavorite": false,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Middle East",
      "title": "Asia",
      "time": "25 Min",
      "difficulty": "Easy",
      "isFavorite": false,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Asia",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
      "isFavorite": false,
    },
  ];

  void clearFilter() {
    setState(() {
      selectedRegion = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredRecipes =
        selectedRegion == null
            ? recipes
            : recipes.where((r) => r['region'] == selectedRegion).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              commonTextfieldWithTitle(
                '',
                searchController,
                hintText: "Search cultures, regions, cuisine types...",

                assetIconPath: ImagePaths.searchIcon,

                enable: true,
              ),

              const SizedBox(height: 20),

              // Explore by Region Title
              commonText(
                "Explore by Region",
                size: 18,
                isBold: true,
                color: Colors.black87,
              ),

              const SizedBox(height: 12),

              // Regions Grid
              SizedBox(
                child: GridView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.7,
                  ),
                  itemCount: regions.length,
                  itemBuilder: (context, index) {
                    final region = regions[index];
                    final isSelected = selectedRegion == region['name'];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRegion = region['name'];
                        });
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              region['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              color: isSelected ? Colors.black : Colors.white38,

                              colorBlendMode: BlendMode.screen,
                            ),
                          ),
                          Center(
                            child: commonText(
                              region['name']!,
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

              const SizedBox(height: 20),

              // Middle East Recipes header with Clear filter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText(
                    selectedRegion == null
                        ? "All Recipes"
                        : "$selectedRegion Recipes",
                    size: 18,
                    isBold: true,
                  ),
                  if (selectedRegion != null)
                    GestureDetector(
                      onTap: clearFilter,
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
                children: List.generate(filteredRecipes.length, (index) {
                  final recipe = filteredRecipes[index];
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: RecipeCard(
                        imageUrl: recipe['imageUrl'],
                        region: recipe['region'],
                        title: recipe['title'],
                        time: recipe['time'],
                        difficulty: recipe['difficulty'],
                        isFavorite: recipe['isFavorite'],
                        onFavoriteTap: () {
                          setState(() {
                            filteredRecipes[index]['isFavorite'] =
                                !filteredRecipes[index]['isFavorite'];
                          });
                        },
                        onTap: () {
                          navigateToPage(const RecipeDetailsView());
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
      ),
    );
  }
}
