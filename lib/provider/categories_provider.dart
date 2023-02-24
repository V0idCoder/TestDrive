import 'package:flutter/material.dart';

import '../infrastructure/mock_testdrive_service.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier {
  final List<Category> _categories = [];

  Future<void> fetchAndSetCategories() async {
    _categories.clear();
    final mockTestDriveService = MockTestDriveService();
    final datas = await mockTestDriveService.getCategories();
    _categories.addAll(datas);
    notifyListeners();
  }

  Category findById(String idCategory) {
    return categories
        .firstWhere((category) => category.idCategory == idCategory);
  }

  List<Category> get categories {
    return [..._categories];
  }
}
