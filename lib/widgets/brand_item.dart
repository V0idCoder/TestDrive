import 'package:flutter/material.dart';

import '../screens/brand_quiz.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
    required this.idBrand,
    required this.strBrand,
    required this.linkBrand,
    required this.choice1,
    required this.choice2,
    required this.choice3,
    required this.choice4,
  });

  final String idBrand;
  final String strBrand;
  final String linkBrand;
  final String choice1;
  final String choice2;
  final String choice3;
  final String choice4;

  @override
  Widget build(BuildContext context) {
    return Center(
      // children:[
      //   Container( i)
      // ];
      child: (Column(
        children: [
          Text(idBrand),
          Text(strBrand),
        ],
      )),
    );
  }
}
