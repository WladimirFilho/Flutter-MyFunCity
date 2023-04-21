import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/firebase/auth/firebase_auth.dart';
import 'package:myfuncitynew/pages/main_menu_pages/questions_widgets/vote_slider_widget.dart';

import '../../../widgets/custom_app_bar_widget.dart';
import '../thank_you_page.dart';

class NightQuestionsPage extends StatefulWidget {
  const NightQuestionsPage({
    Key? key,
    required this.docFromFirebase,
  }) : super(key: key);

  final Map<String, dynamic> docFromFirebase;

  @override
  State<NightQuestionsPage> createState() => _NightQuestionsPageState();
}

class _NightQuestionsPageState extends State<NightQuestionsPage> {
  int questionThemeNightIndex = 0;
  Map<String, int> answers = {};

  Future<void> setDataToFirestore() async {
    FirebaseFirestore database = FirebaseFirestore.instance;
    await database.collection('users').doc(Auth().currentUser!.email).update(
      {'theme_2': answers},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              child: Image.asset(
                'images/menu_hero_image_night_life.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.docFromFirebase['questions'][questionThemeNightIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            if (questionThemeNightIndex == 0)
              SliderVoteWidget(
                key: ValueKey(1),
                onPress: (int votingIndex) {
                  answers.addAll(
                    {
                      widget.docFromFirebase['questions'][questionThemeNightIndex]: votingIndex,
                    },
                  );
                },
              ),
            if (questionThemeNightIndex == 1)
              SliderVoteWidget(
                key: ValueKey(2),
                onPress: (int votingIndex) {
                  answers.addAll(
                    {
                      widget.docFromFirebase['questions'][questionThemeNightIndex]: votingIndex,
                    },
                  );
                },
              ),
            if (questionThemeNightIndex == 2)
              SliderVoteWidget(
                key: ValueKey(3),
                onPress: (int votingIndex) {
                  answers.addAll(
                    {
                      widget.docFromFirebase['questions'][questionThemeNightIndex]: votingIndex,
                    },
                  );
                },
              ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    if (questionThemeNightIndex < widget.docFromFirebase['questions'].length - 1) {
                      questionThemeNightIndex++;
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
                // <-- Button color
                foregroundColor: Color.fromARGB(255, 255, 188, 73), // <-- Splash color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
