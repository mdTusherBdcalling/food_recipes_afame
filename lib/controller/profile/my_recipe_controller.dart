import 'package:food_recipes_afame/models/profile/my_recipe_model.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/services/api_service.dart';

class MyRecipesController extends GetxController {
  var recipes = <RecipeItem>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyRecipes();
  }

  Future<void> fetchMyRecipes() async {
    try {
      isLoading(true);
      final response = await ApiService().get(ApiEndpoints.myRecipes);
      final data = MyRecipeData.fromJson(response['data']);
      recipes.assignAll(data.result);
    } catch (e) {
      Get.snackbar("Error", "Failed to load recipes");
    } finally {
      isLoading(false);
    }
  }
}
