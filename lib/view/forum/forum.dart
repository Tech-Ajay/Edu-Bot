// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edu_bot/controller/login_controller.dart';
import 'package:edu_bot/model/forum_model.dart';
import 'package:edu_bot/services/user_service.dart';
import 'package:uuid/uuid.dart';

class ForumView extends StatefulWidget {
  const ForumView({Key? key}) : super(key: key);

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  UserService userService = UserService();
  LoginViewController loginViewController = Get.find<LoginViewController>();
  List<ForumModel> myQueries = [];
  List<ForumModel> allQueries = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<ForumModel>> getUserForumQuestions(
      {required String email}) async {
    List<ForumModel> question =
        await userService.getUserForumQuestions(email: email);
    myQueries = question;
    return question;
  }

  Future<void> updateAnswer(
      {required ForumModel formModel, required List<String> ans}) async {
    // getBusy = true;
    //  listQuizzesAfterEdit(quizModel, index);
    await userService.updateAnswer(forumModel: formModel, ans: ans);
    //  getBusy = false;
  }

  Future<List<ForumModel>> getAllForumQuestions({required String email}) async {
    List<ForumModel> question =
        await userService.getAllForumQuestions(email: email);
    allQueries = question;
    return question;
  }

  Future<void> deleteForumQuestionFromHasura(String id) async =>
      await userService.deleteForumQuestion(id: id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // height:MediaQuery.of(context).size.height ,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * .5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        "Queries",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.cloud,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: questionController,
                                          decoration: InputDecoration(
                                            hintText:
                                                'What do you wanna ask or share?',
                                            filled: true,
                                            fillColor: Colors.blueGrey[50],
                                            labelStyle: TextStyle(fontSize: 12),
                                            contentPadding:
                                                EdgeInsets.only(left: 30),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      Colors.blueGrey.shade50),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      Colors.blueGrey.shade50),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: (() async {
                                          print("tapped");

                                          ForumModel forumModel = ForumModel(
                                              answers: [],
                                              id: Uuid().v1(),
                                              question: questionController.text
                                                  .trim(),
                                              creator_email:
                                                  "${loginViewController.user!.email}",
                                              creator_name:
                                                  "${loginViewController.user!.name}");
                                          print("${forumModel.creator_name}");
                                          await userService.saveForumQuestion(
                                              forumModel: forumModel);
                                          myQueries.add(forumModel);
                                          questionController.clear();
                                          setState(() {});
                                        }),
                                        child: Row(
                                          children: [
                                            Icon(Icons.mode_edit_outlined),
                                            Text("Ask"),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xff6c64fa),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 3,
                            height: MediaQuery.of(context).size.height - 300,
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
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FutureBuilder(
                                    future: getAllForumQuestions(
                                        email:
                                            loginViewController.user!.email!),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<List<ForumModel>>
                                            snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      } else {
                                        return ListView.builder(
                                            itemCount: allQueries.length,
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Question By: ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text("anonymous",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                      ],
                                                    ),
                                                    Text(
                                                      "${index + 1}: ${allQueries[index].question}",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                    Container(
                                                      height: allQueries[index]
                                                                  .answers!
                                                                  .length ==
                                                              0
                                                          ? 40
                                                          : allQueries[index]
                                                                      .answers!
                                                                      .length ==
                                                                  1
                                                              ? 80
                                                              : allQueries[index]
                                                                          .answers!
                                                                          .length ==
                                                                      2
                                                                  ? 130
                                                                  : 190,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade300,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            allQueries[index]
                                                                        .answers!
                                                                        .length ==
                                                                    0
                                                                ? Text(
                                                                    "No Answers Yet!",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold))
                                                                : Text(
                                                                    "Answers :",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                            Expanded(
                                                              child: ListView
                                                                  .builder(
                                                                      itemCount: allQueries[
                                                                              index]
                                                                          .answers!
                                                                          .length,
                                                                      scrollDirection:
                                                                          Axis
                                                                              .vertical,
                                                                      shrinkWrap:
                                                                          true,
                                                                      itemBuilder:
                                                                          (context,
                                                                              indexx) {
                                                                        List<String>
                                                                            ans =
                                                                            allQueries[index].answers![indexx].split('.');
                                                                        return Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "${indexx + 1}: ${ans[0]}",
                                                                            ),
                                                                            Text("                 answered by:- ${ans[1]}"),
                                                                          ],
                                                                        );
                                                                      }),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
//  Get.defaultDialog(
//                                     barrierDismissible: true,
//                                     content: SizedBox(
//                                       height: 400,
//                                       width: 400,
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Text(
//                                                 'Answer Below'),
//                                           ),

// Container(
//   width: 100,
//   height: 40,
                                                            // child: Padding(
                                                            //   padding: const EdgeInsets.all(8.0),
                                                            //   child: TextField(
                                                            //     controller: answerController,
                                                            //     decoration: InputDecoration(
                                                            //       hintText:
                                                            //           'Write your answer here',
                                                            //       filled: true,
                                                            //       fillColor: Colors.blueGrey[50],
                                                            //       labelStyle: TextStyle(fontSize: 12),
                                                            //       contentPadding:
                                                            //           EdgeInsets.only(left: 30),
                                                            //       enabledBorder: OutlineInputBorder(
                                                            //         borderSide: BorderSide(
                                                            //             color: Colors.blueGrey.shade50),
                                                            //         borderRadius:
                                                            //             BorderRadius.circular(5),
                                                            //       ),
                                                            //       focusedBorder: OutlineInputBorder(
                                                            //         borderSide: BorderSide(
                                                            //             color: Colors.blueGrey.shade50),
                                                            //         borderRadius:
                                                            //             BorderRadius.circular(5),
                                                            //       ),
                                                            //     ),
                                                            //   ),
                                                            //   ),
                                                            // ),

                                                            //       ],
                                                            //     ),
                                                            //   ),
                                                            //   confirm: ElevatedButton(
                                                            //     onPressed: (){
                                                            //       print("${answerController.text}");
                                                            //       Get.back;},
                                                            //     child: Text('Okay'),
                                                            //   ),
                                                            // );
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    backgroundColor: Colors
                                                                        .deepPurple
                                                                        .shade100,
                                                                    content: Container(
                                                                        height: 100,
                                                                        width: 500,
                                                                        child: Column(
                                                                          children: [
                                                                            Text(
                                                                              " Answer Below ",
                                                                              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: TextField(
                                                                                  controller: answerController,
                                                                                  decoration: InputDecoration(
                                                                                    hintText: 'Write your answer here',
                                                                                    hintStyle: TextStyle(),
                                                                                    filled: true,
                                                                                    fillColor: Colors.blueGrey[50],
                                                                                    labelStyle: TextStyle(fontSize: 12),
                                                                                    contentPadding: EdgeInsets.only(left: 30),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(color: Colors.blueGrey.shade50),
                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(color: Colors.blueGrey.shade50),
                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                    ),
                                                                                  )),
                                                                            )
                                                                          ],
                                                                        )),
                                                                    actions: [
                                                                      Center(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    primary: Color(0xff3f3d56),
                                                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    List<String> ans = allQueries[index].answers!;
                                                                                    ans.add("${answerController.text.trim()} .${loginViewController.user!.name}");

                                                                                    updateAnswer(formModel: allQueries[index], ans: ans);
                                                                                    setState(() {});

                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Text("Answer")),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 20,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    primary: Color(0xff3f3d56),
                                                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Text("Cancel")),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.edit,
                                                                size: 16,
                                                              ),
                                                              Text("Answer"),
                                                            ],
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary: Color(
                                                                0xff6c64fa),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ]);
                                            });
                                      }
                                    })),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Text(
                      "My Queries",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
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
                      height: 576,
                      width: MediaQuery.of(context).size.width * .4,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            FutureBuilder(
                                future: getUserForumQuestions(
                                    email: loginViewController.user!.email!),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<ForumModel>> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        height: 400,
                                        child: Center(
                                            child:
                                                CircularProgressIndicator()));
                                  } else {
                                    return ListView.builder(
                                        itemCount: myQueries.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .4,
                                              decoration: BoxDecoration(
                                                color: Color(0xff3f3d56),
                                                borderRadius:
                                                    BorderRadius.circular(15),
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
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  "Question By: ",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                              Text("anonymous",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            ],
                                                          ),
                                                          InkWell(
                                                              onTap: () {
                                                                deleteForumQuestionFromHasura(
                                                                    myQueries[
                                                                            index]
                                                                        .id!);
                                                                setState(() {});
                                                              },
                                                              child: Icon(Icons
                                                                  .delete_forever)),
                                                        ],
                                                      ),
                                                      Text(
                                                        "${index + 1}: ${myQueries[index].question}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Container(
                                                        height: myQueries[index]
                                                                    .answers!
                                                                    .length ==
                                                                0
                                                            ? 40
                                                            : myQueries[index]
                                                                        .answers!
                                                                        .length ==
                                                                    1
                                                                ? 70
                                                                : myQueries[index]
                                                                            .answers!
                                                                            .length ==
                                                                        2
                                                                    ? 140
                                                                    : 200,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
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
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              myQueries[index]
                                                                          .answers!
                                                                          .length ==
                                                                      0
                                                                  ? Center(
                                                                      child: Text(
                                                                          "No Answers Yet!",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight
                                                                                  .bold)))
                                                                  : Text(
                                                                      "Answers :",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                              Expanded(
                                                                child: ListView
                                                                    .builder(
                                                                        itemCount: myQueries[index]
                                                                            .answers!
                                                                            .length,
                                                                        scrollDirection:
                                                                            Axis
                                                                                .vertical,
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemBuilder:
                                                                            (context,
                                                                                indexx) {
                                                                          List<String>
                                                                              ans =
                                                                              myQueries[index].answers![indexx].split('.');
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  "${indexx + 1}: ${ans[0]}",
                                                                                ),
                                                                                Text("                 answered by:- ${ans[1]}"),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        }),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ]),
                                              ),
                                            ),
                                          );
                                        });
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
