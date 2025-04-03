import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';
import '../manager/complete_profile_view_model.dart';

class ProfilePhotoPicker extends StatelessWidget {
  const ProfilePhotoPicker({super.key});

  @override
  Widget build(BuildContext context) {
    var profilePhoto = context.select((CompleteProfileViewModel vm) => vm.profilePhoto);

    return Center(
      child: SizedBox(
        width: 120,
        height: 120,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(color: AppColors.pink),
                child: profilePhoto != null
                    ? Image.file(
                        profilePhoto,
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: SvgPicture.asset(
                          "assets/icons/profile.svg",
                          width: 46,
                          height: 68,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(AppColors.redPinkMain, BlendMode.srcIn),
                        ),
                      ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () async {
                  await context.read<CompleteProfileViewModel>().pickProfilePhoto();
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.redPinkMain,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/edit.svg",
                      width: 16,
                      height: 17,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
