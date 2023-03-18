// ignore: prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/main_menu_pages/main_menu_page.dart';

// ignore: prefer_const_literals_to_create_immutables

class SurveyPageOne extends StatefulWidget {
  SurveyPageOne({super.key});

  @override
  State<SurveyPageOne> createState() => _SurveyPageOneState();
}

class _SurveyPageOneState extends State<SurveyPageOne> {
  int radioGroupValue = 1;
  TextStyle radioBtnTextStyle = const TextStyle(
    fontSize: 20,
    fontFamily: "Roboto",
  );

  int question_index = 1;
  Map<String, dynamic> surveyQuestions = {};

  Future<void> getSurveyQuestionsFromFirestore() async {
    FirebaseFirestore database = FirebaseFirestore.instance;
    final collection = await database
        .collection('general_survey')
        .doc('hlBkeCpfqcyLTTjaPimn')
        .get();
    setState(() {
      surveyQuestions = collection.data() ?? {};
    });
    print(collection.data());
  }

  @override
  void initState() {
    super.initState();
    getSurveyQuestionsFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            height: 60,
            color: Colors.orangeAccent,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    surveyQuestions['survey_question_${question_index}'] ?? '',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                ],
              ),
            ),
          ),

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
                child: Image.asset(
                  'images/arrow_left.png',
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                  if (question_index < 4) {
                    setState(() {
                      question_index = ++question_index;
                    });
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MainMenuPage(),
                      ),
                    );
                  }
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
