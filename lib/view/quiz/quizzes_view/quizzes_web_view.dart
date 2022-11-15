library quizzes_web_view.dart;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:edu_bot/controller/quizzes_controller.dart';
import 'package:edu_bot/view/quiz/quiz_list/quiz_list_web_view.dart';

part 'quizzes_mobile.dart';
part 'quizzes_desktop.dart';

class QuizzesView extends GetView<QuizzesController> {
  QuizzesView({Key? key}) : super(key: key);

  final QuizzesController quizzesController = Get.put(QuizzesController());

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) =>
          //ScreenTypeLayout(
          // mobile: _QuizzesMobile(
          //   controller: quizzesController,
          // ),
          // desktop:
          _Quizzes_desktop(
        controller: quizzesController,
      ),
    );
  }
}
