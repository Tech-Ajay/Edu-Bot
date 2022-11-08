import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/controller/home_page_controller.dart';
import 'package:hackathon/controller/login_controller.dart';
import 'package:hackathon/services/user_service.dart';

class HomePage extends StatefulWidget {
    final HomePageController controller;

  const HomePage({ Key? key,required this.controller }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  UserService userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          backgroundColor: Theme.of(context).bottomAppBarColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(child: Obx(() {
                return Text(
                  "QUIZZES",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                      decoration: widget.controller.index.value == 0
                          ? TextDecoration.underline
                          : TextDecoration.none),
                );
              }), onTap: () {
                widget.controller.index.value = 0;

                widget.controller.getPage();
                widget.controller.update();
                // controller.getPage();
              }),
              InkWell(
                  child: Obx(
                    () => Text(
                      "Teach Me",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          decoration: widget.controller.index.value == 2
                              ? TextDecoration.underline
                              : TextDecoration.none),
                    ),
                  ),
                  onTap: () {
                  widget.  controller.index.value = 2;
                   widget. controller.getPage();
                   widget. controller.update();
                    // controller.getPage();
                  }),
              InkWell(
                  child: Obx(
                    () => Text(
                      "Recorded Session",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          decoration: widget.controller.index.value == 3
                              ? TextDecoration.underline
                              : TextDecoration.none),
                    ),
                  ),
                  onTap: () {
                    widget.controller.index.value = 3;
                    widget.controller.getPage();
                    widget.controller.update();
                  }),
                  InkWell(
                  child: Obx(
                    () => Text(
                      "Forum",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          decoration: widget.controller.index.value == 4
                              ? TextDecoration.underline
                              : TextDecoration.none),
                    ),
                  ),
                  onTap: () {
                    widget.controller.index.value = 4;
                    widget.controller.getPage();
                    widget.controller.update();
                  }),
                  InkWell(
                  child: Obx(
                    () => Text(
                      "Elective",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          decoration: widget.controller.index.value == 5
                              ? TextDecoration.underline
                              : TextDecoration.none),
                    ),
                  ),
                  onTap: () {
                    widget.controller.index.value = 5;
                    widget.controller.getPage();
                    widget.controller.update();
                  }),
              Row(
                children: [
                  // Column(
                  //   children: [
                  //     Text(
                  //       "Welcome Back",
                  //       style: TextStyle(fontSize: 10, color: Colors.black),
                  //     ),
                  //     GetBuilder<LoginViewController>(builder: (builderController) {
                  //       return Text(
                  //         "${builderController.user!.name ?? ''}",
                  //         style: TextStyle(fontSize: 15, color: Colors.black),
                  //       );
                  //     }),
                  //     // GetBuilder<RoleController>(builder: (builderController) {
                  //     //   return Text(
                  //     //     "${builderController.selectedInstitute.value.name ?? ''}",
                  //     //     style: TextStyle(fontSize: 15, color: Colors.black),
                  //     //   );
                  //     // }),
                  //   ],
                  // ),
                
                            PopupMenuItem(
                              child: Text("Logout"),
                              value: 2,
                              onTap: () {
                                // controller.signoutGoogle();
                              },
                            )
                          ])
                ],
              ),
            
          ),
        backgroundColor: Colors.white60,
        
        body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/electivebg.PNG"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: GetBuilder<HomePageController>(
          // builder: (controller) => controller.pages[controller.index.value],
          builder: (controller) => controller.getPage(),
        ) /* add child content here */,
      ),

        );
  }
}