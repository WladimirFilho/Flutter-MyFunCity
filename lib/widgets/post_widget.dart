import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String name;
  final String postText;

  const PostWidget({
    Key? key,
    required this.name,
    required this.postText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.orange),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.account_circle_outlined,
                size: 30,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          postText,
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                color: Colors.orange,
                size: 30,
              );
            },
          ),
        ),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
