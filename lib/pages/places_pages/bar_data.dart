import 'package:myfuncitynew/pages/places_pages/individual_bar.dart';

class BarData {
  final double extremelyUnsatisfied;
  final double unsatisfied;
  final double neutral;
  final double satisfied;
  final double extremelySatisfied;

  BarData({
    required this.extremelyUnsatisfied,
    required this.unsatisfied,
    required this.neutral,
    required this.satisfied,
    required this.extremelySatisfied,
  });

  List<IndividualBar> barData = [];

  // initialize bar data
  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: extremelyUnsatisfied),
      IndividualBar(x: 1, y: unsatisfied),
      IndividualBar(x: 2, y: neutral),
      IndividualBar(x: 3, y: satisfied),
      IndividualBar(x: 4, y: extremelySatisfied),
    ];
  }
}
