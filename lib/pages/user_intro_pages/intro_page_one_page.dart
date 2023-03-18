import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/user_intro_pages/intro_page_two_page.dart';

import '/constants/colors_constants.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
            height: 50,
          ),
        ],
      ),
      appBar: AppBar(
        leadingWidth: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          //main column
          child: Column(
            children: [
              // Title container
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text('What is',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'LibreCaslonText',
                          fontWeight: FontWeight.w600,
                          height: 1,
                        )),
                  ),
                  Text('MyFunCity',
                      style: TextStyle(
                          fontSize: 40,
                          color: orangeColor,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'LibreCaslonText',
                          height: 1)),
                ],
              ),
              SizedBox(height: 80),

              //Description container
              Container(
                child: const Text(
                  'At MyFunCity, we want to hear how you feel about your surroundings when visiting a city. Our app allows you to explore the ratings of a city and leave your own personal feedback when you visit it.',
                  style: TextStyle(
                      fontSize: 22,
                      height: 2,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),

              // Back Btn
            ],
          ),
        ),
      ),
    );
  }
}
