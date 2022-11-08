import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/controller/quiz_list_controller.dart';
import 'package:hackathon/model/questionBank_model.dart';
import 'package:hackathon/model/score_model.dart';
import 'package:hackathon/services/user_service.dart';
import 'package:uuid/uuid.dart';

class Quizz extends StatefulWidget {
  List<QuestionBankModel> questionModelList;
  int index;
  Quizz({Key? key, required this.questionModelList, required this.index})
      : super(key: key);

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  QuizListController controller = Get.find<QuizListController>();
  UserService userService = UserService();

  int questionindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
                              color: Colors.white,

        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Column(
                children: [
                                SizedBox(height: 100,),

                         Image.asset(
                            "assets/images/quiz.png",
                            width: MediaQuery.of(context).size.width * .25,
                          ),
                ],
              ),
              SizedBox(width: 50,),
              Column(
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
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Text(
                        " ${widget.questionModelList[questionindex].subject} Quiz ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                               SizedBox(height: 30,),

                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,

                        // boxShadow: [
                        //   BoxShadow(
                        // color: Colors.pink.shade200,
                        //     spreadRadius: 2,
                        //     blurRadius: 4,
                        //   ),
                        // ],
                      ),
                      width: 600,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 750,
                            height: MediaQuery.of(context).size.height - 600,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${widget.questionModelList[questionindex].question}"),
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: controller.options[0],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            controller.options[0] = value!;
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            "${widget.questionModelList[questionindex].options![0]}"),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: controller.options[1],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            controller.options[1] = value!;
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            "${widget.questionModelList[questionindex].options![1]}"),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.deepPurple,
                                          padding:
                                              EdgeInsets.symmetric(horizontal: 10),
                                        ),
                                        onPressed: () async {
                                          int index = controller.options
                                              .indexWhere((element) => element);
                                          if (widget.questionModelList[questionindex]
                                                  .answer ==
                                              widget.questionModelList[questionindex]
                                                  .options![index]) {
                                            controller.answer++;
                                          }
                                          setState(() {});

                                          if ((widget.questionModelList.length - 1) ==
                                              questionindex) {
                                            print(controller.answer);
                                            ScoreModel scoreModel = ScoreModel(
                                                id: Uuid().v1(),
                                                qid: controller
                                                    .listOfQuizes[widget.index]
                                                    .quizId,
                                                user_mail: controller
                                                    .listOfQuizes[widget.index]
                                                    .teacherEmail,
                                                score: controller.answer);

                                            await userService.saveScore(
                                                scoreModel: scoreModel);
                                            await Get.delete<QuizListController>();
                                            Navigator.pop(context);
                                          } else {
                                            questionindex++;
                                            controller.options =
                                                List.filled(2, false).obs;
                                          }
                                        },
                                        child: Text(
                                            (widget.questionModelList.length - 1) ==
                                                    questionindex
                                                ? "finish"
                                                : "Next")),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                children: [
                         Image.asset(
                            "assets/images/quiz2.png",
                            width: MediaQuery.of(context).size.width * .25,
                          ),
                                        SizedBox(height: 80,),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
