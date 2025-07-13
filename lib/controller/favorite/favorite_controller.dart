import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/models/recipi_model.dart';
import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';

class FavoriteController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<RecipeModel> allRecipes = <RecipeModel>[].obs;

  final TextEditingController searchController = TextEditingController();

  String selectedDifficulty = 'All Difficulties';
  String selectedSort = 'Popular';

  final List<String> difficulties = [
    'All Difficulties',
    'Easy',
    'Medium',
    'Hard',
  ];
  final List<String> sortOptions = ['Popular', 'Newest'];

  @override
  void onInit() {
    super.onInit();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    isLoading.value = true;
    try {
      final response = await ApiService().get(
        ApiEndpoints.myFavoriteRecipe(
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
      allRecipes.value =
          resultList.map((e) => RecipeModel.fromJson(e)).toList();
    } catch (e) {
      print("Error fetching recipes: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void onDifficultyChanged(String value) {
    selectedDifficulty = value;
    fetchRecipes();
  }

  void onSortChanged(String value) {
    selectedSort = value;
    fetchRecipes();
  }

  void onSearchChanged() {
    fetchRecipes();
  }

  void toggleFavorite(int index) {
    final recipe = allRecipes[index];
    recipe.isFavorite = !(recipe.isFavorite);
    allRecipes[index] = recipe;
  }
}
