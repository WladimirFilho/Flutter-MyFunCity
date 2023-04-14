import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/find_pages/find_main_page.dart';
import 'package:myfuncitynew/pages/main_menu_pages/a_questions_morning_time_pages/questions_morning_time_page.dart';
import 'package:myfuncitynew/pages/main_menu_pages/c_night_pages/night_questions_page.dart';
import 'package:myfuncitynew/pages/places_pages/places_main_page.dart';
import 'package:myfuncitynew/pages/reviews/reviews_page.dart';

import '/widgets/custom_app_bar_widget.dart';
import '../../widgets/main_page_bottom_navbar_widget.dart';
import 'b_questions_kids_friendly_pages/questions_kids_friendly_page.dart';
import 'd_enviromental/enviromental_page.dart';

late DocumentSnapshot<Map<String, dynamic>> info;

class MainMenuPage extends StatefulWidget {
  MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedIndex = 0;

  final pages = [
    HomeWidget(),
    PlacesMainPage(),
    FindMainPage(),
    ReviewPages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isLeading: false),
      body: pages[_selectedIndex],
      bottomNavigationBar: MainPageBottomNavibar(
        onTapClick: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        initialIndex: _selectedIndex,
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  Future<void> getDataFromFirestore() async {
    FirebaseFirestore database = FirebaseFirestore.instance;
    info = await database.collection('myFunCity_questions').doc('themes').get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataFromFirestore(),
      builder: (context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
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
                              builder: (context) => QuestionsMorningTimePage(
                                docFromFirebase: info['theme_1'],
                              ),
                            ),
                          );
                        },
                        child:
                            Image.asset('images/menu_cover_morning_time.png'),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                            SizedBox(
                              width: 20,
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
                                'images/menu_cover_night_life.png',
                              ),
                            ),
                          ],
                        ),
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
                          child:
                              Image.asset('images/menu_cover_enveirament.png')),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
