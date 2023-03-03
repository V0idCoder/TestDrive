import 'package:flutter/material.dart';

import '../infrastructure/mock_testdrive_service.dart';
import '../models/brand.dart';

class BrandProvider with ChangeNotifier {
  final List<Brand> _brands = [];
  int index = 0;

  Future<void> fetchAndSetBrands() async {
    _brands.clear();
    final mockTestDriveService = MockTestDriveService();
    final datas = await mockTestDriveService.getBrands();
    _brands.addAll(datas);
    notifyListeners();
  }

  Brand findById(String idBrand) {
    return brands.firstWhere((brand) => brand.idBrand == idBrand);
  }

  List<Brand> get brands {
    return [..._brands];
  }
}
