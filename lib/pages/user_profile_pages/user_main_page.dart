import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/user_profile_pages/user_settings_page.dart';

import '../../firebase/auth/firebase_auth.dart';
import '../../widgets/custom_app_bar_widget.dart';

class UserMainPage extends StatefulWidget {
  UserMainPage({super.key})
      : userNameController =
            TextEditingController(text: Auth().currentUser?.displayName);

  TextEditingController userNameController;

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {
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
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: Container(
                width: double.infinity,
                child: Text(
                  'Hi, ' + widget.userNameController.text,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            ///Settings Navigations
            GestureDetector(
              onTap: () async {
                final newName = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserSettingsPage(
                      userName: Auth().currentUser?.displayName ?? '',
                    ),
                  ),
                );

                setState(() {
                  widget.userNameController.text = newName;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Color.fromARGB(255, 255, 130, 35),
                  ),
                ),
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
