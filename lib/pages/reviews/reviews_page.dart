import 'package:flutter/material.dart';
import 'package:myfuncitynew/widgets/custom_app_bar_widget.dart';
import 'package:myfuncitynew/widgets/post_widget.dart';
import 'package:myfuncitynew/widgets/title_section_header.dart';

class ReviewPages extends StatelessWidget {
  const ReviewPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          isLeading: false,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 400,
                  child: Image.asset(
                    'images/review_image.png',
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TitleSectionHeader(
                        title: 'See what people are talking about their experience using MyFunCity',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      PostWidget(
                          name: 'Jonny',
                          postText:
                              'I Love that now I can hear music on my morning walking when I go to work. That was a very good Idea. Everyone seems very happy now.'),
                      PostWidget(
                          name: 'Jonny',
                          postText:
                              'I Love that now I can hear music on my morning walking when I go to work. That was a very good Idea. Everyone seems very happy now.'),
                      PostWidget(
                          name: 'Jonny',
                          postText:
                              'I Love that now I can hear music on my morning walking when I go to work. That was a very good Idea. Everyone seems very happy now.'),
                      PostWidget(
                          name: 'Jonny',
                          postText:
                              'I Love that now I can hear music on my morning walking when I go to work. That was a very good Idea. Everyone seems very happy now.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
