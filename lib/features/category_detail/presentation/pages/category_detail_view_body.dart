import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/category_detail/data/models/recipe_model.dart';
import 'package:recipe/features/category_detail/presentation/manager/category_detail_view_model.dart';
import 'package:recipe/features/category_detail/presentation/widgets/recipe_item/recipe_item.dart';

class CategoryDetailViewBody extends StatelessWidget {
  const CategoryDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CategoryDetailViewModel>();
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        Animation<Offset> slideInAnimation = Tween<Offset>(
          begin: Offset(vm.right ? 1.0 : -1.0, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(animation);

        Animation<Offset> slideOutAnimation = Tween<Offset>(
          begin: Offset(vm.right ? -1.0 : 1.0, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(animation);

        if (child.key == ValueKey<List<RecipeModel>>(vm.recipes)) {
          return SlideTransition(position: slideInAnimation, child: child);
        } else {
          return SlideTransition(position: slideOutAnimation, child: child);
        }
      },
      child: GridView.builder(
        key: ValueKey<List<RecipeModel>>(vm.recipes),
        padding: EdgeInsets.fromLTRB(16, 36, 16, 120),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 226,
          mainAxisSpacing: 30,
        ),
        itemCount: vm.recipes.length,
        itemBuilder: (context, index) => RecipeItem(recipe: vm.recipes[index]),
      ),
    );
  }
}
