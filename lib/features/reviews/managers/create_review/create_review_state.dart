import 'dart:io';

import 'package:equatable/equatable.dart';

enum CreateReviewStatus { idle, loading, error }

class CreateReviewState extends Equatable {
  final int? recipeId;
  final int? currentIndex;
  final CreateReviewStatus? status;
  final bool? doesRecommend;

  final File? pickedImage;

  const CreateReviewState({
    required this.recipeId,
    required this.currentIndex,
    required this.status,
    required this.pickedImage,
    required this.doesRecommend,
  });

  factory CreateReviewState.initial() {
    return CreateReviewState(
      recipeId: null,
      currentIndex: null,
      pickedImage: null,
      status: CreateReviewStatus.loading,
      doesRecommend: null,
    );
  }

  CreateReviewState copyWith({
    int? recipeId,
    int? currentIndex,
    CreateReviewStatus? status,
    File? pickedImage,
    bool? doesRecommend,
  }) {
    return CreateReviewState(
      recipeId: recipeId ?? this.recipeId,
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
      pickedImage: pickedImage ?? this.pickedImage,
      doesRecommend: doesRecommend ?? this.doesRecommend,
    );
  }

  @override
  List<Object?> get props => [recipeId, currentIndex, pickedImage, status, doesRecommend];
}
