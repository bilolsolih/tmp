import 'package:flutter/material.dart';
import 'package:recipe/data/models/onboarding_page_model.dart';
import 'package:recipe/data/repositories/onboarding_repositories.dart';


class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel({required OnboardingRepository repo}) : _repo = repo {
    load();
  }
  final controller = PageController();
  final OnboardingRepository _repo;

  List<OnboardingPageModel> pages = [];



  Future<void> load() async {
    pages = await _repo.fetchOnboardingPages();
    notifyListeners();
  }
}
