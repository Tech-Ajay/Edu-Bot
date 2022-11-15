import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:edu_bot/controller/recorded_controller.dart';
import 'package:edu_bot/model/recorded_model.dart';
import 'package:edu_bot/view/forum/forum.dart';
import 'package:edu_bot/view/quiz/quizzes_view/quizzes_web_view.dart';
import 'package:edu_bot/view/recorded_session/elective_recorded.dart';
import 'package:edu_bot/view/recorded_session/recorded_session.dart';
import 'package:edu_bot/view/teach%20me/teach_me_custom.dart';
import 'package:edu_bot/view/teach%20me/teachme.dart';

class HomePageController extends GetxController {
  List<RecoredModel> recordData = [];

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  RxInt index = 2.obs;
  // Widget view = QuestionBankListWebView();

  // List<Widget> pages = [
  //   Quizzes(),
  //   QuestionBankListWebView(),
  //   Offstage(),
  //   Offstage()
  // ];
  Widget getPage() {
    update();
    switch (index.value) {
      case 0:
        {
          return QuizzesView();
        }
      //  case 1:
      // {

      //   //  return TeachMeCustom();
      // }
      case 2:
        {
          return TeachMe();
        }
      case 3:
        {
          return RecordedSession();
        }
      case 4:
        {
          return ForumView();
        }
      case 5:
        {
          return ElectiveRecordedSession();
        }
      default:
        {
          return Offstage();
        }
    }
  }

  // void signoutGoogle() async {
  //   userController.signOut();
  // }
}
