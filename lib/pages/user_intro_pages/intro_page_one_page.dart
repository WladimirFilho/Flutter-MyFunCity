import 'package:flutter/material.dart';

import '/constants/colors_constants.dart';
import 'intro_page_two_page.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Text(
              'What is',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'LibreCaslonText',
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
            Text(
              'MyFunCity',
              style: TextStyle(
                fontSize: 40,
                color: orangeColor,
                fontWeight: FontWeight.w800,
                fontFamily: 'LibreCaslonText',
                height: 1,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'At MyFunCity, we want to hear how you feel about your surroundings when visiting a city. Our app allows you to explore the ratings of a city and leave your own personal feedback when you visit it.',
                  maxLines: 10,
                  style: TextStyle(
                    fontSize: 22,
                    height: 2,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => IntroPageTwo(),
                  ),
                );
              },
              child: Image.asset(
                './images/back_arrow_intro_page.png',
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
