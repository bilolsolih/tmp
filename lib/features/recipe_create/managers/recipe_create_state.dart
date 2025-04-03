import 'package:equatable/equatable.dart';

class RecipeCreateState extends Equatable {
  const RecipeCreateState({
    required this.ingredientsCount,
  });

  factory RecipeCreateState.initial() {
    return RecipeCreateState(ingredientsCount: 1);
  }

  RecipeCreateState copyWith({int? ingredientsCount}) {
    return RecipeCreateState(
      ingredientsCount: ingredientsCount ?? this.ingredientsCount,
    );
  }

  final int ingredientsCount;

  @override
  List<Object?> get props => [ingredientsCount];
}
