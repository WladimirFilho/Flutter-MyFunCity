import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myfuncitynew/pages/find_pages/find_main_page.dart';
import 'package:myfuncitynew/pages/main_menu_pages/main_menu_page.dart';
import 'package:myfuncitynew/pages/places_pages/places_main_page.dart';

import '/constants/colors_constants.dart';

class MainPageBottomNavibar extends StatelessWidget {
  final Function(int) onTapClick;
  final int initialIndex;

  const MainPageBottomNavibar({
    super.key,
    required this.onTapClick,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: GNav(
        padding: EdgeInsets.all(10),
        gap: 8,
        tabs: [
          GButton(
            iconActiveColor: orangeColor,
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            iconActiveColor: orangeColor,
            icon: Icons.map,
            text: 'Places',
          ),
          GButton(
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
        selectedIndex: initialIndex,
        onTabChange: onTapClick,
      ),
    );
  }
}
//TODO how to onPress to next page
