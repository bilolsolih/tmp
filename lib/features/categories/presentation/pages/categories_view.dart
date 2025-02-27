import 'package:flutter/material.dart';
import 'package:recipe/features/categories/presentation/managers/category_view_model.dart';
import 'package:recipe/features/common/common.dart';

import '../widgets/category_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.vm,
  });

  //
  final CategoriesViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => RefreshIndicator(
        onRefresh: vm.load,
        child: Scaffold(
          extendBody: true,
          appBar: RecipeAppBar(
            title: "Categories",
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
          ),
          body: CustomScrollView(
            slivers: [
              if (vm.mainCategory != null)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  sliver: SliverToBoxAdapter(
                    child: CategoryItem(category: vm.mainCategory!),
                  ),
                ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 36, right: 36, top: 16, bottom: 100),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: vm.categories.length,
                    (context, index) => CategoryItem(category: vm.categories[index]),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 172,
                    mainAxisSpacing: 8,
                    childAspectRatio: 172 / 160,
                    crossAxisSpacing: 39,
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: RecipeBottomNavigationBar(),
        ),
      ),
    );
  }
}
