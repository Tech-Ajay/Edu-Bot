import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hackathon/view/recorded_session/video.dart';

class ElectiveRecordedSession extends StatefulWidget {
  const ElectiveRecordedSession({Key? key}) : super(key: key);

  @override
  State<ElectiveRecordedSession> createState() =>
      _ElectiveRecordedSessionState();
}

class _ElectiveRecordedSessionState extends State<ElectiveRecordedSession> {
  //   RecordController recordController = Get.put(RecordController());
  List<String> subject = [
    "Excel",
    "Java",
    "Python",
    "Cloud Computing",
    "Public Speaking",
    "Electric Vehicle",
    "Marketing",
    "Business Studies",
    "Java Advanced",
  ];

  List<String> asset = [
    "assets/video/elective/excel.mp4",
    "assets/video/elective/java.mp4",
    "assets/video/elective/python.mp4",
    "assets/video/elective/Cloud computing.mp4",
    "assets/video/elective/public speaking.mp4",
    "assets/video/elective/electric vehicle.mp4",
    "assets/video/elective/Marketing.mp4",
    "assets/video/elective/Marketing.mp4",
    "assets/video/elective/java.mp4",
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .4,
              height: MediaQuery.of(context).size.height - 105,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Text(
                        " Elective ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Image.asset(
                    "images/electivee.png",
                    width: MediaQuery.of(context).size.width * .4,
                    height: MediaQuery.of(context).size.height - 300,
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height - 105,
                // color: Colors.deepPurple.shade300,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                      scrollDirection: Axis.vertical,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
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
                              // height: 50,
                              // width: 50,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // SizedBox(
                                          //   width: 20,
                                          // ),
                                          // Image.asset(
                                          //   "images/google.png",
                                          //   height: 30,
                                          // ),
                                          // SizedBox(
                                          //   width: 20,
                                          // ),
                                          Text(
                                            " ${subject[index]} ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      })),
                )),
          ],
        ),
      ],
    );
  }
}
