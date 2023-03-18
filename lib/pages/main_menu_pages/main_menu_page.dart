import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/main_menu_pages/a_questions_morning_time_pages/questions_morning_time_page.dart';
import 'package:myfuncitynew/pages/main_menu_pages/c_night_pages/night_questions_page.dart';

import '/widgets/custom_app_bar_widget.dart';
import '../../widgets/main_page_bottom_navbar_widget.dart';
import 'b_questions_kids_friendly_pages/questions_kids_friendly_page.dart';
import 'd_enviromental/enviromental_page.dart';

late DocumentSnapshot<Map<String, dynamic>> info;

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> getDataFromFirestore() async {
      FirebaseFirestore database = FirebaseFirestore.instance;
      info =
          await database.collection('myFunCity_questions').doc('themes').get();
    }

    return Scaffold(
      body: FutureBuilder(
        future: getDataFromFirestore(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                CustomAppBar(),

                SizedBox(height: 10),

                /// Main List Menu
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QuestionsMorningTimePage(
                                          docFromFirebase: info['theme_1']),
                                ),
                              );
                            },
                            child: Image.asset(
                                'images/menu_cover_morning_time.png')),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        QuestionsKidsFriendlyPage(
                                      docFromFirebase: info['theme_4'],
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'images/menu_cover_kid_friendly.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => NightQuestionsPage(
                                        docFromFirebase: info['theme_2']),
                                  ),
                                );
                              },
                              child: Image.asset(
                                  'images/menu_cover_night_life.png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EnviromentalPage(
                                    docFromFirebase: info['theme_3'],
                                  ),
                                ),
                              );
                            },
                            child: Image.asset(
                                'images/menu_cover_enveirament.png')),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
      bottomNavigationBar: MainPageBottomNavibar(),
    );
  }
}

//TODO list view stops bouncing and snaps on top
