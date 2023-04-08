import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/places_pages/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List feelingsSummary;

  const MyBarGraph({
    Key? key,
    required this.feelingsSummary,
  }) : super(key: key);

  Widget getBottomTitle(double value, TitleMeta meta) {
    Widget icon;

    switch (value.toInt()) {
      case 0:
        icon = Image.asset(
          'images/faces_vote_extremely_sad_on.png',
        );
        break;
      case 1:
        icon = Image.asset('images/faces_vote_unsatisfied_on.png');
        break;
      case 2:
        icon = Image.asset('images/faces_vote_neutral_on.png');
        break;
      case 3:
        icon = Image.asset('images/faces_vote_satisfied_on.png');
        break;
      case 4:
        icon = Image.asset('images/faces_vote_extremely_satisfied_on.png');
        break;
      default:
        icon = Image.asset('images/faces_vote_neutral_on.png');
    }

    return SideTitleWidget(child: Center(child: icon), axisSide: meta.axisSide);
  }

  @override
  Widget build(BuildContext context) {
    final myBarData = BarData(
      extremelyUnsatisfied: feelingsSummary[0],
      unsatisfied: feelingsSummary[1],
      neutral: feelingsSummary[2],
      satisfied: feelingsSummary[3],
      extremelySatisfied: feelingsSummary[4],
    )..initializeBarData();
    return BarChart(
      BarChartData(
        gridData: FlGridData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 40,
              showTitles: true,
              getTitlesWidget: getBottomTitle,
            ),
          ),
        ),
        maxY: 100,
        minY: 0,
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: Colors.orange[100],
                    ),
                    borderRadius: BorderRadius.circular(5),
                    width: 25,
                    toY: data.y,
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
