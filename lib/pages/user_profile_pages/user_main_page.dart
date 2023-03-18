import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../firebase/auth/firebase_auth.dart';
import '../../widgets/custom_app_bar_widget.dart';

class UserMainPage extends StatelessWidget {
  UserMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var phoneWidth = mediaQuery.size.width;

    Future<void> userSignOut() async {
      try {
        await Auth().signOut();
        Navigator.popUntil(context, (route) => route.isFirst);
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color.fromARGB(255, 119, 119, 119),
            behavior: SnackBarBehavior.floating,
            content: Text(e.message ?? 'ERROR'),
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Custom AppBar
            CustomAppBar(),
            SizedBox(
              height: 50,
            ),

            ///Settings Navigations
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Color.fromARGB(255, 255, 130, 35))),
                width: phoneWidth * 0.8,
                height: 60,
                child: Text(
                  'Settings',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1),
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Color.fromARGB(255, 0, 182, 253))),
                width: phoneWidth * 0.8,
                height: 60,
                child: Text(
                  'About',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1),
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),

            /// Logout button
            ///
            GestureDetector(
              onTap: () {
                print('pressed logout');
                userSignOut();
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Color.fromARGB(255, 2, 188, 92))),
                width: phoneWidth * 0.8,
                height: 60,
                child: Text(
                  'LogOut',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1),
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: 50,
            ),

            ///Image Bottom
            Container(
              width: phoneWidth,
              child: Image.asset(
                'images/good_vibes_only.png',
                fit: BoxFit.cover,
              ),
            )

            /// Image Bottom Page
          ],
        ),
      ),
    );
  }
}
