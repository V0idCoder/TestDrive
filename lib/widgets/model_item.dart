import 'dart:developer' as developer;

import 'package:flutter/material.dart';

class ModelItem extends StatefulWidget {
  const ModelItem({
    super.key,
    required this.idModel,
    required this.strModel,
    required this.linkModel,
    required this.nextQuestion,
    required this.endGame,
  });

  final String idModel;
  final String strModel;
  final String linkModel;

  final Function() nextQuestion;
  final Function() endGame;

  @override
  State<ModelItem> createState() => _ModelItemState();
}

class _ModelItemState extends State<ModelItem> {
  @override
  Widget build(BuildContext context) {
    Icon icon = const Icon(
      Icons.arrow_right_alt_rounded,
      color: Colors.white,
      size: 65.0,
    );

    final ButtonStyle confirmButtonStyle = ElevatedButton.styleFrom(
      // ignore: deprecated_member_use
      onPrimary: Colors.white,
      // ignore: deprecated_member_use
      primary: Colors.black,
      minimumSize: const Size(120, 50),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );

    var answer = widget.strModel;

    TextEditingController userAnswer = TextEditingController();

    return Center(
      child: (Column(
        children: [
          //Spacer
          const SizedBox(
            height: 30.0,
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: SizedBox(
              width: 400.0,
              height: 240.0,
              child: Stack(
                children: [
                  SizedBox(
                    width: 400.0,
                    height: 240.0,
                    child: Card(
                      elevation: 2,
                      //margin: const EdgeInsets.(top: 10.0),
                      child: Image.network(
                        widget.linkModel,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 30.0,
          ),

          SizedBox(
            width: 360,
            child: TextFormField(
              controller: userAnswer,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Type the model\'s name here...',
              ),
              validator: ((userAnswer) {
                if (userAnswer != widget.strModel) {
                  return "false";
                }
                return null;
              }),
            ),
          ),

          //Spacer
          const SizedBox(
            height: 30.0,
          ),
          ListTile(
            leading: ElevatedButton(
              style: confirmButtonStyle,
              child: const Text('IDK'),
              onPressed: () {},
            ),
            trailing: ElevatedButton(
              style: confirmButtonStyle,
              child: icon,
              onPressed: () {
                userAnswer.clear();
                widget.nextQuestion();
                widget.endGame();
              },
            ),
          )

          // ElevatedButton(
          //   style: confirmButtonStyle,
          //   child: icon,
          //   onPressed: () {
          //     //Call the function next dans model_quiz.dart pour passer à la question suivante

          //     if (userAnswer == answer || userAnswer == ' ') {
          //       userAnswer.clear();
          //       widget.nextQuestion();
          //       widget.endGame();
          //     } else {
          //       developer.log('Faux');
          //     }
          //   },
          // ),
        ],
      )),
    );
  }
}
