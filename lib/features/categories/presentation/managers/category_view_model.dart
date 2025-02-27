import 'package:flutter/material.dart';
import 'package:recipe/features/categories/data/models/category_model.dart';
import 'package:recipe/features/categories/data/repositories/category_repository.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required CategoryRepository catRepo}) : _catRepo = catRepo {
    load();
  }

  final CategoryRepository _catRepo;

  List<CategoryModel> categories = [];
  CategoryModel? mainCategory;

  Future<void> load() async {
    final allCategories = await _catRepo.fetchCategories();
    mainCategory = allCategories.firstWhere((category) => category.isMain);
    categories = allCategories.where((category)=> !category.isMain).toList();
    notifyListeners();
  }
}
