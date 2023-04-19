import 'package:flutter/cupertino.dart';

import '../bar_graph.dart';

class CitySelectedContent extends StatelessWidget {
  const CitySelectedContent({
    Key? key,
    this.feelingSummary = const [0, 0, 0, 0, 0],
    this.questionTitle = 'Question Title',
    this.questionContent = 'Content Content Content Content Content '
  }) : super(key: key);

  final List<double> feelingSummary;
  final String questionTitle;
  final String questionContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        // Picture hero
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'images/menu_hero_morning_time_friendly.png',
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          questionTitle,
          style: TextStyle(
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

        // Section Description
        Text(questionContent),
      ],
    );
  }
}
