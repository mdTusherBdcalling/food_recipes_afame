import 'dart:io';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:food_recipes_afame/services/local_storage_service.dart';
class CreateRecipeController extends GetxController {
  File? imageFile;
  File? musicFile;

  void setImage(File file) {
    imageFile = file;
    update();
  }

  void setMusic(File file) {
    musicFile = file;
    update();
  }

  Future<void> createRecipe({
    required String title,
    required String origin,
    required String description,
    required String background,
    required String difficulty,
    required int prepTime,
    required int cookTime,
    required List<Map<String, String>> ingredients,
    required List<String> instructions,
  }) async {
    try {
      final uri = Uri.parse('${ApiEndpoints.baseUrl}recipe/create');
      final token = await LocalStorageService().getToken();
      final request = http.MultipartRequest('POST', uri);

      request.headers['Authorization'] = 'Bearer $token';

      request.fields['recipeName'] = title;
      request.fields['estimateTime'] = '${prepTime + cookTime} minutes';
      request.fields['difficultyLevel'] = difficulty;
      request.fields['origin'] = origin;
      request.fields['description'] = description;
      request.fields['cultureBackground'] = background;
      request.fields['ingredients'] = ingredients
          .map((e) => '${e['quantity']} ${e['name']}')
          .join(', ');
      request.fields['instruction'] = instructions.join(', ');

      if (imageFile != null) {
        request.files.add(await http.MultipartFile.fromPath('image', imageFile!.path));
      }

      if (musicFile != null) {
        request.files.add(await http.MultipartFile.fromPath('music', musicFile!.path));
      }

      final streamed = await request.send();
      final response = await http.Response.fromStream(streamed);

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Recipe created successfully');
        Get.back();
      } else {
              Get.snackbar('Faild', 'Recipe created faild');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
