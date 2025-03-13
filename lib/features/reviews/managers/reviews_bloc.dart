import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/repositories/recipe_repository.dart';

import 'reviews_state.dart';

part 'reviews_events.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc({required RecipeRepository recipeRepo, required int recipeId})
      : _recipeRepo = recipeRepo,
        super(
          ReviewsState(
            recipeModel: null,
            status: ReviewsStatus.loading,
          ),
        ) {
    on<ReviewsLoading>(_onLoad);
    add(ReviewsLoading(recipeId: recipeId));
  }

  final RecipeRepository _recipeRepo;

  Future<void> _onLoad(ReviewsLoading event, Emitter<ReviewsState> emit) async {
    emit(state.copyWith(status: ReviewsStatus.loading));
    final recipe = await _recipeRepo.fetchRecipeForReviews(event.recipeId);
    emit(state.copyWith(recipeModel: recipe, status: ReviewsStatus.idle));
  }
}
