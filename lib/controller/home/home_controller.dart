import 'package:food_recipes_afame/models/recipi_model.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<RecipeModel> trendingRecipes = <RecipeModel>[].obs;
  RxList<RecipeModel> recommendedRecipes = <RecipeModel>[].obs;
  RxList<RecipeModel> heritageRecipes = <RecipeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllRecipes();
  }

  Future<void> fetchAllRecipes() async {
    isLoading.value = true;
    await Future.wait([
      fetchTrendingRecipes(),
      fetchRecommendedRecipes(),
      fetchHeritageRecipes(),
    ]);
    isLoading.value = false;
  }

  Future<void> fetchTrendingRecipes() async {
    try {
      final response = await ApiService().get(ApiEndpoints.recipeTending);
      final resultList = response['data']['result'] as List;
      trendingRecipes.assignAll(resultList.map((e) => RecipeModel.fromJson(e)));
    } catch (e) {
      print("Error fetching trending recipes: $e");
    }
  }

  Future<void> fetchRecommendedRecipes() async {
    try {
      final response = await ApiService().get(ApiEndpoints.recommendedRecipe);
      final resultList = response['data']['result'] as List;
      recommendedRecipes.assignAll(
        resultList.map((e) => RecipeModel.fromJson(e)),
      );
    } catch (e) {
      print("Error fetching recommended recipes: $e");
    }
  }

  Future<void> fetchHeritageRecipes() async {
    try {
      final response = await ApiService().get(ApiEndpoints.recipeWithHeritage);
      final resultList = response['data']['result'] as List;
      heritageRecipes.assignAll(resultList.map((e) => RecipeModel.fromJson(e)));
    } catch (e) {
      print("Error fetching heritage recipes: $e");
    }
  }
}
