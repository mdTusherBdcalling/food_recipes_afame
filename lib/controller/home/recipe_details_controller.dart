import 'dart:developer';
import 'package:food_recipes_afame/models/expolore/region_model.dart';
import 'package:food_recipes_afame/models/recipe_details_model.dart';
import 'package:food_recipes_afame/models/recipi_model.dart';
import 'package:get/get.dart';

import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';

class RecipeDetailController extends GetxController {
  RxBool isLoading = false.obs;
  Rxn<RecipeDetail> recipeDetail = Rxn<RecipeDetail>();
  RxString errorMessage = ''.obs;
  final String id;
  RecipeDetailController({required this.id});
    RxList<RecipeModel> relatedRecipes = <RecipeModel>[].obs;
    // Use region image if available, fallback to static image
RxString imageUrl="".obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecipeDetail();
    fetchRegions();
  }

  Future<void> fetchRecipeDetail() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final url = ApiEndpoints.singleRecipe(id); // Make sure this exists
      log("Fetching recipe: $url");

      final response = await ApiService().get(url);
      final data = RecipeDetailModel.fromJson(response);

      recipeDetail.value = data.data;
      if(data.data.recipeName.isNotEmpty){
        fetchRecipes(data.data.recipeName);
      }
    } catch (e) {
      log("Error fetching recipe detail: $e");
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> fetchRecipes(String searchTrem) async {
    isLoading.value = true;
    try {
      final response = await ApiService().get(
        ApiEndpoints.allRecipes(
          searchTerm: searchTrem,
        ),
      );

      final resultList = response['data']['result'] as List;
      relatedRecipes.value =
          resultList.map((e) => RecipeModel.fromJson(e)).toList();
    } catch (e) {
      print("Error fetching recipes: $e");
    } finally {
      isLoading.value = false;
    }
  }


  RxList<Region> allRegions = <Region>[].obs;

  Future<void> fetchRegions() async {
  

    try {
      final response = await ApiService().get(ApiEndpoints.getAllRegions);
      final resultList = response['data']['result'] as List;

      final regions = resultList.map((e) => Region.fromJson(e)).toList();
      allRegions.assignAll(regions);



final origin = recipeDetail.value?.origin.trim() ?? "";
final matchedRegion = allRegions.firstWhereOrNull(
  (region) { 
    
    return region.name.toLowerCase() == origin.toLowerCase();}

);
// Use region image if available, fallback to static image
 imageUrl.value = matchedRegion?.image??"";



    } catch (e) {
      print("Error fetching regions: $e");
    } 
  }


}
