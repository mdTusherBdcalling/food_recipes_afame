import 'package:flutter/material.dart';
import 'package:food_recipes_afame/view/HomePage/notifications_view.dart';
import 'package:food_recipes_afame/view/HomePage/recipe_details_view.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonDesigns.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  // Sample data with mutable isFavorite state
  final List<Map<String, dynamic>> trending = [
    {
      "title": "Healthy Taco Salad with fresh vegetable",
      "imageUrl": "https://via.placeholder.com/300x180.png?text=Taco+Salad",
      "author": "Olivia Rizka",
      "time": "12 Min",
      "isFavorite": false,
    },
    {
      "title": "Asian white with extra vegetables",
      "imageUrl": "https://via.placeholder.com/300x180.png?text=Asian+Veg",
      "author": "James",
      "time": "18 Min",
      "isFavorite": false,
    },
  ];

  final List<Map<String, dynamic>> recommended = List.generate(
    4,
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

  final List<Map<String, dynamic>> heritage = List.generate(
    4,
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSectionTitle("Trending This Week"),
                  const SizedBox(height: 12),
                  _buildTrendingList(),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Recommended For You"),
                  _buildRecipeGrid(recommended),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Popular From Your Heritage"),
                  _buildRecipeGrid(heritage),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        image: DecorationImage(
          image: AssetImage(ImagePaths.cardBg1),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(
                    "Hello, Wolfino!",
                    size: 22,
                    isBold: true,
                    color: Colors.black87,
                  ),
                  commonText(
                    "Let’s explore our recipes",
                    size: 14,
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to notifications
                  navigateToPage(
                    NotificationsView(
                      notifications: [
                        {
                          "message": "New recipe is available here!",
                          "time": "16 minutes ago",
                        },
                        {
                          "message": "New recipe is available here!",
                          "time": "16 minutes ago",
                        },
                        {
                          "message": "New recipe is available here!",
                          "time": "16 minutes ago",
                        },
                      ],
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade300,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.notifications_active,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          commonTextfieldWithTitle(
            '',
            TextEditingController(),
            hintText: "Search Recipe, cuisines...",
            assetIconPath: ImagePaths.searchIcon,
            borderWidth: 0.0,
            enable: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: commonText(title, size: 18, isBold: true),
    );
  }

  Widget _buildTrendingList() {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: trending.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = trending[index];
          return Stack(
            children: [
              Image.asset(ImagePaths.cardBackground),
              Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          commonText(
                            item['title'],
                            size: 16,
                            fontWeight: FontWeight.w500,
                            maxline: 2,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundImage: NetworkImage(
                                  "https://randomuser.me/api/portraits/women/65.jpg",
                                ),
                              ),
                              const SizedBox(width: 8),
                              commonText(
                                item['author'],
                                size: 14,
                                color: Colors.black87,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.schedule, size: 16),
                        const SizedBox(width: 4),
                        commonText(item['time'], size: 14),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRecipeGrid(List<Map<String, dynamic>> data) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final item = data[index];

        return Padding(
          padding: const EdgeInsets.all(8),
          child: RecipeCard(
            imageUrl: item['imageUrl'],
            region: item['region'],
            title: item['title'],
            time: item['time'],
            difficulty: item['difficulty'],
            isFavorite: item['isFavorite'],
            onFavoriteTap: () {
              setState(() {
                data[index]['isFavorite'] = !data[index]['isFavorite'];
              });
            },
            onTap: () {
              navigateToPage(const RecipeDetailsView());
            },
          ),
        );
      },
    );
  }
}
