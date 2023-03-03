import 'dart:math'; //Import utilisé pour le Random()
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/brands_provider.dart';
import '../widgets/brand_item.dart';
import 'end_brand_quiz.dart';

class BrandQuizScreen extends StatefulWidget {
  static const routeName = '/brand_quiz';

  const BrandQuizScreen({super.key});

  @override
  State<BrandQuizScreen> createState() => _BrandQuizScreenState();
}

class _BrandQuizScreenState extends State<BrandQuizScreen> {
  bool _isInit = false;
  //Index du Random()
  int rndIndex = 0;
  //Nombre max des questions de brands.json
  int lengthBrands = 0;

  int index = 0;

  @override
  Future<void> didChangeDependencies() async {
    if (!_isInit) {
      await Provider.of<BrandProvider>(context).fetchAndSetBrands();
      _isInit = true;
    }
    super.didChangeDependencies();
  }

  //Fonction qui envoie la prochaine question
  void next() {
    setState(() {
      var rng = Random();
      rndIndex = rng.nextInt(lengthBrands);
    });
  }

  void endGame() {
    setState(() {
      if (index > lengthBrands) {
        Navigator.of(context).pushNamed(EndBrandQuiz.routeName);
        developer.log('EndGame');
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final brands = Provider.of<BrandProvider>(context).categories;
    lengthBrands = Provider.of<BrandProvider>(context).categories.length;

    //Call the Random() function
    var rnd = Random();
    //May Random() lenghts par rapport au nb de questions dans brands.js
    rndIndex = rnd.nextInt(lengthBrands);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BrandItem(
          idBrand: brands[rndIndex].idBrand,
          strBrand: brands[rndIndex].strBrand,
          linkBrand: brands[rndIndex].linkBrand,
          choice1: brands[rndIndex].choice1,
          choice2: brands[rndIndex].choice2,
          choice3: brands[rndIndex].choice3,
          choice4: brands[rndIndex].choice4,
          answer: brands[rndIndex].answer,
          nextQuestion: next,
          endGame: endGame,
        ),
      ),
    );
  }
}
