import 'package:flutter/material.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonDesigns.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  bool isEmpty = false; // toggle to false to show favorites grid

  final TextEditingController searchController = TextEditingController();

  String selectedDifficulty = 'All Difficulties';
  String selectedSort = 'Popular';

  final List<String> difficulties = [
    'All Difficulties',
    'Easy',
    'Medium',
    'Hard',
  ];
  final List<String> sortOptions = ['Popular', 'Newest', 'Rating'];

  final List<Map<String, dynamic>> favoriteRecipes = List.generate(
    6,
    (index) => {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Italy",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Search bar
              commonTextfieldWithTitle(
                '',
                searchController,
                hintText: "Search your favorite recipes...",

                assetIconPath: ImagePaths.searchIcon,
                borderWidth: 0.0,
                enable: true,
              ),

              const SizedBox(height: 12),

              // Filters row
              Row(
                children: [
                  Expanded(
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(16),
                      child: commonDropdown<String>(
                        items: difficulties,
                        value: selectedDifficulty,
                        hint: "All Difficulties",
                        onChanged: (val) {
                          if (val != null)
                            setState(() => selectedDifficulty = val);
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
                        items: sortOptions,
                        value: selectedSort,
                        hint: "Sort By",
                        onChanged: (val) {
                          if (val != null) setState(() => selectedSort = val);
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Show empty or grid
              Expanded(
                child: isEmpty ? _buildEmptyState() : _buildFavoritesGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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

  Widget _buildFavoritesGrid() {
    return GridView.builder(
      itemCount: favoriteRecipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 28,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final item = favoriteRecipes[index];
        return RecipeCard(
          imageUrl: item['imageUrl'],
          region: item['region'],
          title: item['title'],
          time: item['time'],
          difficulty: item['difficulty'],
          isFavorite: true,
          onFavoriteTap: () {
            // TODO: Handle unfavorite
          },
          onTap: () {
            // TODO: Navigate to recipe detail
          },
        );
      },
    );
  }
}
