import 'dart:math'; //Import utilisé pour le Random()
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/models_provider.dart';
import '../widgets/model_item.dart';
import 'end_brand_quiz.dart';

class ModelQuizScreen extends StatefulWidget {
  static const routeName = '/model_quiz';

  const ModelQuizScreen({super.key});

  @override
  State<ModelQuizScreen> createState() => _ModelQuizScreenState();
}

class _ModelQuizScreenState extends State<ModelQuizScreen> {
  bool _isInit = false;
  //Index du Random()
  int rndIndex = 0;
  //Nombre max des questions de brands.json
  int lengthModels = 0;

  int index = 0;

  @override
  Future<void> didChangeDependencies() async {
    if (!_isInit) {
      await Provider.of<ModelProvider>(context).fetchAndSetModels();
      _isInit = true;
    }
    super.didChangeDependencies();
  }

  //Fonction qui envoie la prochaine question
  void next() {
    setState(() {
      var rng = Random();
      rndIndex = rng.nextInt(lengthModels);
    });
  }

  void endGame() {
    setState(() {
      if (index > lengthModels) {
        Navigator.of(context).pushNamed(EndBrandQuiz.routeName);
        developer.log('EndGame');
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final models = Provider.of<ModelProvider>(context).categories;
    lengthModels = Provider.of<ModelProvider>(context).categories.length;

    //Call the Random() function
    var rnd = Random();
    //May Random() lenghts par rapport au nb de questions dans brands.js
    rndIndex = rnd.nextInt(lengthModels);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ModelItem(
          idModel: models[rndIndex].idModel,
          strModel: models[rndIndex].strModel,
          linkModel: models[rndIndex].linkModel,
          nextQuestion: next,
          endGame: endGame,
        ),
      ),
    );
  }
}
