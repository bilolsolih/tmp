class Routes {
  static const String home = '/home';
  static const String categories = '/categories';
  static const String categoryDetail = '/category-detail/:categoryId'; //categoryId pathParam bilan ham ko'rsatish
  static const String recipeDetail = '/recipe-detail/:recipeId'; // /recipe-detail/20
  static const String community = '/community';
  static const String reviews = '/reviews/:recipeId';

  static String getRecipeDetail(int recipeId) => '/recipe-detail/$recipeId';

  static String getCategoryDetail(int categoryId) => '/category-detail/$categoryId';
}
