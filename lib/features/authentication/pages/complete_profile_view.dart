import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';
import '../../common/widgets/recipe_elevated_button.dart';
import '../manager/complete_profile_view_model.dart';
import '../widgets/profile_photo_picker.dart';
import '../widgets/complete_profile_description.dart';
import '../widgets/recipe_bio_field.dart';
import '../widgets/recipe_gender_field.dart';

class CompleteProfileView extends StatelessWidget {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompleteProfileViewModel(authRepo: context.read()),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 48),
          children: [
            CompleteProfileDescription(),
            SizedBox(height: 44),
            ProfilePhotoPicker(),
            SizedBox(height: 14),
            RecipeGenderField(),
            SizedBox(height: 14),
            RecipeBioField(),
            SizedBox(height: 140),
            RecipeElevatedButton(
              text: "Continue",
              size: Size(207, 45),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              backgroundColor: AppColors.redPinkMain,
              foregroundColor: Colors.white,
              callback: () async {
                await context.read<CompleteProfileViewModel>().completeProfile();
              },
            ),
          ],
        ),
      ),
    );
  }
}
