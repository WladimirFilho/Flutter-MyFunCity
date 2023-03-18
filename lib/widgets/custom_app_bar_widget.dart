// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/main_menu_pages/main_menu_page.dart';
import 'package:myfuncitynew/pages/user_profile_pages/user_main_page.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, this.isLeading = true});

  bool isLeading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                //Icon Left to go back
                isLeading
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 40,
                        ),
                        color: Color.fromARGB(255, 203, 203, 203),
                      )
                    : SizedBox(width: 56),

                //Logo in the midle, No links
                GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MainMenuPage(),
                      ),
                    ),
                  },
                  child: Image.asset('images/logo_app_bar.png'),
                ),

                ///Icon Right to go profile settings
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserMainPage(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'images/profile_icon.png',
                    height: 40,
                  ),
                ),
              ]),
        ),
        margin: EdgeInsets.only(top: 30),

        // ignore: prefer_const_constructors
      ),
    );
  }
}
