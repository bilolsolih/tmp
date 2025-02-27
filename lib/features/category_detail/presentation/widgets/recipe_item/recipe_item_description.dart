import 'package:flutter/material.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/category_detail/data/models/recipe_model.dart';

class RecipeItemDescription extends StatelessWidget {
  const RecipeItemDescription({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Text(
      recipe.description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColors.beigeColor,
        fontFamily: "League Spartan",
        fontSize: 13,
        fontWeight: FontWeight.w300,
        height: 1,
      ),
    );
  }
}
