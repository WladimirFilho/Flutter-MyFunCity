import 'package:flutter/cupertino.dart';

class FindOutTextBlockWidget extends StatelessWidget {
  final String title;
  final String content;

  const FindOutTextBlockWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: -1,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          content,
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
