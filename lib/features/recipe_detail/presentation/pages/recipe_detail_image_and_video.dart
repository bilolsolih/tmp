import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/recipe_detail/presentation/manager/recipe_detail_view_model.dart';
import 'package:recipe/features/recipe_detail/presentation/pages/recipe_detail_image.dart';
import 'package:recipe/features/recipe_detail/presentation/pages/recipe_detail_title_and_stats.dart';

class RecipeDetailImageAndVideo extends StatelessWidget {
  const RecipeDetailImageAndVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = context.select((RecipeDetailViewModel vm) => vm.recipe);
    return Center(
      child: SizedBox(
        width: 357,
        height: 337,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            RecipeDetailTitleAndStats(
              title: recipe.title,
              rating: recipe.rating,
              reviews: 2273,
            ),
            RecipeDetailImage(image: recipe.image),
          ],
        ),
      ),
    );
  }
}
