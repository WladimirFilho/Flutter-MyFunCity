import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/firebase/auth/firebase_auth.dart';
import 'package:myfuncitynew/pages/main_menu_pages/thank_you_page.dart';

import '../../../widgets/custom_app_bar_widget.dart';
import '../questions_widgets/vote_slider_widget.dart';

class QuestionsMorningTimePage extends StatefulWidget {
  QuestionsMorningTimePage({super.key, required this.docFromFirebase});

  final Map<String, dynamic> docFromFirebase;

  @override
  State<QuestionsMorningTimePage> createState() =>
      _QuestionsMorningTimePageState();
}

class _QuestionsMorningTimePageState extends State<QuestionsMorningTimePage> {
  int questionThemeIndex = 0;
  List<int> answers = [0, 0, 0];

  Future<void> setDataToFirestore() async {
    FirebaseFirestore database = FirebaseFirestore.instance;
    await database
        .collection('users')
        .doc(Auth().currentUser!.uid)
        .collection('theme_1')
        .doc('questions')
        .set(
      {'answers': answers},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomAppBar(),

            SizedBox(
              height: 5,
            ),

            /// Hero Picture
            Container(
              child: Image.asset(
                'images/menu_hero_morning_time_friendly.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: FittedBox(
                child: Text(
                  widget.docFromFirebase['questions'][questionThemeIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),

            if (questionThemeIndex == 0)
              SliderVoteWidget(
                key: ValueKey(1),
                onPress: (int votingIndex) {
                  answers[questionThemeIndex] = votingIndex;
                },
              ),
            if (questionThemeIndex == 1)
              SliderVoteWidget(
                key: ValueKey(2),
                onPress: (int votingIndex) {
                  answers[questionThemeIndex] = votingIndex;
                },
              ),
            if (questionThemeIndex == 2)
              SliderVoteWidget(
                key: ValueKey(3),
                onPress: (int votingIndex) {
                  answers[questionThemeIndex] = votingIndex;
                },
              ),

            SizedBox(
              height: 30,
            ),

            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    if (questionThemeIndex <
                        widget.docFromFirebase['questions'].length - 1) {
                      questionThemeIndex++;
                    } else {
                      setDataToFirestore();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ThankYouPage(),
                        ),
                      );
                    }
                  },
                );
              },
              child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shadowColor: Colors.transparent,
                shape: CircleBorder(),
                padding: EdgeInsets.all(8),
                backgroundColor: Color.fromARGB(255, 247, 157, 22),
                foregroundColor:
                    Color.fromARGB(255, 255, 188, 73), // <-- Splash color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
