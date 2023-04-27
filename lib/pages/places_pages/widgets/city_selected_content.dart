import 'package:flutter/cupertino.dart';

import '../bar_graph.dart';

class CitySelectedContent extends StatelessWidget {
  const CitySelectedContent({
    Key? key,
    this.feelingSummary = const [0, 0, 0, 0, 0],
    this.questionTitle = 'Question Title',
  }) : super(key: key);

  final List<double> feelingSummary;
  final String questionTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
          questionTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.2,
            letterSpacing: -1.0,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(
          height: 40,
        ),

        // Graphic
        SizedBox(
          height: 300,
          child: MyBarGraph(feelingsSummary: feelingSummary),
        ),

        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
