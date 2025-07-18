import 'dart:developer';
import 'package:food_recipes_afame/models/subscription/my_subscription_model.dart';
import 'package:food_recipes_afame/services/local_storage_service.dart';
import 'package:get/get.dart';
import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';
import 'package:food_recipes_afame/models/profile/user_profile_model.dart';

class ProfileController extends GetxController {
  final ApiService _apiService = ApiService();
  RxBool isLoading = false.obs;
  Rxn<UserData> user = Rxn<UserData>();
  Rxn<MySubscriptionData> subscription = Rxn<MySubscriptionData>();

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
await LocalStorageService().saveName(profileModel.data.name);
      // Fetch subscription details
      final subResponse = await _apiService.get(ApiEndpoints.mySubscription);
      final subModel = MySubscriptionModel.fromJson(subResponse);
      subscription.value = subModel.data;
    } catch (e) {
      log("Error fetching profile or subscription: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
