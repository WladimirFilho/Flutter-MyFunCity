import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/login_section_pages/register_page.dart';
import 'package:myfuncitynew/pages/main_menu_pages/main_menu_page.dart';

import '/constants/colors_constants.dart';
import '/constants/font_styles_constant.dart';
import '/widgets/full_orange_btn_widget.dart';
import '../../firebase/auth/firebase_auth.dart';
import '../../widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isForgotBtnClicked = false;
  bool isLoginBtnClicked = false;
  final TextEditingController controlerEmail =
      TextEditingController(text: 'email1@email.com');
  final TextEditingController controlerPassword =
      TextEditingController(text: 'email1@email.com');

  Future<void> userSignIn() async {
    try {
      await Auth()
          .signIn(email: controlerEmail.text, password: controlerPassword.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MainMenuPage(),
        ),
      );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Image.asset(
                      './images/logo.png',
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 70),
                  TextFieldWidget(textHint: 'email', controler: controlerEmail),
                  SizedBox(height: 10),
                  TextFieldWidget(
                    textHint: 'password',
                    controler: controlerPassword,
                    isHidden: true,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      isForgotBtnClicked
                          ? CircularProgressIndicator()
                          : TextButton(
                              onPressed: () async {
                                setState(() {
                                  isForgotBtnClicked = true;
                                });
                                await Auth()
                                    .firebaseAuth
                                    .sendPasswordResetEmail(
                                      email: controlerEmail.text,
                                    );
                                setState(() {
                                  isForgotBtnClicked = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 119, 119, 119),
                                    behavior: SnackBarBehavior.floating,
                                    content: Text('Reset email has sent.'),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password',
                                style: smallTextStyle,
                              ),
                            )
                    ],
                  ),
                  SizedBox(height: 40),
                  isLoginBtnClicked
                      ? CircularProgressIndicator()
                      : BtnFullOrange(
                          onTap: () async {
                            setState(() {
                              isLoginBtnClicked = true;
                            });
                            await userSignIn();
                            setState(() {
                              isLoginBtnClicked = false;
                            });
                          },
                          textFullOrangeBtn: 'Login',
                        ),
                  SizedBox(height: 30),
                  Text('Don`t have an account?', style: smallTextStyle),
                  const SizedBox(height: 3),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RegisterPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: orangeColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
