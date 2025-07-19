import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/favorite/add_favorite_controller.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/models/recipi_model.dart';
import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';

class FavoriteController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<RecipeModel> allRecipes = <RecipeModel>[].obs;

  final TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  String selectedDifficulty = 'All Difficulties';
  String selectedSort = 'Popular';

  final List<String> difficulties = [
    'All Difficulties',
    'Easy',
    'Medium',
    'Hard',
  ];
  final List<String> sortOptions = ['Popular', 'Newest'];

  int currentPage = 1;
  final int pageLimit = 10;
  bool hasMore = true;


  @override
  void onInit() {
    super.onInit();
    fetchRecipes();
          scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isLoading.value &&
          hasMore) {
        currentPage++;
        fetchRecipes();
      }
    });
  }

  Future<void> fetchRecipes() async {
      if (!hasMore) return;
    isLoading.value = true;
    try {
      final response = await ApiService().get(
        ApiEndpoints.myFavoriteRecipe(
          limit: pageLimit,
          page: currentPage,
          searchTerm: searchController.text,
          difficultyLevel: selectedDifficulty == 'All Difficulties'
              ? null
              : selectedDifficulty,
          sort: selectedSort == 'Popular'
              ? '-clickCount'
              : selectedSort == 'Newest'
                  ? '-createdAt'
                  : null,
        ),
      );

      final resultList = response['data']['result'] as List;
              if (resultList.isEmpty || resultList.length < pageLimit) {
        hasMore = false;
      }
      allRecipes.addAll(
          resultList.map((e) => RecipeModel.fromJson(e)).toList());
    } catch (e) {
      print("Error fetching recipes: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void onDifficultyChanged(String value) {
    resetPagination();
    selectedDifficulty = value;
    fetchRecipes();
  }

  void onSortChanged(String value) {
    resetPagination();
    selectedSort = value;
    fetchRecipes();
  }

  void onSearchChanged() {
    resetPagination();
    fetchRecipes();
  }


      void resetPagination() {
    currentPage = 1;
    hasMore = true;
    allRecipes.clear();
  }

  void toggleFavorite(int index) {

  final recipe = allRecipes[index];

    Get.put(FavoriteRecipeController()).addRecipeToFavorites(recipe.id,recipe.isFavorite).then((value) {
               
    recipe.isFavorite = !(recipe.isFavorite);
    allRecipes[index] = recipe;                
    },);


  }
}
