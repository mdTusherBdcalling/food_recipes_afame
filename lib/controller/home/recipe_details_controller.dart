import 'dart:developer';
import 'package:food_recipes_afame/models/recipe_details_model.dart';
import 'package:get/get.dart';

import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';

class RecipeDetailController extends GetxController {
  RxBool isLoading = false.obs;
  Rxn<RecipeDetail> recipeDetail = Rxn<RecipeDetail>();
  RxString errorMessage = ''.obs;
  final String id;
  RecipeDetailController({required this.id});

  @override
  void onInit() {
    super.onInit();
    fetchRecipeDetail();
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
    } catch (e) {
      log("Error fetching recipe detail: $e");
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
