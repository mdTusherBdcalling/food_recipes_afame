import 'package:food_recipes_afame/models/home/tending_model.dart';
import 'package:food_recipes_afame/models/recipi_model.dart';
import 'package:food_recipes_afame/services/local_storage_service.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<RelatedRecipeItem> trendingRecipes = <RelatedRecipeItem>[].obs;
  RxList<RecipeModel> recommendedRecipes = <RecipeModel>[].obs;
  RxList<RecipeModel> heritageRecipes = <RecipeModel>[].obs;
RxString name="".obs;
  @override
  void onInit() {
    super.onInit();
    fetchAllRecipes();
    fetchTrendingRecipes();
    fetchHeritageRecipes();
    loadName();
  }


  Future<void> loadName() async {
    String? savedName = await LocalStorageService().getName();
    if (savedName != null) {
      name.value = savedName;
    } else {
      name.value = "User"; // Default value if no name is saved
    }
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
    final resultList = (response['data']['result'] as List<dynamic>)
        .map((e) => RelatedRecipeItem.fromJson(e))
        .toList();

    trendingRecipes.assignAll(resultList);
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
      final resultList = response['data'] as List;
      heritageRecipes.assignAll(resultList.map((e) => RecipeModel.fromJson(e)));


    } catch (e) {
      print("Error fetching heritage recipes: $e");
    }
  }





}
