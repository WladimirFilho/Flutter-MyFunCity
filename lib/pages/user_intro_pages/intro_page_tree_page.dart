import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/survey_pages/survey_pages.dart';
import 'package:myfuncitynew/widgets/full_orange_btn_widget.dart';

class IntroPageTree extends StatefulWidget {
  const IntroPageTree({super.key});

  @override
  State<IntroPageTree> createState() => _IntroPageTreeState();
}

class _IntroPageTreeState extends State<IntroPageTree> {
  bool hasAgreedWith = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
          ),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Column(
            children: [
              //Image on the top
              Image.asset('./images/intro_tree_image.png'),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'To Help Us impove the results, we would like you to answer a quick survey',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25, fontFamily: "Roboto", fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Close'),
                                )
                              ],
                              title: Text('Terms and condition.'),
                              content: SingleChildScrollView(
                                child: Text('''
                              By downloading and using this mobile app, you agree to the collection and use of your personal information in accordance with this privacy policy.
    The information collected may include but is not limited to your name, email address, phone number, and device information.
    We may use this information to improve the mobile app's functionality and user experience, personalize content and advertising, and communicate with you about the mobile app and related products and services.
    We may share your information with third-party service providers who assist us in operating the mobile app, conducting business, or serving you. These providers are contractually obligated to keep your information confidential and secure.
    We will not sell, rent, or lease your personal information to third parties unless we have your permission or are required by law to do so.
    We will take reasonable steps to protect your information from unauthorized access, use, or disclosure.
    This privacy policy may be updated from time to time. We will notify you of any material changes to the policy by posting a notice in the mobile app or by other means.
    If you have any questions or concerns about this privacy policy, please contact us at [contact information].           
                          '''),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Read here our policy \n of privacy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.w100),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: Color.fromARGB(255, 138, 138, 138),
                          checkColor: Colors.grey[300],
                          value: hasAgreedWith,
                          onChanged: (_) {
                            setState(() {
                              hasAgreedWith = !hasAgreedWith;
                            });
                          },
                        ),
                        Text(
                          'I agreed',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Roboto",
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              BtnFullOrange(
                isDisable: !hasAgreedWith,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SurveyPageOne(),
                    ),
                  );
                },
                textFullOrangeBtn: 'Start the survey',
              ),
              SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
