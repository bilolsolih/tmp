import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/recipe_create/managers/recipe_create_bloc.dart';

class RecipeCreateIngredientItem extends StatelessWidget {
  const RecipeCreateIngredientItem({
    super.key,
    required this.callback,
    required this.amtController,
    required this.ingrController,
    required this.index,
  });

  final int index;
  final VoidCallback callback;
  final TextEditingController amtController, ingrController;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReorderableDragStartListener(
          index: index,
          child: RecipeIconButton(
            image: 'assets/icons/three_dots.svg',
            size: const Size(6, 28),
            callback: () {},
          ),
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            controller: amtController,
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Amt",
              hintStyle: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.45),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              filled: true,
              fillColor: AppColors.pink,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            controller: ingrController,
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Ingredient...",
              hintStyle: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.45),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              filled: true,
              fillColor: AppColors.pink,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        ),
        RecipeIconButtonContainer(
          image: 'assets/icons/bin.svg',
          callback: callback,
          iconWidth: 30,
          iconHeight: 30,
          containerHeight: 56,
          containerWidth: 56,
        ),
      ],
    );
  }
}
