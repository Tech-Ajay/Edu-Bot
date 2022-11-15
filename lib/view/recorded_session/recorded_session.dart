import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edu_bot/controller/recorded_controller.dart';
import 'package:edu_bot/model/recorded_model.dart';
import 'package:edu_bot/view/recorded_session/video.dart';

class RecordedSession extends StatefulWidget {
  const RecordedSession({Key? key}) : super(key: key);

  @override
  State<RecordedSession> createState() => _RecordedSessionState();
}

class _RecordedSessionState extends State<RecordedSession> {
  //   RecordController recordController = Get.put(RecordController());
  late List<String> subject = [
    "English",
    "English",
    "English",
    "English",
    "English",
    "English",
    "English",
    "English"
  ];
  List<String> topic = [
    "Grammer",
    "Noun",
    "Story 1",
    "Story 2",
    "Grammer",
    "Noun",
    "Story 1",
    "Story 2"
  ];
  List<String> asset = [
    "assets/video/grammer.mp4",
    "assets/video/noun.mp4",
    "assets/video/story1.mp4",
    "assets/video/story2.mp4",
    "assets/video/grammer.mp4",
    "assets/video/noun.mp4",
    "assets/video/story1.mp4",
    "assets/video/story2.mp4"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff6c64fa),
                  borderRadius: BorderRadius.circular(15),
                  // boxShadow: [
                  //   BoxShadow(
                  // color: Colors.pink.shade200,
                  //     spreadRadius: 2,
                  //     blurRadius: 4,
                  //   ),
                  // ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text(
                    " Recorded Session ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.height - 150,
                  // color: Colors.deepPurple.shade300,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                        scrollDirection: Axis.vertical,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        crossAxisCount: 3,
                        // shrinkWrap: true,

                        //reverse: false,

                        children: List.generate(subject.length, (index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => VideoView(
                                        asset: '${asset[index]}',
                                      )));

                              //
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff3f3d56),
                                borderRadius: BorderRadius.circular(15),
                                // boxShadow: [
                                //   BoxShadow(
                                // color: Colors.pink.shade200,
                                //     spreadRadius: 2,
                                //     blurRadius: 4,
                                //   ),
                                // ],
                              ),
                              height: 200,
                              width: 200,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Subject: ${subject[index]}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Topic: ${topic[index]}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        })),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/recordedsesh.png",
              width: MediaQuery.of(context).size.width * .5,
            ),
          ],
        )
      ],
    );
  }
}
