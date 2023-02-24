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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/img/home/testdrive_logo.png',
            fit: BoxFit.cover),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: brands.length,
          itemBuilder: (context, index) => BrandItem(
            idBrand: brands[index].idBrand,
            strBrand: brands[index].strBrand,
            linkBrand: brands[index].linkBrand,
            choice1: brands[index].choice1,
            choice2: brands[index].choice2,
            choice3: brands[index].choice3,
            choice4: brands[index].choice4,
          ),
        ),
      ),
    );
  }
}
