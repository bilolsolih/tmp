import 'package:flutter/material.dart';
import 'package:recipe/features/category_detail/data/models/recipe_model.dart';
import 'package:recipe/features/category_detail/presentation/widgets/recipe_item/recipe_item_image.dart';
import 'package:recipe/features/category_detail/presentation/widgets/recipe_item/recipe_item_info.dart';
import 'package:recipe/features/common/common.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 169,
        height: 226,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            RecipeItemInfo(recipe: recipe),
            RecipeItemImage(recipe: recipe),
            Positioned(
              top: 7,
              right: 8,
              child: RecipeIconButtonContainer(
                image: "assets/icons/heart.svg",
                callback: () {},
                iconWidth: 16,
                iconHeight: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
