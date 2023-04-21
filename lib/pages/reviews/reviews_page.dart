import 'package:flutter/material.dart';
import 'package:myfuncitynew/widgets/post_widget.dart';
import 'package:myfuncitynew/widgets/title_section_header.dart';

class ReviewPages extends StatelessWidget {
  const ReviewPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                          title:
                              'See what people are talking about their experience using MyFunCity',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        PostWidget(
                            name: 'Jonny Montana',
                            postText:
                                'The parks in this city are some of the most beautiful and peaceful places to visit. They offer a great escape from the hustle and bustle of daily life, allowing visitors to relax and enjoy nature. From large open spaces with sprawling fields and playgrounds, to smaller, more intimate gardens, the parks offer something for everyone. Many of the parks feature walking paths, benches, and picnic areas, providing the perfect setting for a family outing or a romantic picnic. Whether you are looking for a place to exercise, spend time with loved ones, or simply take a break from the stresses of the day, the parks in your city are the perfect place to do so.'),
                        PostWidget(
                            name: 'Mark Mark',
                            postText:
                                'Sydney is renowned for its vibrant nightlife, with a plethora of options to suit all tastes and budgets. The city is home to countless bars, clubs, and pubs that stay open late, allowing party-goers to dance and socialize well into the early hours of the morning. Many of these venues offer live music, DJs, and a wide variety of drinks and food options. In addition to traditional nightclubs, Sydney also boasts a thriving alternative scene, with an abundance of underground and indie clubs, as well as festivals and events that cater to niche interests. With so many options available, Sydney truly offers something for everyone, making it a destination for those seeking a fun and lively nightlife experience.'),
                        PostWidget(
                            name: 'Daniel San',
                            postText:
                                'I Love that now I can hear music on my morning walking when I go to work. That was a very good Idea. Everyone seems very happy now.'),
                        PostWidget(
                            name: 'Jonny Laurence',
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
      ),
    );
  }
}
