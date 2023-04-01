import 'package:flutter/material.dart';

import '/pages/main_menu_pages/main_menu_page.dart';
import 'firebase/auth/firebase_auth.dart';
import 'pages/login_section_pages/login_page.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authenticationStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainMenuPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
