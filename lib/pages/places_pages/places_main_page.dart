import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/places_pages/widgets/city_selected_content.dart';
import 'package:myfuncitynew/widgets/title_section_header.dart';

class PlacesMainPage extends StatefulWidget {
  const PlacesMainPage({Key? key}) : super(key: key);

  @override
  State<PlacesMainPage> createState() => _PlacesMainPageState();
}

class _PlacesMainPageState extends State<PlacesMainPage> {
  List<String> cityList = [];
  String? citySelected;
  int? selectedItem;
  bool isLoading = false;
  Map<String, dynamic> mainQuestionsData = {};
  List<Map<String, dynamic>> usersAnswers = [];
  String currentTheme = 'theme_1';

  final Map<String, dynamic> themeInfo = {
    'theme_1': {
      'image': 'images/menu_cover_morning_time.png',
      'label': 'Morning Time',
    },
    'theme_2': {
      'image': 'images/menu_hero_image_night_life.png',
      'label': 'Night Life',
    },
    'theme_3': {
      'image': 'images/menu_hero_image_envi.png',
      'label': 'Environmental',
    },
    'theme_4': {
      'image': 'images/menu_hero_image_kid_friendly.png',
      'label': 'Kids Friendly',
    },
  };

  void firebaseGetStateData() async {
    setState(() {
      isLoading = true;
    });
    final db = FirebaseFirestore.instance;
    final survey =
        await db.collection('general_survey').doc('hlBkeCpfqcyLTTjaPimn').get();
    Map<String, dynamic>? citiesFromSurvey = survey.data() ?? {};
    var allCities = citiesFromSurvey['survey_answers_4'];
    setState(() {
      cityList = List<String>.from(allCities);
      isLoading = false;
    });
  }

  Future<void> barContentSummaryFeeling() async {
    setState(() {
      isLoading = true;
    });
    final db = FirebaseFirestore.instance;
    final userAnswers = await db
        .collection('users')
        .where(
          'general_survey.What is your area?',
          isEqualTo: citySelected,
        )
        .get();

    List<Map<String, dynamic>> internalAnswers = [];

    userAnswers.docs.forEach((element) {
      internalAnswers.add(element.data());
    });
    setState(() {
      usersAnswers = internalAnswers;
      isLoading = false;
    });
  }

  Future<void> getQuestions() async {
    final db = FirebaseFirestore.instance;
    final mainQuestionsFromFirebase =
        await db.collection('myFunCity_questions').doc('themes').get();
    setState(() {
      mainQuestionsData = mainQuestionsFromFirebase.data() ?? {};
    });
  }

  List<double> getAnswersSummary(String theme, String question) {
    Map<int, int> measure = {
      0: 0,
      1: 0,
      2: 0,
      3: 0,
      4: 0,
    };

    int totalAnswers = 0;

    for (var userAnswer in usersAnswers) {
      if (userAnswer.containsKey(theme)) {
        if (userAnswer[theme].containsKey(question)) {
          totalAnswers++;
          measure[userAnswer[theme][question]] =
              measure[userAnswer[theme][question]]! + 1;
        }
      }
    }

    final List<double> measureReturn = measure.values.map((e) {
      final x = (e / totalAnswers) * 100;
      if (x.isNaN) {
        return 0.0;
      } else {
        return x;
      }
    }).toList();

    return measureReturn;
  }

  @override
  void initState() {
    super.initState();
    firebaseGetStateData();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    List<String> questions = [];

    if (mainQuestionsData.containsKey(currentTheme)) {
      questions =
          List<String>.from(mainQuestionsData[currentTheme]['questions']);
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    children: [
                      TitleSectionHeader(
                          title:
                              'Find the place that that would make you happier'),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Chose one city to know the details  of each place that might help you to improve your quality of life',
                        style: TextStyle(
                          height: 1.9,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      isLoading
                          ? CircularProgressIndicator(
                              color: Colors.orangeAccent,
                            )
                          : Column(
                              children: [
                                Container(
                                  height: 60,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: citySelected,
                                      iconEnabledColor: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      iconSize: 40,
                                      hint: Text(
                                        'Choose your city',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      isExpanded: true,
                                      elevation: 0,
                                      dropdownColor: Colors.deepOrange,
                                      onChanged: (city) {
                                        setState(() {
                                          citySelected = city;
                                        });
                                        barContentSummaryFeeling();
                                      },
                                      items: cityList
                                          .map<DropdownMenuItem<String>>(
                                            (String value) =>
                                                DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                                if (citySelected != null) ...[
                                  SizedBox(
                                    height: 30,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: themeInfo.entries.map((e) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                currentTheme = e.key;
                                              });
                                            },
                                            child: Chip(
                                              side: BorderSide(
                                                color: Colors.orangeAccent,
                                                width: 3,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              label: Text(e.value['label']!),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      themeInfo[currentTheme]['image'],
                                    ),
                                  ),
                                  ...questions.map((question) {
                                    return CitySelectedContent(
                                      questionTitle: question,
                                      feelingSummary: getAnswersSummary(
                                          currentTheme, question),
                                    );
                                  }).toList()
                                ],
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
