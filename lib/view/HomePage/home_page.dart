import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/favorite/add_favorite_controller.dart';
import 'package:food_recipes_afame/controller/home/home_controller.dart';
import 'package:food_recipes_afame/models/recipi_model.dart';
import 'package:food_recipes_afame/view/HomePage/notifications_view.dart';
import 'package:food_recipes_afame/view/HomePage/recipe_details_view.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/root_view.dart';
import 'package:food_recipes_afame/view/shared/commonDesigns.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;



  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),

            Obx(() {
              if (homeController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (homeController.trendingRecipes.isNotEmpty)
                      _buildSectionTitle("Trending This Week"),
                       if (homeController.trendingRecipes.isNotEmpty)   const SizedBox(height: 12),
                        if (homeController.trendingRecipes.isNotEmpty)  _buildTrendingList(),
                        if (homeController.trendingRecipes.isNotEmpty)  const SizedBox(height: 24),
                    if (homeController.recommendedRecipes.isNotEmpty)
                      _buildSectionTitle("Recommended For You"),
                     if (homeController.recommendedRecipes.isNotEmpty)   _buildRecipeGrid(homeController.recommendedRecipes),
                      if (homeController.recommendedRecipes.isNotEmpty)  const SizedBox(height: 24),
                    if (homeController.heritageRecipes.isNotEmpty)
                      _buildSectionTitle("Popular From Your Heritage"),
                   if (homeController.heritageRecipes.isNotEmpty) _buildRecipeGrid(homeController.heritageRecipes),
                if (homeController.heritageRecipes.isNotEmpty)    const SizedBox(height: 80),
                  ],
                ),
              );
            }),
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
                  Obx(
                    () {
                      return commonText(
                        "Hello, ${homeController.name.value}",
                        size: 22,
                        isBold: true,
                        color: Colors.black87,
                      );
                    }
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
                    NotificationsView(),
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

          GestureDetector(
            onTap: () {
              RootView.currentIndex = 1;
              Get.offAll(RootView());
            },
            child: commonTextfieldWithTitle(
              '',
              TextEditingController(),
              hintText: "Search Recipe, cuisines...",
              assetIconPath: ImagePaths.searchIcon,
              borderWidth: 0.0,
              enable: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(children: [commonText(title, size: 18, isBold: true)]),
    );
  }

  Widget _buildTrendingList() {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: homeController.trendingRecipes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
        
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
                            homeController.trendingRecipes[index].recipeName,
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
                                  homeController.trendingRecipes[index].userImage,
                                ),
                              ),
                              const SizedBox(width: 8),
                              commonText(
                                homeController.trendingRecipes[index].userName,
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
                        commonText(homeController.trendingRecipes[index].estimateTime, size: 14),
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

  Widget _buildRecipeGrid(List<RecipeModel> data) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: RecipeCard(
            imageUrl: data[index].image,
            region: data[index].origin,
            title: data[index].recipeName,
            time: data[index].estimateTime,
            difficulty: data[index].difficultyLevel,
            isFavorite: data[index].isFavorite,
            onFavoriteTap: () {
              
              Get.put(FavoriteRecipeController()).addRecipeToFavorites(data[index].id,data[index].isFavorite).then((value) {
                if(value){
                      setState(() {
                data[index].isFavorite =!data[index].isFavorite  ;
              });
                }
              },);
              
          
            },
            onTap: () {
              navigateToPage(RecipeDetailsView(id: data[index].id));
            },
          ),
        );
      },
    );
  }
}
