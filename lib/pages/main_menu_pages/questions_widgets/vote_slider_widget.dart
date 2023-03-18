import 'package:flutter/material.dart';

class SliderVoteWidget extends StatefulWidget {
  const SliderVoteWidget({super.key, required this.onPress});

  final Function(int) onPress;

  @override
  State<SliderVoteWidget> createState() => _SliderVoteWidgetState();
}

class _SliderVoteWidgetState extends State<SliderVoteWidget> {
  int index = -1;

  TextStyle lableStyle = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.onPress(0);
                  setState(() {
                    index = 0;
                  });
                },
                child: Image.asset(index == 0
                    ? "images/faces_vote_extremely_sad_on.png"
                    : "images/faces_vote_extremely_sad_off.png"),
              ),
              Expanded(
                child: Divider(
                  thickness: 6,
                  color: index >= 1
                      ? Color.fromARGB(255, 45, 143, 255)
                      : Color.fromARGB(255, 192, 192, 192),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.onPress(1);
                  setState(() {
                    index = 1;
                  });
                },
                child: Image.asset(index == 1
                    ? "images/faces_vote_unsatisfied_on.png"
                    : "images/faces_vote_unsatisfied_off.png"),
              ),
              Expanded(
                child: Divider(
                  thickness: 6,
                  color: index >= 2
                      ? Color.fromARGB(255, 45, 143, 255)
                      : Color.fromARGB(255, 192, 192, 192),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.onPress(2);
                  setState(() {
                    index = 2;
                  });
                },
                child: Image.asset(index == 2
                    ? "images/faces_vote_neutral_on.png"
                    : "images/faces_vote_neutral_off.png"),
              ),
              Expanded(
                child: Divider(
                  thickness: 6,
                  color: index >= 3
                      ? Color.fromARGB(255, 45, 143, 255)
                      : Color.fromARGB(255, 192, 192, 192),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.onPress(3);
                  setState(() {
                    index = 3;
                  });
                },
                child: Image.asset(index == 3
                    ? "images/faces_vote_satisfied_on.png"
                    : "images/faces_vote_satisfied_off.png"),
              ),
              Expanded(
                child: Divider(
                  thickness: 6,
                  color: index >= 4
                      ? Color.fromARGB(255, 45, 143, 255)
                      : Color.fromARGB(255, 192, 192, 192),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.onPress(4);
                  setState(() {
                    index = 4;
                  });
                },
                child: Image.asset(
                  index == 4
                      ? "images/faces_vote_extremely_satisfied_on.png"
                      : "images/faces_vote_extremely_satisfied_off.png",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Extremely\nunsatisfied',
                  textAlign: TextAlign.center,
                  style: lableStyle,
                ),
                Text(
                  'Unsatisfied',
                  textAlign: TextAlign.center,
                  style: lableStyle,
                ),
                Text(
                  'Neutral',
                  textAlign: TextAlign.center,
                  style: lableStyle,
                ),
                Text(
                  'Satisfied',
                  textAlign: TextAlign.center,
                  style: lableStyle,
                ),
                Text(
                  'Extremely\nSatisfied',
                  textAlign: TextAlign.center,
                  style: lableStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
