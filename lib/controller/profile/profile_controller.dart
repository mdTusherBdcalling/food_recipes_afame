import 'dart:developer';
import 'package:food_recipes_afame/models/subscription/subscription_model.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';
import 'package:food_recipes_afame/models/profile/user_profile_model.dart';

class ProfileController extends GetxController {
  final ApiService _apiService = ApiService();
  RxBool isLoading = false.obs;
  Rxn<UserData> user = Rxn<UserData>();
  Rxn<SubscriptionData> subscription = Rxn<SubscriptionData>();

  @override
  void onInit() {
    fetchUserProfile();
    super.onInit();
  }

  Future<void> fetchUserProfile() async {
    isLoading.value = true;
    try {
      final profileResponse = await _apiService.get(ApiEndpoints.myProfile);
      final profileModel = UserProfileModel.fromJson(profileResponse);
      user.value = profileModel.data;

      // Fetch subscription details
      final subResponse = await _apiService.get(ApiEndpoints.mySubscription);
      final subModel = SubscriptionModel.fromJson(subResponse);
      subscription.value = subModel.data;
    } catch (e) {
      log("Error fetching profile or subscription: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
