library quiz_list_web_view.dart;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edu_bot/controller/quiz_list_controller.dart';
import 'package:edu_bot/model/questionBank_model.dart';
import 'package:edu_bot/model/quiz_model.dart';
import 'package:edu_bot/view/quiz/quiz_list/quizz.dart';

part 'quiz_list_desktop.dart';

class QuizList extends GetView<QuizListController> {
  QuizList({Key? key}) : super(key: key);

  final QuizListController quizListController = Get.put(QuizListController());

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => _QuizListDesktop(
        controller: quizListController,
      ),
    );
  }
}
