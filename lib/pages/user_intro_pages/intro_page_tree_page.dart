import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/survey_pages/survey_page_one_pages.dart';

class IntroPageTree extends StatelessWidget {
  const IntroPageTree({super.key});

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
              SizedBox(
                height: 25,
              ),
              Text(
                'To Help Us impove the results, we would like you to answer a quick survey',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 25,
              ),
              const Text(
                'Read here our policy \n of privacy',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w100),
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
                    value: true,
                    onChanged: (value) => {},
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
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SurveyPageOne(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: const Color.fromARGB(255, 233, 233, 233),
                          width: 4),
                      color: const Color.fromARGB(255, 182, 182, 182)),
                  height: 50,
                  width: Get.width * 0.7,
                  child: const Center(
                    child: Text(
                      'Start',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                          color: const Color.fromARGB(255, 250, 187, 139),
                          width: 4),
                      color: const Color.fromARGB(255, 254, 157, 60)),
                  height: 50,
                  width: Get.width * 0.7,
                  child: const Center(
                      child: Text(
                    'Skip the Survey',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                  )),
                ),
              ),

              // Btn start or skip
            ],
          ),
        ),
      ),
    );
  }
}
