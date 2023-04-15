import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindOutTextBlockWidget extends StatelessWidget {
  final String title;
  final String content;
  final String image;

  const FindOutTextBlockWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
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
        ClipRRect(
          child: Image.network(image),
          borderRadius: BorderRadius.circular(15),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
