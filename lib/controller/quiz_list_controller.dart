// import 'package:get/get.dart';

// import 'package:uuid/uuid.dart';

import 'package:get/get.dart';
import 'package:hackathon/model/questionBank_model.dart';
import 'package:hackathon/model/quiz_model.dart';
import 'package:hackathon/model/score_model.dart';
import 'package:hackathon/services/user_service.dart';

class QuizListController extends GetxController {


  UserService userService = UserService();


   RxList<bool> options = List.filled(2, false).obs;
   int answer = 0;
     List<ScoreModel> _listofScore = [];


  List<QuizModel> _listofQuizes = [];



   List<QuestionBankModel> _listOfQuestions = [];


  List<QuizModel> get listOfQuizes => this._listofQuizes;
  set listOfQuizes(List<QuizModel> value) {
    this._listofQuizes = value;
    update();
  }
   List<ScoreModel> get listofScore => this._listofScore;
  set listofScore(List<ScoreModel> value) {
    this._listofScore = value;
    update();
  }

  List<QuestionBankModel> get listOfQuestions => this._listOfQuestions;
  set listOfQuestions(List<QuestionBankModel> value) {
    this._listOfQuestions = value;
    update();
  }

  Future<List<QuizModel>> getQuizList() async {
    update();
    listOfQuizes = await userService.getListOfQuizes();
    listofScore = await userService.getListOfScores();
    return listOfQuizes;
  }


  Future <List<QuestionBankModel>> getQuestions(int index) async {

    for(int i =0;i<listOfQuizes[index].qid!.length;i++)
    {
     QuestionBankModel? qb = await userService.getQuestionFromHasura(qid: listOfQuizes[index].qid![i]);
         qb==null ?null : listOfQuestions.add(qb);
    }
    return listOfQuestions;
  }

 }
