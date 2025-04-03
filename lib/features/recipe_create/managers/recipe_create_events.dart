part of 'recipe_create_bloc.dart';

sealed class RecipeCreateEvent {}

final class RecipeCreateSubmit extends RecipeCreateEvent {}

final class RecipeCreateAddIngredient extends RecipeCreateEvent {}

