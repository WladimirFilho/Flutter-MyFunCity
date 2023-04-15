import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myfuncitynew/pages/find_pages/find_out_text_block_widget.dart';
import 'package:myfuncitynew/widgets/custom_app_bar_widget.dart';

class FindMainPage extends StatefulWidget {
  const FindMainPage({super.key});

  @override
  State<FindMainPage> createState() => _FindMainPageState();
}

class _FindMainPageState extends State<FindMainPage> {
  bool isLoading = false;
  List<Map<String, dynamic>> news = [];

  // get news from Firestore and convert QuerySnapshot to a Map<String, dynamic>
  Future<void> getNewsFromFirestore() async {
    setState(() {
      isLoading = true;
    });

    FirebaseFirestore db = FirebaseFirestore.instance;
    var data = await db.collection('myfuncity_news').get();
    List<Map<String, dynamic>> myFunCityNewsList =
        data.docs.map((e) => e.data()).toList();

    setState(() {
      isLoading = false;
      news = myFunCityNewsList;
    });
  }

  @override
  void initState() {
    super.initState();
    getNewsFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
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
                            children: news
                                .map(
                                  (e) => FindOutTextBlockWidget(
                                    title: e['title'] ?? 'Not avaliable',
                                    content: e['post'] ?? 'Not avaliable',
                                    image: e['image'] ?? 'Not avaliable',
                                  ),
                                )
                                .toList(),
                            // children: [
                            //   FindOutTextBlockWidget(
                            //     title:
                            //         'Sydney is getting free activities for kids !!!',
                            //     content:
                            //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                            //   ),
                            // ],
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
