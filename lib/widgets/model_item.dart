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

    late TextEditingController _controller;

    @override
    void initState() {
      super.initState();
      _controller = TextEditingController();
    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    return Center(
      child: (Column(
        children: [
          //Spacer
          const SizedBox(
            height: 50.0,
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

          const SizedBox(
            width: 360,
            child: TextField(
              //controller: _userAnswer,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Type the model\'s name here...',
              ),
            ),
          ),

          //Spacer
          const SizedBox(
            height: 50.0,
          ),

          ElevatedButton(
            style: confirmButtonStyle,
            child: icon,
            onPressed: () {
              //Call the function next dans model_quiz.dart pour passer à la question suivante
              widget.nextQuestion();
              widget.endGame();
              initState();
              dispose();
            },
          ),
        ],
      )),
    );
  }
}
