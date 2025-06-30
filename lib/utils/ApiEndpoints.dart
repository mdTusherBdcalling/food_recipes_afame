class ApiEndpoints {
  static const String baseUrl =
      'http://10.0.50.2:8057/api/v1/'; // Replace with actual base URL
  static const String baseImageUrl =
      'http://10.0.50.2:8057'; // Replace with actual base image URL

  // Auth Endpoints
  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String verifyEmail = 'auth/verify_email';
  static const String forgotPassword = 'auth/forgot_password';
  static const String verifyOtp = 'auth/verify_otp';
  static const String resetPassword = 'auth/reset_password';
  static const String changePassword = 'auth/change_password';
  static const String resendOtp = 'auth/resend_otp';
  static const String socialLogin = 'auth/social_login';

  // User Endpoints
  static const String myProfile = 'users/my_profile';
  static const String allUsers = 'users/all_users';
  static const String updateProfile = 'users/update_profile';
  static const String completeProfile = 'users/complete_profile';
  static const String userActions =
      'users/actions'; // Append user ID dynamically

  // Payment Endpoints
  static const String paymentWebhook = 'payment/webhook';
  static const String paymentList = 'payment/payment_list';
  static const String earningStat = 'payment/earning_statistic';

  // Static Content Endpoints
  static const String staticContentCreate = 'static_content/create';
  static const String staticContent = 'static_content';

  // Subscription Endpoints
  static const String createSubscription = 'subscription/create';
  static const String getSubscriptions = 'subscription';
  static const String mySubscription = 'subscription/my_subscription';
  static const String singleSubscription =
      'subscription/'; // Append subscription ID dynamically
  static const String updateSubscription =
      'subscription/'; // Append subscription ID dynamically
  static const String deleteSubscription =
      'subscription/'; // Append subscription ID dynamically

  // Region Endpoints
  static const String createRegion = 'region/create';
  static const String getRegions = 'region';
  static const String getRegion = 'region/'; // Append region ID dynamically
  static const String updateRegion = 'region/'; // Append region ID dynamically
  static const String deleteRegion = 'region/'; // Append region ID dynamically

  // Category Endpoints
  static const String createCategory = 'category/create';
  static const String getCategories = 'category';
  static const String updateCategory =
      'category/'; // Append category ID dynamically
  static const String deleteCategory =
      'category/'; // Append category ID dynamically

  // Recipe Endpoints
  static const String createRecipe = 'recipe/create';
  static const String addToFavorite = 'recipe/add_favorite';
  static const String updateRecipe =
      'recipe/update/'; // Append recipe ID dynamically
  static String allRecipes({
    int? page,
    int? limit,
    String? searchTerm,
    String? origin,
  }) {
    final uri = Uri.parse("recipe").replace(
      queryParameters: {
        if (page != null) 'page': '$page',
        if (limit != null) 'limit': '$limit',
        if (searchTerm != null && searchTerm.isNotEmpty)
          'searchTerm': searchTerm,
        if (origin != null && origin.isNotEmpty) 'origin': origin,
      },
    );

    return uri.toString();
  }

  static const String singleRecipe = 'recipe/';
  static const String recipeTending = "recipe/tending";
  static const String recipeWithHeritage = 'recipe/recommended';
  static const String recommendedRecipe =
      'recipe?sort=-clickCount&page=1&limit=4';
  static const String myFavoriteRecipe = 'recipe/favorite';
  static const String removeFavorite = 'recipe/remove_favorite';
  static const String removeRecipe = 'recipe'; // Append recipe ID dynamically

  // Blog Endpoints
  static const String createBlog = 'blog/create';
  static const String getBlogs = 'blog';
  static const String updateBlog = 'blog/'; // Append blog ID dynamically
  static const String deleteBlog = 'blog/'; // Append blog ID dynamically
}
