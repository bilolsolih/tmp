import 'package:recipe/core/client.dart';
import 'package:recipe/features/category_detail/data/models/recipe_model.dart';
import 'package:recipe/features/recipe_detail/data/models/recipe_detail_model.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;

  Map<int, List<RecipeModel>> recipesByCategory = {};
  RecipeDetailModel? recipe;

  Future<List<RecipeModel>> fetchRecipesByCategory(int categoryId) async {
    if (recipesByCategory.containsKey(categoryId) && recipesByCategory[categoryId] != null){
      return recipesByCategory[categoryId]!;
    }

    var rawRecipes = await client.fetchRecipesByCategory(categoryId);
    final recipes = rawRecipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();
    recipesByCategory[categoryId] = recipes;
    return recipes;
  }

  Future<RecipeDetailModel> fetchRecipeById(int recipeId) async {
    final rawRecipe = await client.fetchRecipeById(recipeId);
    recipe = RecipeDetailModel.fromJson(rawRecipe);
    return recipe!;
  }
}