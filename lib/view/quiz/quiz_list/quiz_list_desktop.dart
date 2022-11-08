part of quiz_list_web_view.dart;

class _QuizListDesktop extends StatefulWidget {
 final QuizListController controller;

  const _QuizListDesktop({
     required this.controller,
     Key? key})
      : super(key: key);

  @override
  State<_QuizListDesktop> createState() => _QuizListDesktopState();
}

class _QuizListDesktopState extends State<_QuizListDesktop> {
  @override
  Widget build(BuildContext context) {
    final screenWdth = MediaQuery.of(context).size.width;
     final screenHeight = MediaQuery.of(context).size.height-300;

    return SingleChildScrollView(
      child: FutureBuilder(
          future: widget.controller.getQuizList(),

          builder: (
             BuildContext 
          context,
             AsyncSnapshot<List<QuizModel>> 
              snapshot) {

               if(!snapshot.hasData){ 
           return   Center(child: CircularProgressIndicator());
               }
      else {
                 return
           
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        QuizModel quizModel =widget.controller.listOfQuizes.elementAt(index);
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 200, right: 200),
                              child: Card(
                                shape: RoundedRectangleBorder(
    side: BorderSide(color: Color(0xff6c64fa), width: 2),
    borderRadius: BorderRadius.circular(10),
  ),
                                color: Colors.white,
                                margin: const EdgeInsets.only(
                                    top: 12.0,
                                    bottom: 0,
                                    left: 12,
                                    right: 12),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(
                                                        8.0),
                                                child: Text(
                                                  "${widget.controller.listOfQuizes[index].subject}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(
                                                        8.0),
                                                child: RichText(
                                                    text:
                                                        TextSpan(children: [
                                                  TextSpan(
                                                      text: "Topic:",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .black)),
                                                  TextSpan(
                                                      text:
                                                          "${widget.controller.listOfQuizes[index].topic}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                ])),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(
                                                        8.0),
                                                child: RichText(
                                                    text:
                                                        TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "No Of Questions:",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .black)),
                                                  TextSpan(
                                                      text:
                                                          ' "${widget.controller.listOfQuizes[index].qid!.length}" ',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                ])),
                                              ),
                                             
                                            ],
                                          ),
                                         
                                         widget.controller.listofScore.where((element) => element.qid== widget.controller.listOfQuizes[index].quizId).isEmpty ?
                                          SizedBox(
                                            width: 250,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .stretch,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                              await widget.controller.getQuestions(index);
                                                            Navigator.push(context,MaterialPageRoute(builder: (_)=>Quizz(questionModelList: widget.controller.listOfQuestions,index: index,)));
                                                          
                                                    },
                                                    child: Text(
                                                      " Play Quiz ",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              Colors.white),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(Color(0xff6c64fa)),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      // QuizModel result =
                                                      //     await showDialog(
                                                      //         context:
                                                      //             context,
                                                      //         builder: (BuildContext
                                                      //                 context) =>
                                                      //             CreateQuiz(
                                                      //               quizModel:
                                                      //                   quizModel,
                                                      //             ));
                                                      // controller
                                                      //     .reScheduleQuiz(
                                                      //         quizModel:
                                                      //             result,
                                                      //         index: index);
                                                    },
                                                    child: Text(
                                                      "Remind Me Later",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              Colors.white),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(                           Color(0xff3f3d56),
),
                                                    ),
                                                  ),
                                                ),
                                               // !quizModel.cancelledQuiz!?
                                                     Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 8.0),
                                                        child:
                                                            ElevatedButton(
                                                          onPressed:
                                                              () async {
                                                            Get
                                                                .defaultDialog(
                                                                    title:
                                                                        "Alert",
                                                                    titleStyle: TextStyle(
                                                                        fontSize:
                                                                            25,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight: FontWeight
                                                                            .bold),
                                                                    titlePadding: EdgeInsets.only(
                                                                        top:
                                                                            30),
                                                                    contentPadding: EdgeInsets.fromLTRB(
                                                                        30,
                                                                        30,
                                                                        30,
                                                                        20),
                                                                    content:
                                                                        Text(
                                                                      'Are you sure you want to cancel this quiz?',
                                                                      style: TextStyle(
                                                                          fontSize: 20,
                                                                          color: Colors.black,
                                                                          fontWeight: FontWeight.w500),
                                                                    ),
                                                                    confirm:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(18.0),
                                                                      child:
                                                                          ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                              
                                                                    
                                                                        },
                                                                        child:
                                                                          Text('Confirm'),
                                                                            style:
                                                                              ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark)),
                                                                      ),
                                                                    ),
                                                                    cancel:
                                                                        Padding(
                                                                 
                                                                      padding:
                                                                          const EdgeInsets.all(18.0),
                                                                      child: ElevatedButton(
                                                                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark)),
                                                                          onPressed: () => Get.back(),
                                                                          child: Text('Cancel')),
                                                                    ));
                                                          },
                                                          child: Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    15,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          style:
                                                              ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty.all<
                                                                        Color>(
                                                                    Color(0xff3f3d56)),
                                                          ),
                                                        ),
                                                      )
                                                    //: Offstage(),
                                              ],
                                            ),
                                          ): Column(
                                            children: [
                                              Text("Score"),
                                              Text("${widget.controller.listofScore[0].score.toString()}/${widget.controller.listOfQuizes[index].qid!.length}"),

                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                
                          ],
                        );
                      },
                      itemCount:
                       widget.controller.listOfQuizes.length,
                    );
      }
                }) );
  
  
  }

  
}
