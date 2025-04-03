import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/auth_repository.dart';

class CompleteProfileViewModel extends ChangeNotifier {
  CompleteProfileViewModel({
    required AuthRepository authRepo,
  }) : _authRepo = authRepo;

  final AuthRepository _authRepo;
  final bioController = TextEditingController();
  File? profilePhoto;
  String? _gender;

  String? get gender => _gender;

  set gender(String? value) {
    _gender = value;
    notifyListeners();
  }

  Future pickProfilePhoto() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profilePhoto = File(image.path);
    }
    notifyListeners();
  }

  Future<bool> completeProfile() async {
    if (profilePhoto != null) {
      final result = await _authRepo.uploadProfilePhoto(profilePhoto!);
      return result;
    }


    return true;
  }
}
