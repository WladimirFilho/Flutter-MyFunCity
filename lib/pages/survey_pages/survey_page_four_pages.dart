// ignore: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '/pages/main_menu_pages/main_menu_page.dart';

// ignore: prefer_const_literals_to_create_immutables

class SurveyPageFour extends StatefulWidget {
  SurveyPageFour({super.key});

  @override
  State<SurveyPageFour> createState() => _SurveyPageFourState();
}

class _SurveyPageFourState extends State<SurveyPageFour> {
  int radioGroupValue = 1;
  TextStyle radioBtnTextStyle = const TextStyle(
    fontSize: 20,
    fontFamily: "Roboto",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            height: 60,
            color: Color.fromARGB(255, 7, 86, 176),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "About 4 questions",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  const Text(
                    'and you are ready to go!',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Roboto",
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Where do you live?',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                ],
              ),
            ),
          ),

          //Radio list choise btn
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Radio(
                      activeColor: Color.fromARGB(255, 237, 147, 2),
                      value: 1,
                      groupValue: radioGroupValue,
                      onChanged: (_) {
                        setState(() {
                          radioGroupValue = 1;
                        });
                      },
                    ),
                    Text(
                      'Urban',
                      style: radioBtnTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Radio(
                        activeColor: Color.fromARGB(255, 237, 147, 2),
                        value: 2,
                        groupValue: radioGroupValue,
                        onChanged: (_) {
                          setState(() {
                            radioGroupValue = 2;
                          });
                        }),
                    Text(
                      'Urban',
                      style: radioBtnTextStyle,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Radio(
                        activeColor: Color.fromARGB(255, 237, 147, 2),
                        value: 3,
                        groupValue: radioGroupValue,
                        onChanged: (_) {
                          setState(() {
                            radioGroupValue = 3;
                          });
                        }),
                    Text(
                      'Urban',
                      style: radioBtnTextStyle,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Radio(
                        activeColor: Color.fromARGB(255, 237, 147, 2),
                        value: 4,
                        groupValue: radioGroupValue,
                        onChanged: (_) {
                          setState(() {
                            radioGroupValue = 4;
                          });
                        }),
                    Text(
                      'Urban',
                      style: radioBtnTextStyle,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Radio(
                        activeColor: Color.fromARGB(255, 237, 147, 2),
                        value: 5,
                        groupValue: radioGroupValue,
                        onChanged: (_) {
                          setState(() {
                            radioGroupValue = 5;
                          });
                        }),
                    Text(
                      'Urban',
                      style: radioBtnTextStyle,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 40),

          // Back and foward buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'images/arrow_left.png',
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MainMenuPage(),
                    ),
                  );
                },
                child: Image.asset('images/arrow_rigth.png'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
