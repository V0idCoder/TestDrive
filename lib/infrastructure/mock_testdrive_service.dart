import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:testdrive/models/model.dart';

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

  Future<List<Model>> getModels() async {
    final modeldataString =
        await rootBundle.loadString('assets/data/models.json');
    final Map<String, dynamic> json = jsonDecode(modeldataString);

    if (json['models'] != null) {
      //Attention à controler vos données
      final models = <Model>[];
      json['models'].forEach((v) {
        models.add(Model.fromJson(v));
      });
      return models;
    }
    return [];
  }
}
