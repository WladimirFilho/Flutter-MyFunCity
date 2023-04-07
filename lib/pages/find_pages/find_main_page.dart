import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/find_pages/find_out_text_block_widget.dart';
import 'package:myfuncitynew/widgets/custom_app_bar_widget.dart';
import 'package:myfuncitynew/widgets/main_page_bottom_navbar_widget.dart';

class FindMainPage extends StatelessWidget {
  const FindMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset(
                      'images/hero_image_find_out.png',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      "Find out what\nwe have done so far.",
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 33,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      children: [
                        FindOutTextBlockWidget(
                          title:
                              'Sydney is getting free activities for kids !!!',
                          content:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
