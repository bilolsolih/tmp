import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/recipe_create/managers/recipe_create_state.dart';

part 'recipe_create_events.dart';

class RecipeCreateBloc extends Bloc<RecipeCreateEvent, RecipeCreateState> {
  RecipeCreateBloc() : super(RecipeCreateState.initial()) {
    on<RecipeCreateSubmit>(_onSubmit);
    on<RecipeCreateAddIngredient>(_onAddIngredient);
  }

  Future<void> _onSubmit(RecipeCreateSubmit event, Emitter<RecipeCreateState> emit) async {}

  Future<void> _onAddIngredient(RecipeCreateAddIngredient event, Emitter<RecipeCreateState> emit) async {
    emit(state.copyWith(ingredientsCount: state.ingredientsCount + 1));
  }
}
