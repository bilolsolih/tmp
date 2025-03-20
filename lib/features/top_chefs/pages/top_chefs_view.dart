import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/common.dart';
import 'package:recipe/features/top_chefs/managers/top_chefs_bloc.dart';
import 'package:recipe/features/top_chefs/managers/top_chefs_state.dart';

class TopChefsView extends StatelessWidget {
  const TopChefsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Top Chef",
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            iconWidth: 14,
            iconHeight: 19,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            iconWidth: 12,
            iconHeight: 18,
            callback: () {},
          ),
        ],
      ),
      body: BlocBuilder<TopChefsBloc, TopChefsState>(
        builder:(context, state) =>   ListView(
          children: [
            Container(
              height: 285.h,
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
              decoration: BoxDecoration(
                color: AppColors.redPinkMain,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Most Viewed Chefs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      for (var chef in state.mostViewedChefs)
                        Image.network(chef.image, width: 100, height: 100, fit: BoxFit.cover),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 285.h,
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
              decoration: BoxDecoration(
                color: AppColors.redPinkMain,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Most Viewed Chefs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      for (var chef in state.mostLikedChefs)
                        Image.network(chef.image, width: 100, height: 100, fit: BoxFit.cover),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 285.h,
              padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
              decoration: BoxDecoration(
                color: AppColors.redPinkMain,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Most Viewed Chefs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      for (var chef in state.newChefs)
                        Image.network(chef.image, width: 100, height: 100, fit: BoxFit.cover),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
