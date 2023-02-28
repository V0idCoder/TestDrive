import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/brands_provider.dart';
import '../widgets/brand_item.dart';

//import 'package:testdrive/testdrive_theme.dart';

class BrandQuizScreen extends StatefulWidget {
  static const routeName = '/brand_quiz';

  const BrandQuizScreen({super.key});

  @override
  State<BrandQuizScreen> createState() => _BrandQuizScreenState();
}

class _BrandQuizScreenState extends State<BrandQuizScreen> {
  bool _isInit = false;
  bool _isLoading = false;

  @override
  Future<void> didChangeDependencies() async {
    if (!_isInit) {
      _isLoading = true;
      await Provider.of<BrandProvider>(context).fetchAndSetBrands();
      setState(() {
        _isLoading = false;
      });
      _isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final brandId = ModalRoute.of(context)?.settings.arguments as String;
    final brands = Provider.of<BrandProvider>(context).categories;
    var rng = Random();
    int rndIndex = rng.nextInt(brands.length);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (_, index) => BrandItem(
            idBrand: brands[rndIndex].idBrand,
            strBrand: brands[rndIndex].strBrand,
            linkBrand: brands[rndIndex].linkBrand,
            choice1: brands[rndIndex].choice1,
            choice2: brands[rndIndex].choice2,
            choice3: brands[rndIndex].choice3,
            choice4: brands[rndIndex].choice4,
            answer: brands[rndIndex].answer,
          ),
        ),
      ),
    );
  }
}
