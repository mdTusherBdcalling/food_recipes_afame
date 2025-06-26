import 'package:flutter/material.dart';
import 'package:food_recipes_afame/models/profile/profile_update_model.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/services/api_service.dart';

import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  var isLoading = false.obs;

  Future<void> updateProfile() async {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) {
      commonSnackbar(
        title: 'Validation Error',
        message: 'All fields are required',
      );
      return;
    }

    isLoading.value = true;

    try {
      final response = await ApiService().patch(ApiEndpoints.updateProfile, {
        'name': name,
        'phone': phone,
      });

      final updatedProfile = ProfileUpdatedResponseModel.fromJson(response);

      commonSnackbar(
        title: "Success",
        message: updatedProfile.message,
        backgroundColor: Colors.green,
      );
      Get.back();
    } catch (e) {
      commonSnackbar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
