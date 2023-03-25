// ignore: prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/main_menu_pages/main_menu_page.dart';

import '../../firebase/auth/firebase_auth.dart';

// ignore: prefer_const_literals_to_create_immutables

class SurveyPageOne extends StatefulWidget {
  SurveyPageOne({super.key});

  @override
  State<SurveyPageOne> createState() => _SurveyPageOneState();
}

class _SurveyPageOneState extends State<SurveyPageOne> {
  int? radioGroupValue;
  TextStyle radioBtnTextStyle = const TextStyle(
    fontSize: 20,
    fontFamily: "Roboto",
  );

  int survey_index = 1;
  Map<String, dynamic> surveyData = {};
  Map<String, dynamic> surveyAnswer = {};
  bool isLoading = true;

  // Firebase Firestore
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> getSurveyDataFromFirestore() async {
    final collection =
        await database.collection('general_survey').doc('hlBkeCpfqcyLTTjaPimn').get();
    setState(() {
      isLoading = false;
      surveyData = collection.data() ?? {};
    });
  }

  @override
  void initState() {
    super.initState();
    getSurveyDataFromFirestore();
  }

  Color appBarColor() {
    if (survey_index == 1) {
      return Color(0xFFF6921E);
    }
    if (survey_index == 2) {
      return Color(0xFF418AA2);
    }
    if (survey_index == 3) {
      return Color(0xFF39B54A);
    }
    if (survey_index == 4) {
      return Color(0xFF00ADEE);
    }
    return Color(0xFFF6921E);
  }

  Future<void> setGeneralSurveyAnswersToFirestore() async {
    FirebaseFirestore database = FirebaseFirestore.instance;
    await database
        .collection('users')
        .doc(Auth().currentUser!.uid)
        .collection('general_survey')
        .doc('general_survey_answers')
        .set(surveyAnswer);
  }

  void setGeneralAnswerSurvetOnFirebase(int radioIndex) {
    print(surveyData['survey_question_${survey_index}']);
    surveyAnswer.addAll(
      {
        surveyData['survey_question_${survey_index}']: surveyData['survey_answers_${survey_index}']
            [radioIndex],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  height: 60,
                  color: appBarColor(),
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

                        // Radio Btn Questions and Answers
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
                                    onChanged: (value) {
                                      setState(() {
                                        setGeneralAnswerSurvetOnFirebase(0);
                                        radioGroupValue = value;
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
                                      onChanged: (value) {
                                        setState(() {
                                          setGeneralAnswerSurvetOnFirebase(1);
                                          radioGroupValue = value;
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
                                      onChanged: (value) {
                                        setState(() {
                                          setGeneralAnswerSurvetOnFirebase(2);
                                          radioGroupValue = value;
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
                                      onChanged: (value) {
                                        setState(() {
                                          setGeneralAnswerSurvetOnFirebase(3);
                                          radioGroupValue = value;
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
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          setGeneralAnswerSurvetOnFirebase(4);
                                          radioGroupValue = value;
                                        },
                                      );
                                    },
                                  ),
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
                          if (radioGroupValue == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('You must choose one option!'),
                              ),
                            );
                            return;
                          }
                          if (survey_index > 1) {
                            setState(() {
                              radioGroupValue = null;
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
                          if (radioGroupValue == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('You must choose one option!'),
                              ),
                            );
                            return;
                          }
                          if (survey_index < 4) {
                            setState(() {
                              radioGroupValue = null;
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
                        onPressed: () {
                          if (radioGroupValue == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('You must choose one option!'),
                              ),
                            );
                            return;
                          } else {
                            setGeneralSurveyAnswersToFirestore();
                            print('Submit map:');
                            print(surveyAnswer);
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => MainMenuPage(),
                            //   ),
                            // );
                          }
                        },
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
