import 'package:flutter/material.dart';
import 'package:testdrive/models/model.dart';

import '../infrastructure/mock_testdrive_service.dart';
import '../models/models.dart';

class ModelProvider with ChangeNotifier {
  final List<Model> _models = [];
  int index = 0;

  Future<void> fetchAndSetModels() async {
    _models.clear();
    final mockTestDriveService = MockTestDriveService();
    final datas = await mockTestDriveService.getModels();
    _models.addAll(datas);
    notifyListeners();
  }

  Model findById(String idModel) {
    return categories.firstWhere((model) => model.idModel == idModel);
  }

  List<Model> get categories {
    return [..._models];
  }

  void SetIndex() {
    if (index < _models.length) {
      index++;
    }
    notifyListeners();
  }
}
