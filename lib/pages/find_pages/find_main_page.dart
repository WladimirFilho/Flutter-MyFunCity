import 'package:flutter/material.dart';
import 'package:myfuncitynew/widgets/custom_app_bar_widget.dart';
import 'package:myfuncitynew/widgets/main_page_bottom_navbar_widget.dart';

class FindMainPage extends StatelessWidget {
  const FindMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Image.asset(
              'images/hero_image_find_out.png',
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Find out what\nwe have done so far.",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Sydney is getting free activities for kids !!!',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Sydney is getting free activities for kids !!!',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Sydney is getting free activities for kids !!!',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Sydney iSydney is getting free activities for kids !!!Sydney is getting free activities for kids !!!Sydney is getting free activities for kids !!!s getting free activities for kids !!!',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: MainPageBottomNavibar(),
    );
  }
}
