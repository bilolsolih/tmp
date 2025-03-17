import 'dart:io';

class CreateReviewModel {
  final int recipeId;
  final String comment;
  final int rating;
  final bool recommend;
  final File? photo;

  CreateReviewModel({
    required this.recipeId,
    required this.comment,
    required this.recommend,
    required this.rating,
    this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      "recipeId": recipeId,
      "comment": comment,
      "rating": rating,
      "recommend": recommend,
      "image": photo,
    };
  }
}
