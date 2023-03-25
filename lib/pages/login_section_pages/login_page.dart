import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/login_section_pages/register_page.dart';
import 'package:myfuncitynew/pages/user_intro_pages/intro_page_one_page.dart';

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
  final bool isChecked = false;
  final TextEditingController controlerEmail = TextEditingController(text: 'wladimir.wf@gmail.com');
  final TextEditingController controlerPassword = TextEditingController(text: '12345678');

  Future<void> userSignIn() async {
    try {
      await Auth().signIn(email: controlerEmail.text, password: controlerPassword.text);
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

                  //Remember me and ForgotPassword
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: const VisualDensity(horizontal: -4),
                            value: isChecked,
                            onChanged: (newValue) {},
                            activeColor: orangeColor,
                          ),
                          SizedBox(width: 10),
                          InkWell(
                              onTap: <String>() {
                                if (controlerEmail == "") {
                                  return ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                        content: Text('Testing'),
                                      ))
                                      .toString();
                                } else {
                                  Auth().resetEmail(controlerEmail);
                                }
                                ;
                              },
                              child: Text('Remember me', style: smallTextStyle))
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Auth().firebaseAuth.sendPasswordResetEmail(
                                email: controlerEmail.text,
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
                  BtnFullOrange(
                    onTap: () {
                      userSignIn();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => IntroPageOne(),
                        ),
                      );
                    },
                    textFullOrangeBtn: 'Login',
                  ),
                  SizedBox(height: 30),

                  Text('Dont have an account?', style: smallTextStyle),
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
