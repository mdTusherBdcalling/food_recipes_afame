import 'package:flutter/material.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonDesigns.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                commonButton(
                  "  Create Recipe",
                  color: Colors.transparent,
                  textColor: AppColors.black,
                  boarderRadious: 16,
                  iconWidget: Icon(Icons.add),
                  boarder: Border.all(width: 2, color: AppColors.primary),
                ),
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
                _buildFavoritesGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFavoritesGrid() {
    return GridView.builder(
      itemCount: favoriteRecipes.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
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
