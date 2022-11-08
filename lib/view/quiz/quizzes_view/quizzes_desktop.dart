part of quizzes_web_view.dart;

class _Quizzes_desktop extends StatelessWidget {
  final QuizzesController controller;
  const _Quizzes_desktop({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
padding: const EdgeInsets.only(
                    left: 250, right: 218, top: 0, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                         Image.asset(
                            "assets/images/quizhome.png",
                            width: MediaQuery.of(context).size.width * .15,
                          ),
                  ],
                ),
              ),
//               Padding(
// padding: const EdgeInsets.only(
//                     left: 218, right: 218, top: 8, bottom: 8),                child: Obx(
//                   () => Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Wrap(
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   controller.indexPage.value = 0;
//                                 },
//                                 child: Text(
//                                   " UPCOMING QUIZZES ",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 ),
//                                 style: ButtonStyle(
//                                   backgroundColor: controller.indexPage.value !=
//                                           0
//                                       ? MaterialStateProperty.all<Color>(
//                                           Color(0xff3f3d56))
//                                       : MaterialStateProperty.all<Color>(
//                                           Color(0xff6c64fa)),
//                                 ),
//                               ),
//                               const SizedBox(width: 20),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   controller.indexPage.value = 1;
//                                   print(controller.indexPage.value);
//                                 },
//                                 child: Center(
//                                   child: Text(
//                                     " PAST QUIZZES ",
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                                 style: ButtonStyle(
//                                   backgroundColor: controller.indexPage.value ==
//                                           0
//                                       ? MaterialStateProperty.all<Color>(
//                                           Color(0xff3f3d56))
//                                       : MaterialStateProperty.all<Color>(
//                                           Color(0xff6c64fa)),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       // Center(
//                       //   child: SizedBox(
//                       //     height: 40,
//                       //     child: ElevatedButton.icon(
                            
//                       //       onPressed: () async {
                            
//                       //       },
                            
//                       //       icon: const Icon(
//                       //         Icons.add,
//                       //         size: 16,
//                       //       ),
//                       //       label: Padding(
//                       //         padding: const EdgeInsets.fromLTRB(8,12,8,12),
//                       //         child: Center(
//                       //             child: const Text(
//                       //           'CREATE NEW QUIZ',
//                       //           style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
//                       //         )),
//                       //       ),
//                       //       // style: ButtonStyle(
//                       //       //   backgroundColor:
//                       //       //       MaterialStateProperty.all(OleSchoolTheme.themeColor.accentColor),
//                       //       // ),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
              
                  // controller.indexPage.value == 0
                      // ? 
                      QuizList(),
                      // : PastQuiz();
                
            ],
          ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: GetBuilder<QuizzesController>(builder: (controller) {
          //     return Visibility(
          //       child: InkWell(
          //         // onTap: () async {
          //         //   await showDialog(
          //         //       context: context,
          //         //       builder: (BuildContext context) {
          //         //         return TeacherApproval();
          //         //       }).then((value) async {
          //         //     await controller.refreshApprovals();
          //         //   });
          //         // },
          //       //   child: Container(
          //       //     decoration: BoxDecoration(
          //       //         color: Theme.of(context).colorScheme.secondary,
          //       //         borderRadius: BorderRadius.only(
          //       //             bottomLeft: Radius.circular(10),
          //       //             bottomRight: Radius.circular(10))),
          //       //     //child: Center(child: Text("Invisible",style: TextStyle(fontSize: 20,color: Colors.black,decoration: TextDecoration.underline),))
          //       //     child: Padding(
          //       //       padding: const EdgeInsets.all(8.0),
          //       //       child: RichText(
          //       //           text: TextSpan(children: [
          //       //         TextSpan(
          //       //           text:
          //       //               // '${controller.noOfApprovals}
          //       //               ' Approval Pending  ',
          //       //           style: TextStyle(
          //       //             fontSize: 12,
          //       //             fontWeight: FontWeight.w500,
          //       //             color: Colors.white,
          //       //           ),
          //       //         ),
          //       //         TextSpan(
          //       //             text: ' see details',
          //       //             style: TextStyle(
          //       //                 fontSize: 10,
          //       //                 decoration: TextDecoration.underline,
          //       //                 color: Theme.of(context).primaryColorDark)),
          //       //       ])),
          //       //     ),
          //       //   ),
          //       // ),
          //       maintainSize: true,
          //       maintainAnimation: true,
          //       maintainState: true,
          //       // visible: controller.noOfApprovals > 0,
          //     );
          //   }),
          // ),
        ],
      ),
    );
  }
}
