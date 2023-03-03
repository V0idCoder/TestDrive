import 'package:flutter/material.dart';

import '../screens/brand_quiz.dart';
import '../screens/model_quiz.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.idCategory,
    required this.strCategory,
    required this.linkCategory,
    required this.screen,
  });

  final String idCategory;
  final String strCategory;
  final String linkCategory;
  final String screen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: SizedBox(
            width: 360.0,
            height: 240.0,
            child: Stack(
              children: [
                SizedBox(
                  width: 360.0,
                  height: 240.0,
                  child: Card(
                    elevation: 2,
                    //margin: const EdgeInsets.(top: 10.0),
                    child: Image.network(
                      linkCategory,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // ignore: unrelated_type_equality_checks
                    if (idCategory == "1") {
                      Navigator.of(context).pushNamed(BrandQuizScreen.routeName,
                          arguments: idCategory);
                    } else {
                      Navigator.of(context).pushNamed(ModelQuizScreen.routeName,
                          arguments: idCategory);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
