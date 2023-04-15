import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/places_pages/bar_graph.dart';
import 'package:myfuncitynew/widgets/custom_app_bar_widget.dart';
import 'package:myfuncitynew/widgets/title_section_header.dart';

class PlacesMainPage extends StatefulWidget {
  const PlacesMainPage({Key? key}) : super(key: key);

  @override
  State<PlacesMainPage> createState() => _PlacesMainPageState();
}

class _PlacesMainPageState extends State<PlacesMainPage> {
  List<String> cityList = [];
  int? selectedItem;
  bool isLoading = false;

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
  }

  @override
  Widget build(BuildContext context) {
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
                          : Container(
                              height: 60,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
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
                                  onChanged: (_) {},
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),

                          // Picture hero
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'images/menu_hero_morning_time_friendly.png',
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          // Graphic
                          SizedBox(
                            height: 300,
                            child: MyBarGraph(feelingsSummary: feelingSummary),
                          ),

                          SizedBox(
                            height: 40,
                          ),

                          // Section Description
                          Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
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
