
import 'package:flutter/material.dart';
import 'package:food_recipes_afame/models/expolore/region_model.dart';
import 'package:food_recipes_afame/models/recipi_model.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../utils/ApiEndpoints.dart';

class ExploreController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<RecipeModel> allRecipes = <RecipeModel>[].obs;

  int currentPage = 1;
  final int pageLimit = 10;
  bool hasMore = true;

  String? searchTerm;
  String? origin;

  final ScrollController scrollController = ScrollController();

  // Region States
  RxBool isRegionLoading = false.obs;
  RxList<Region> allRegions = <Region>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRegions();
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
    hasMore = true;

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

  // REGION FETCH
  Future<void> fetchRegions() async {
    isRegionLoading.value = true;

    try {
      final response = await ApiService().get(ApiEndpoints.getAllRegions);
      final resultList = response['data']['result'] as List;

      final regions = resultList.map((e) => Region.fromJson(e)).toList();
      allRegions.assignAll(regions);
    } catch (e) {
      print("Error fetching regions: $e");
    } finally {
      isRegionLoading.value = false;
    }
  }
}
