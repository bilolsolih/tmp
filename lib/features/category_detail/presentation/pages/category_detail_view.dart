import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe/features/category_detail/presentation/manager/category_detail_view_model.dart';
import 'package:recipe/features/category_detail/presentation/pages/category_detail_view_body.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/presentation/widgets/recipe_app_bar_bottom.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CategoryDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: vm.selected.title,
          actions: [
            RecipeIconButtonContainer(
              image: "assets/icons/notification.svg",
              iconWidth: 14,
              iconHeight: 19,
              callback: () {},
            ),
            SizedBox(width: 5),
            RecipeIconButtonContainer(
              image: "assets/icons/search.svg",
              iconWidth: 12,
              iconHeight: 18,
              callback: () {},
            ),
          ],
          bottom: RecipeAppBarBottom()
        ),
        body: CategoryDetailViewBody(),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      );
    }
  }
}
