//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfuncitynew/pages/user_intro_pages/intro_page_one_page.dart';
import 'package:myfuncitynew/widgets/text_form_field_widget.dart';

import '../../constants/colors_constants.dart';
import '../../firebase/auth/firebase_auth.dart';
import '../../widgets/full_orange_btn_widget.dart';

/*

  Register page is to register a new user
  inside the database

*/

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void dispose() {
    controlerFirtsName.dispose();
    super.dispose();
  }

  /*
      Controlers created to recive input
      from text field
  */

  final controlerFirtsName = TextEditingController();
  final controlerLastName = TextEditingController();
  final controlerEmail = TextEditingController();
  final controlerPassword = TextEditingController();
  final controlerConfirmPassword = TextEditingController();

  Future<void> register() async {
    try {
      await Auth().createAccount(
          email: controlerEmail.text, password: controlerPassword.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => IntroPageOne(),
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

  // Form key events
  final formKey = GlobalKey<FormState>();
  bool isConfirmPasswordHidden = true;
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: ListView(shrinkWrap: true, children: [
                SingleChildScrollView(
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
                      const SizedBox(height: 60),
                      TextFormFieldWidget(
                        validator: (String? value) {
                          if (value == null) {
                            return value;
                          }
                          if (value.isEmpty) {
                            return 'Invalid name';
                          }
                          return null;
                        },
                        controler: controlerFirtsName,
                        hint: 'First name',
                      ),
                      TextFormFieldWidget(
                        validator: (String? value) {
                          if (value == null) {
                            return value;
                          }
                          if (value.isEmpty) {
                            return 'Invalid Last name';
                          }
                          return null;
                        },
                        controler: controlerLastName,
                        hint: 'Last name',
                      ),
                      TextFormFieldWidget(
                        validator: (String? value) {
                          if (value == null) {
                            return value;
                          }
                          if (!value.isEmail) {
                            return 'Invalid email ';
                          }
                          return null;
                        },
                        controler: controlerEmail,
                        hint: 'Email',
                      ),
                      TextFormFieldWidget(
                        trallingIcon: IconButton(
                          icon: Icon(
                            isPasswordHidden == false
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          color: Colors.grey,
                        ),
                        isHidden: isPasswordHidden,
                        validator: (String? value) {
                          if (value == null) {
                            return value;
                          }
                          if (value.length < 8) {
                            return 'Minimum 8 characters';
                          }
                          return null;
                        },
                        controler: controlerPassword,
                        hint: 'Password',
                      ),
                      TextFormFieldWidget(
                        trallingIcon: IconButton(
                          icon: Icon(
                            isConfirmPasswordHidden == false
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordHidden =
                                  !isConfirmPasswordHidden;
                            });
                          },
                        ),
                        isHidden: isConfirmPasswordHidden,
                        validator: (String? value) {
                          if (value == null) {
                            return value;
                          }
                          if (value == controlerPassword.value) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        controler: controlerConfirmPassword,
                        hint: 'Confirm password',
                      ),
                      GestureDetector(
                        child: BtnFullOrange(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              register();
                            }
                          },
                          textFullOrangeBtn: 'Register',
                        ),
                      ),
                      TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: orangeColor),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: orangeColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
