import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeReviews extends StatelessWidget {
  const RecipeReviews({
    super.key,
    required this.reviews,
  });

  final int reviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        SvgPicture.asset("assets/icons/reviews.svg"),
        Text(
          reviews.toString(),
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
