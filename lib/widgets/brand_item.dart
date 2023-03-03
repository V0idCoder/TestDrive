// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:testdrive/screens/home_page.dart';
import 'package:testdrive/screens/test.dart';

import '../screens/brand_quiz.dart';

class BrandItem extends StatefulWidget {
  const BrandItem({
    super.key,
    required this.idBrand,
    required this.strBrand,
    required this.linkBrand,
    required this.choice1,
    required this.choice2,
    required this.choice3,
    required this.choice4,
    required this.answer,
    required this.nextQuestion,
    required this.endGame,
  });

  final String idBrand;
  final String strBrand;
  final String linkBrand;
  final String choice1;
  final String choice2;
  final String choice3;
  final String choice4;
  final String answer;
  final Function() nextQuestion;
  final Function() endGame;

  @override
  State<BrandItem> createState() => _BrandItemState();
}

class _BrandItemState extends State<BrandItem> {
  //Bon ce n'est pas trés optimale mais "ça passe"
  bool pressed1 = false;
  bool pressed2 = false;
  bool pressed3 = false;
  bool pressed4 = false;

  //NextButton Icon
  Icon icon = const Icon(
    Icons.arrow_right_alt_rounded,
    color: Colors.white,
    size: 65.0,
  );

  Color trueBackgroundColor = Colors.green;
  Color falseBackgroundColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle confirmButtonStyle = ElevatedButton.styleFrom(
      // ignore: deprecated_member_use
      onPrimary: Colors.white,
      // ignore: deprecated_member_use
      primary: Colors.black,
      minimumSize: const Size(150, 70),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );

    return Center(
      child: (Column(
        children: [
          //Spacer
          const SizedBox(
            height: 25.0,
          ),
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
                        widget.linkBrand,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Spacer
          const SizedBox(
            height: 20.0,
          ),

          //ChoiceButton 1
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              backgroundColor: pressed1
                  ? (widget.answer == widget.choice1
                      ? trueBackgroundColor
                      : falseBackgroundColor)
                  : Colors.black,
              minimumSize: const Size(290, 64),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            child: Text(
              widget.choice1,
              style: const TextStyle(fontSize: 25),
            ),
            onPressed: () {
              setState(() {
                if (widget.choice1 == widget.answer) {
                  pressed1 = !pressed1;
                } else {
                  pressed1 = pressed1;
                }
              });
            },
          ),

          //Spacer
          const SizedBox(
            height: 20.0,
          ),

          //ChoiceButton 2
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              backgroundColor: pressed2 ? Colors.green : Colors.black,
              minimumSize: Size(290, 64),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            child: Text(
              widget.choice2,
              style: const TextStyle(fontSize: 25),
            ),
            onPressed: () {
              setState(
                () {
                  if (widget.choice2 == widget.answer) {
                    pressed2 = !pressed2;
                  } else {
                    pressed2 = pressed2;
                  }
                },
              );
            },
          ),

          //Spacer
          const SizedBox(
            height: 20.0,
          ),

          //ChoiceButton 3
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              backgroundColor: pressed3 ? Colors.green : Colors.black,
              minimumSize: Size(290, 64),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            child: Text(
              widget.choice3,
              style: const TextStyle(fontSize: 25),
            ),
            onPressed: () {
              setState(
                () {
                  if (widget.choice3 == widget.answer) {
                    pressed3 = !pressed3;
                  } else {
                    pressed3 = pressed3;
                  }
                },
              );
            },
          ),

          //Spacer
          const SizedBox(
            height: 20.0,
          ),

          //ChoiceButton 4
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              // ignore: deprecated_member_use
              onPrimary: Colors.white,
              backgroundColor: pressed4 ? Colors.green : Colors.black,
              minimumSize: const Size(290, 64),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            child: Text(
              widget.choice4,
              style: const TextStyle(fontSize: 25),
            ),
            onPressed: () {
              setState(
                () {
                  if (widget.choice4 == widget.answer) {
                    pressed4 = !pressed4;
                  } else {
                    pressed4 = pressed4;
                  }
                },
              );
            },
          ),

          //Spacer
          const SizedBox(
            height: 50.0,
          ),

          //NextButton -> Show the next question
          ElevatedButton(
            style: confirmButtonStyle,
            child: icon,
            onPressed: () {
              //Call the function next dans brand_quiz.dart pour passer à la question suivante
              pressed1 = false;
              pressed2 = false;
              pressed3 = false;
              pressed4 = false;
              widget.nextQuestion();
              widget.endGame();

              // Navigator.of(context).pushNamed(Test.routeName);
            },
          ),
        ],
      )),
    );
  }
}
