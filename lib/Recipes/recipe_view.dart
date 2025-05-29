import 'package:flutter/material.dart';
import 'package:food_recipes_afame/HomePage/recipe_details_view.dart';
import 'package:food_recipes_afame/Recipes/create_recipe_view.dart';
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
  bool isEmpty = false;

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

  final List<Map<String, dynamic>> allRecipes = [
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Italy",
      "title": "Moroccan Chicken Tagine",
      "time": "25 Min",
      "difficulty": "Easy",
      "isFavorite": false,
      "popularity": 10,
      "createdAt": DateTime.now().subtract(Duration(days: 1)),
      "rating": 4.0,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/urzj1d1587670726.jpg",
      "region": "France",
      "title": "Classic Ratatouille",
      "time": "40 Min",
      "difficulty": "Medium",
      "isFavorite": false,
      "popularity": 95,
      "createdAt": DateTime.now().subtract(Duration(days: 3)),
      "rating": 4.5,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Mexico",
      "title": "Spicy Chicken Enchiladas",
      "time": "35 Min",
      "difficulty": "Hard",
      "isFavorite": false,
      "popularity": 90,
      "createdAt": DateTime.now().subtract(Duration(days: 5)),
      "rating": 5.0,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/58oia61564916529.jpg",
      "region": "Thailand",
      "title": "Green Thai Curry",
      "time": "30 Min",
      "difficulty": "Easy",
      "isFavorite": false,
      "popularity": 85,
      "createdAt": DateTime.now().subtract(Duration(days: 7)),
      "rating": 4.0,
    },
    {
      "imageUrl": "https://www.themealdb.com/images/media/meals/1529444830.jpg",
      "region": "Japan",
      "title": "California Sushi Rolls",
      "time": "50 Min",
      "difficulty": "Medium",
      "isFavorite": false,
      "popularity": 80,
      "createdAt": DateTime.now().subtract(Duration(days: 9)),
      "rating": 4.5,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
      "region": "Italy",
      "title": "Spaghetti Carbonara",
      "time": "20 Min",
      "difficulty": "Hard",
      "isFavorite": false,
      "popularity": 75,
      "createdAt": DateTime.now().subtract(Duration(days: 11)),
      "rating": 5.0,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/urzj1d1587670726.jpg",
      "region": "Greece",
      "title": "Greek Salad",
      "time": "15 Min",
      "difficulty": "Easy",
      "isFavorite": false,
      "popularity": 72,
      "createdAt": DateTime.now().subtract(Duration(days: 13)),
      "rating": 4.2,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/ysxwuq1487323065.jpg",
      "region": "Morocco",
      "title": "Harira Soup",
      "time": "45 Min",
      "difficulty": "Medium",
      "isFavorite": false,
      "popularity": 70,
      "createdAt": DateTime.now().subtract(Duration(days: 15)),
      "rating": 4.6,
    },
    {
      "imageUrl": "https://www.themealdb.com/images/media/meals/1529445434.jpg",
      "region": "Spain",
      "title": "Paella",
      "time": "60 Min",
      "difficulty": "Hard",
      "isFavorite": false,
      "popularity": 68,
      "createdAt": DateTime.now().subtract(Duration(days: 17)),
      "rating": 5.0,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/uvuyxu1503067369.jpg",
      "region": "India",
      "title": "Butter Chicken",
      "time": "35 Min",
      "difficulty": "Medium",
      "isFavorite": false,
      "popularity": 65,
      "createdAt": DateTime.now().subtract(Duration(days: 19)),
      "rating": 4.7,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/qptpvt1487339892.jpg",
      "region": "USA",
      "title": "BBQ Ribs",
      "time": "50 Min",
      "difficulty": "Hard",
      "isFavorite": false,
      "popularity": 62,
      "createdAt": DateTime.now().subtract(Duration(days: 21)),
      "rating": 4.9,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/ysxwuq1487323065.jpg",
      "region": "Vietnam",
      "title": "Pho",
      "time": "30 Min",
      "difficulty": "Easy",
      "isFavorite": false,
      "popularity": 60,
      "createdAt": DateTime.now().subtract(Duration(days: 23)),
      "rating": 4.3,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/ysxwuq1487323065.jpg",
      "region": "China",
      "title": "Kung Pao Chicken",
      "time": "40 Min",
      "difficulty": "Medium",
      "isFavorite": false,
      "popularity": 58,
      "createdAt": DateTime.now().subtract(Duration(days: 25)),
      "rating": 4.4,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wrssvt1511556563.jpg",
      "region": "Brazil",
      "title": "Feijoada",
      "time": "55 Min",
      "difficulty": "Hard",
      "isFavorite": false,
      "popularity": 55,
      "createdAt": DateTime.now().subtract(Duration(days: 27)),
      "rating": 5.0,
    },
    {
      "imageUrl":
          "https://www.themealdb.com/images/media/meals/wrssvt1511556563.jpg",
      "region": "Germany",
      "title": "Sauerbraten",
      "time": "90 Min",
      "difficulty": "Medium",
      "isFavorite": false,
      "popularity": 53,
      "createdAt": DateTime.now().subtract(Duration(days: 29)),
      "rating": 4.6,
    },
  ];

  late List<Map<String, dynamic>> favoriteRecipes;

  @override
  void initState() {
    super.initState();
    favoriteRecipes = List.from(allRecipes);
    applyFilters();
  }

  void applyFilters() {
    // Filter by difficulty and search text
    List<Map<String, dynamic>> filtered =
        allRecipes.where((recipe) {
          final matchesDifficulty =
              (selectedDifficulty == 'All Difficulties' ||
                  recipe['difficulty'] == selectedDifficulty);

          final matchesSearch =
              searchController.text.isEmpty ||
              recipe['title'].toString().toLowerCase().contains(
                searchController.text.toLowerCase(),
              );

          return matchesDifficulty && matchesSearch;
        }).toList();

    // Sort the filtered list
    switch (selectedSort) {
      case 'Popular':
        filtered.sort(
          (a, b) => (b['popularity'] as int).compareTo(a['popularity'] as int),
        );
        break;
      case 'Newest':
        filtered.sort(
          (a, b) => (b['createdAt'] as DateTime).compareTo(
            a['createdAt'] as DateTime,
          ),
        );
        break;
      case 'Rating':
        filtered.sort(
          (a, b) => (b['rating'] as double).compareTo(a['rating'] as double),
        );
        break;
    }

    setState(() {
      favoriteRecipes = filtered;
    });
  }

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
                  onTap: () {
                    navigateToPage(CreateRecipeView());
                  },
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
                            if (val != null) {
                              setState(() {
                                selectedDifficulty = val;
                                applyFilters();
                              });
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
                          items: sortOptions,
                          value: selectedSort,
                          hint: "Sort By",
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                selectedSort = val;
                                applyFilters();
                              });
                            }
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
          isFavorite: item['isFavorite'],
          onFavoriteTap: () {
            setState(() {
              favoriteRecipes[index]['isFavorite'] =
                  !favoriteRecipes[index]['isFavorite'];
            });
          },
          onTap: () {
            navigateToPage(const RecipeDetailsView());
          },
        );
      },
    );
  }
}
