import 'package:flutter/widgets.dart';
import 'package:food_recipes_afame/models/blog/blog_model.dart';
import 'package:food_recipes_afame/services/api_service.dart';
import 'package:food_recipes_afame/utils/ApiEndpoints.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<BlogModel> blogs = <BlogModel>[].obs;

  int currentPage = 1;
  final int pageLimit = 10;
  bool hasMore = true;
  bool isFetchingMore = false;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchBlogs();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isFetchingMore &&
          hasMore) {
        isFetchingMore = true;
        fetchBlogs().then((_) => isFetchingMore = false);
      }
    });
  }

  Future<void> fetchBlogs() async {
    if (!hasMore || isLoading.value) return;
    isLoading.value = true;
    try {
      final response = await ApiService().get(
        ApiEndpoints.getBlogs(page: currentPage, limit: pageLimit),
      );

      final resultList = response['data']['result'] as List;

      if (resultList.isEmpty || resultList.length < pageLimit) {
        hasMore = false;
      }

      blogs.addAll(resultList.map((e) => BlogModel.fromJson(e)));
      currentPage++;
    } catch (e) {
      print("Error fetching blogs: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void resetAndFetch() {
    currentPage = 1;
    hasMore = true;
    blogs.clear();
    fetchBlogs();
  }
}
