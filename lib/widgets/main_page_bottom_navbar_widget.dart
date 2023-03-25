import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myfuncitynew/pages/find_pages/find_main_page.dart';
import 'package:myfuncitynew/pages/main_menu_pages/main_menu_page.dart';
import 'package:myfuncitynew/pages/places_pages/places_main_page.dart';

import '/constants/colors_constants.dart';

class MainPageBottomNavibar extends StatefulWidget {
  const MainPageBottomNavibar({super.key});

  @override
  State<MainPageBottomNavibar> createState() => _MainPageBottomNavibarState();
}

class _MainPageBottomNavibarState extends State<MainPageBottomNavibar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: GNav(
        padding: EdgeInsets.all(10),
        gap: 8,
        tabs: [
          GButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainMenuPage(),
                ),
              );
            },
            iconActiveColor: orangeColor,
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PlacesMainPage(),
                ),
              );
            },
            iconActiveColor: orangeColor,
            icon: Icons.map,
            text: 'Places',
          ),
          GButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FindMainPage(),
                ),
              );
            },
            iconActiveColor: orangeColor,
            icon: Icons.notifications,
            text: 'New',
          ),
          GButton(
            icon: Icons.message_rounded,
            text: 'Reviews',
            iconActiveColor: orangeColor,
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
//TODO how to onPress to next page
