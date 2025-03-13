import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipe/data/models/recipe/reviews_recipe_model.dart';

enum ReviewsStatus { idle, loading, error }

@immutable
class ReviewsState extends Equatable {
  final ReviewsStatus status;
  final ReviewsRecipeModel? recipeModel;

  const ReviewsState({
    required this.recipeModel,
    required this.status,
  });

  ReviewsState copyWith({
    ReviewsRecipeModel? recipeModel,
    ReviewsStatus? status,
  }) {
    return ReviewsState(
      recipeModel: recipeModel ?? this.recipeModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [recipeModel, status];
}
