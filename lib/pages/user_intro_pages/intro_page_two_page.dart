import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/user_intro_pages/intro_page_tree_page.dart';

import '../../constants/colors_constants.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'How does it',
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'LibreCaslonText',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1),
            ),
            Text(
              'Work?',
              style: TextStyle(
                fontSize: 50,
                color: orangeColor,
                fontWeight: FontWeight.w800,
                fontFamily: 'LibreCaslonText',
                height: 1,
                letterSpacing: 0.7,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose one of the citys\n features  and rate it \n accordingly:',
                    style: TextStyle(
                      fontSize: 22,
                      height: 1.5,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    './images/tutorial_images.png',
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => IntroPageTree(),
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
