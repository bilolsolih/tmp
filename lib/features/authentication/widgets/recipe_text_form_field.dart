import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class RecipeTextFormField extends StatelessWidget {
  RecipeTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.validator,
    required this.controller,
  });

  final String title, hintText;
  final String? Function(String? value) validator;
  final TextEditingController controller;
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 375.w,
            child: TextFormField(
              onTapOutside: (event) => focusNode.unfocus(),
              focusNode: focusNode,
              controller: controller,
              validator: validator,
              style: TextStyle(
                color: AppColors.beigeColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.pink,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.beigeColor.withValues(alpha: 0.45),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 36.w),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
