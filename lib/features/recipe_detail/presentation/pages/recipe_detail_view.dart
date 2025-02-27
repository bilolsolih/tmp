import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/recipe_detail/presentation/manager/recipe_detail_view_model.dart';
import 'package:recipe/features/recipe_detail/presentation/pages/recipe_detail_image_and_video.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: vm.recipe.title,
          actions: [
            RecipeIconButtonContainer(
              image: "assets/icons/heart.svg",
              iconWidth: 16,
              iconHeight: 15,
              callback: () {},
            ),
            SizedBox(width: 5),
            RecipeIconButtonContainer(
              image: "assets/icons/share.svg",
              iconWidth: 12,
              iconHeight: 18,
              callback: () {},
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  RecipeDetailImageAndVideo(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      );
    }
  }
}
