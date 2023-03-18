import 'package:flutter/material.dart';

import '../../../widgets/custom_app_bar_widget.dart';
import '../questions_widgets/vote_slider_widget.dart';
import '../thank_you_page.dart';

class EnviromentalPage extends StatefulWidget {
  const EnviromentalPage({Key? key, required this.docFromFirebase})
      : super(key: key);

  final Map<String, dynamic> docFromFirebase;

  @override
  State<EnviromentalPage> createState() => _EnviromentalPageState();
}

class _EnviromentalPageState extends State<EnviromentalPage> {
  int questionThemeEnviromentalIndex = 0;

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
            Container(
              child: Image.asset(
                'images/menu_hero_image_kid_friendly.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.docFromFirebase['questions']
                    [questionThemeEnviromentalIndex],
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
            SliderVoteWidget(onPress: (int votingIndex) {}),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    if (questionThemeEnviromentalIndex <
                        widget.docFromFirebase['questions'].length - 1) {
                      questionThemeEnviromentalIndex++;
                    } else {
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
