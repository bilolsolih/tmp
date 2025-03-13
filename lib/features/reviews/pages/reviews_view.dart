import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/reviews/managers/reviews_bloc.dart';
import 'package:recipe/features/reviews/managers/reviews_state.dart';
import 'package:recipe/features/reviews/pages/reviews_recipe_item.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(title: "Reviews", actions: null),
      body: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, state) {
          return switch (state.status) {
            ReviewsStatus.loading => Center(child: CircularProgressIndicator()),
            ReviewsStatus.error =>
              Center(child: Text("Something went wrong...")),
            ReviewsStatus.idle => ListView(
                padding: EdgeInsets.only(bottom: 100),
                children: [
                  ReviewsRecipeItem(recipe: state.recipeModel!),
                ],
              ),
          };
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
