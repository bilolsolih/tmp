import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/category_detail/presentation/manager/category_detail_view_model.dart';

import 'recipe_app_bar_bottom_item.dart';

class RecipeAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBarBottom({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CategoryDetailViewModel>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          for (var category in vm.categories)
            RecipeAppBarBottomItem(
              title: category.title,
              callback: () => vm.selected = category,
              isSelected: category.id == vm.selected.id,
            ),
        ],
      ),
    );
  }
}
