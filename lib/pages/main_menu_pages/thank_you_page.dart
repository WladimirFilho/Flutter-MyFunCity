import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/main_menu_pages/main_menu_page.dart';

class ThankYouPage extends StatefulWidget {
  const ThankYouPage({super.key});

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  late Timer timer;

  @override
  void initState() {
    timer = Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MainMenuPage())));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainMenuPage(),
                ),
              );
            },
            child: Image.asset(
              'images/thank_you.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
