import 'package:food_recipes_afame/models/payment/punches_model.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';
import 'package:get/get.dart';

import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';


class SubscriptionPurchaseController extends GetxController {
  var isLoading = false.obs;
  var purchaseResponse = Rxn<SubscriptionPurchaseResponseModel>();

  Future<bool> purchaseSubscription(String subscriptionId) async {
    try {
      isLoading(true);
      final response = await ApiService().post(
        ApiEndpoints.purchaseFreeSubscription,
        {"subscriptionId": subscriptionId},
      );

      if (response['success'] == true) {
        final model = SubscriptionPurchaseResponseModel.fromJson(response);
        purchaseResponse.value = model;
        commonSnackbar(title: "Success",message:  model.message);
        return true;
      } else {
        commonSnackbar(title:  "Failed", message:  response['message'] ?? "Something went wrong");
        return false;
      }
    } catch (e) {
      commonSnackbar(title:  "Error",message:  e.toString());
      return false;
    } finally {
      isLoading(false);
    }
  }
}
