import 'package:flutter/material.dart';

class TitleSectionHeader extends StatelessWidget {
  final String title;

  const TitleSectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 33,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.1,
      ),
    );
  }
}
