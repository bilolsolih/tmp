import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';
import '../manager/complete_profile_view_model.dart';

class RecipeGenderField extends StatelessWidget {
  const RecipeGenderField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CompleteProfileViewModel>();
    return Column(
      spacing: 14,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () async {
            final result = await showModalBottomSheet<String?>(
              context: context,
              useRootNavigator: false,
              builder: (context) => Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop('Male'),
                      child: Text(
                        "Male",
                        style: TextStyle(
                          color: AppColors.redPinkMain,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop('Female'),
                      child: Text(
                        "Female",
                        style: TextStyle(
                          color: AppColors.redPinkMain,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

            vm.gender = result;
          },
          child: Container(
            width: double.infinity,
            height: 48,
            padding: EdgeInsets.only(left: 24),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              vm.gender == null ? "Male/Female" : vm.gender!,
              style: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: vm.gender == null ? 0.5 : 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
