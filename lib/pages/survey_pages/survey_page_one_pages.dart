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

  int survey_index = 1;
  Map<String, dynamic> surveyData = {};

  // Firebase Firestore
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> getSurveyDataFromFirestore() async {
    final collection = await database
        .collection('general_survey')
        .doc('hlBkeCpfqcyLTTjaPimn')
        .get();
    setState(() {
      surveyData = collection.data() ?? {};
    });
    print(collection.data());
  }

  @override
  void initState() {
    super.initState();
    getSurveyDataFromFirestore();
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
          SizedBox(
            height: 60,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 20),
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
                          surveyData['survey_question_${survey_index}'] ?? '',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ],
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
                              surveyData['survey_answers_${survey_index}'][0],
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
                              surveyData['survey_answers_${survey_index}'][1],
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
                              surveyData['survey_answers_${survey_index}'][2],
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
                              surveyData['survey_answers_${survey_index}'][3],
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
                              surveyData['survey_answers_${survey_index}'][4],
                              style: radioBtnTextStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: survey_index != 4,
                child: InkWell(
                  onTap: () {
                    if (survey_index > 1) {
                      setState(() {
                        survey_index = --survey_index;
                      });
                    }
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 50,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Visibility(
                visible: survey_index != 4,
                child: InkWell(
                  onTap: () {
                    if (survey_index < 4) {
                      setState(() {
                        survey_index = ++survey_index;
                      });
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MainMenuPage(),
                        ),
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 50,
                  ),
                ),
              ),
              Visibility(
                visible: survey_index == 4,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    side: BorderSide(
                      width: 3,
                      color: Colors.orange,
                    ),
                  ),
                  child: Text('Submit'),
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
