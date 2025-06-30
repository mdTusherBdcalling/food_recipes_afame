import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes_afame/models/recipi_model.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../utils/ApiEndpoints.dart';

class ExploreController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<RecipeModel> allRecipes = <RecipeModel>[].obs;

  int currentPage = 1;
  final int pageLimit = 4;
  bool hasMore = true;

  String? searchTerm;
  String? origin;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchAllRecipes();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isLoading.value &&
          hasMore) {
        currentPage++;
        fetchAllRecipes();
      }
    });
  }

  void applyFilters({String? search, String? difficulty, String? region}) {
    if (search != null) searchTerm = search;
    if (region != null) origin = region;

    resetPagination();
    fetchAllRecipes();
  }

  void clearFilters() {
    searchTerm = null;
    origin = null;

    resetPagination();
    fetchAllRecipes();
  }

  void resetPagination() {
    currentPage = 1;
    hasMore = true;
    allRecipes.clear();
  }

  Future<void> fetchAllRecipes() async {
    if (!hasMore) return;
    isLoading.value = true;

    try {
      final url = ApiEndpoints.allRecipes(
        page: currentPage,
        limit: pageLimit,
        searchTerm: searchTerm,
        origin: origin,
      );
      log(url + "..............................");
      final response = await ApiService().get(url);
      final resultList = response['data']['result'] as List;

      if (resultList.isEmpty || resultList.length < pageLimit) {
        hasMore = false;
      }

      final recipes = resultList.map((e) => RecipeModel.fromJson(e)).toList();
      allRecipes.addAll(recipes);
    } catch (e) {
      print("Error fetching recipes: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
