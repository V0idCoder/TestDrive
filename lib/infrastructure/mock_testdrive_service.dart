import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/models.dart';

class MockTestDriveService {
  Future<List<Category>> getCategories() async {
    final categorydataString =
        await rootBundle.loadString('assets/data/categories.json');
    final Map<String, dynamic> json = jsonDecode(categorydataString);

    if (json['categories'] != null) {
      //Attention à controler vos données
      final categories = <Category>[];
      json['categories'].forEach((v) {
        categories.add(Category.fromJson(v));
      });
      return categories;
    }
    return [];
  }

  Future<List<Brand>> getBrands() async {
    final branddataString =
        await rootBundle.loadString('assets/data/brands.json');
    final Map<String, dynamic> json = jsonDecode(branddataString);

    if (json['brands'] != null) {
      //Attention à controler vos données
      final brands = <Brand>[];
      json['brands'].forEach((v) {
        brands.add(Brand.fromJson(v));
      });
      return brands;
    }
    return [];
  }
}
