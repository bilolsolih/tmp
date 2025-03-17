import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/common/widgets/recipe_text_button_container.dart';
import 'package:recipe/features/reviews/managers/create_review/create_review_bloc.dart';
import 'package:recipe/features/reviews/managers/create_review/create_review_state.dart';
import 'package:recipe/features/reviews/pages/create_review_recommend_section.dart';

class CreateReviewView extends StatelessWidget {
  const CreateReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(title: "Leave A Review", actions: null),
      body: ListView(
        padding: EdgeInsets.fromLTRB(36.w, 0, 36.w, 120.h),
        children: [
          BlocBuilder<CreateReviewBloc, CreateReviewState>(
            builder: (context, state) => Column(
              spacing: 3,
              children: [
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) {
                      return GestureDetector(
                        onTap: () => context.read<CreateReviewBloc>().add(CreateReviewRate(currentIndex: index)),
                        child: SizedBox(
                          width: 29,
                          height: 29,
                          child: SvgPicture.asset(
                            "assets/icons/star-${index <= (state.currentIndex ?? -1) ? 'filled' : 'empty'}.svg",
                            colorFilter: ColorFilter.mode(AppColors.redPinkMain, BlendMode.srcIn),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Your overall rating",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          TextField(
            minLines: 3,
            maxLines: 5,
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Leave us Review",
              hintStyle: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.45),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: AppColors.pink,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
          Row(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.pink,
                  padding: EdgeInsets.zero,
                ),
                color: AppColors.redPinkMain,
                onPressed: () async => context.read<CreateReviewBloc>().add(CreateReviewPickImage()),
                iconSize: 21,
                icon: Icon(Icons.add),
              ),
              Text("Add photo"),
            ],
          ),
          BlocBuilder<CreateReviewBloc, CreateReviewState>(
            builder: (context, state) {
              if (state.pickedImage != null) {
                return Image.file(state.pickedImage!);
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          CreateReviewRecommendSection(),
          RecipeTextButtonContainer(
            text: "Submit",
            textColor: AppColors.pinkSub,
            containerColor: AppColors.pink,
            callback: () {},
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
