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

  void firebaseGetStateData() async {
    setState(() {
      isLoading = true;
    });
    final db = FirebaseFirestore.instance;
    final survey = await db.collection('general_survey').doc('hlBkeCpfqcyLTTjaPimn').get();
    Map<String, dynamic>? citiesFromSurvey = survey.data() ?? {};
    var allCities = citiesFromSurvey['survey_answers_4'];
    setState(() {
      cityList = List<String>.from(allCities);
      isLoading = false;
    });
  }

  Future<void> barContentSummaryFeeling() async {
    final db = FirebaseFirestore.instance;
    final userAnswers = await db
        .collection('users')
        .where(
      'general_survey.What is your area?',
      isEqualTo: citySelected,
    )
        .get();
    userAnswers.docs.forEach((element) {
      usersAnswers.add(element.data());
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

  void getAnswersSummary(String theme, String question) {
    usersAnswers.where((element) {

    });
  }

  List<double> feelingSummary = [
    4,
    7,
    50,
    70,
    100,
  ];

  @override
  void initState() {
    super.initState();
    firebaseGetStateData();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final questions = List<String>.from(mainQuestionsData['theme_1']['questions']);

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
                      TitleSectionHeader(title: 'Find the place that that would make you happier'),
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
                          : Container(
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
                              style: TextStyle(fontSize: 12, color: Colors.white),
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
                      if (citySelected != null)
                        ...questions.map((question) {
                          return CitySelectedContent(
                            questionTitle: question,
                            feelingSummary: feelingSummary,
                          );
                        }).toList()
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
