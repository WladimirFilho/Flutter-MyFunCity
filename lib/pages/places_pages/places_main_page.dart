import 'package:flutter/material.dart';
import 'package:myfuncitynew/widgets/custom_app_bar_widget.dart';

class PlacesMainPage extends StatefulWidget {
  const PlacesMainPage({Key? key}) : super(key: key);

  @override
  State<PlacesMainPage> createState() => _PlacesMainPageState();
}

class _PlacesMainPageState extends State<PlacesMainPage> {
  List<String> cityList = ['NSW', 'VIC', 'QLD'];
  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomAppBar(),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: [
                    Text(
                      'Find the place that that would make you happier',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 33,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.1),
                    ),
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
                    DropdownButton(
                      onChanged: (_) {},
                      items: cityList
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Container(
                                    child: Text(value),
                                    width: 150,
                                    height: 1000,
                                    color: Colors.deepOrangeAccent,
                                  )))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
