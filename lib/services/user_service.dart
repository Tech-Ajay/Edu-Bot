import 'dart:convert';

import 'package:edu_bot/model/forum_model.dart';
import 'package:edu_bot/model/questionBank_model.dart';
import 'package:edu_bot/model/quiz_model.dart';
import 'package:edu_bot/model/score_model.dart';
import 'package:edu_bot/model/user_model.dart';
import 'package:edu_bot/utils/constants.dart';
import 'package:edu_bot/utils/environment.dart';
import 'package:hasura_connect/hasura_connect.dart';

class UserService {
  final HasuraConnect hasura;
  UserService()
      : this.hasura = HasuraConnect(
          Environment.HASURA_URL,
          headers: Constants.HASURA_HEADER,
        );

  Future<UserModel?> getStudentDetails({required String email}) async {
    print(email);
    String query = """
query MyQuery {
  user_details_by_pk(email: "$email") {
    dateOfBirth
    email
    gender
    name
    password
    phone
  }
}



  """;
    Map<String, dynamic> responseMap;
    try {
      responseMap = Map.castFrom(await hasura.query(query));
    } catch (error) {
      throw error;
    }
    Map<String, dynamic> dataMap = {};
    if (!responseMap.containsKey('data')) {
      return null;
    } else {
      dataMap = responseMap['data'];
    }

    dynamic dMap = dataMap['user_details_by_pk'];
    if (dMap != null) {
      UserModel user = UserModel.fromHasura(dMap);
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<void> saveForumQuestion({
    required ForumModel forumModel,
  }) async {
    String answer =
        """${json.encode(forumModel.answers).replaceAll('"', '\\"')}""";

    String query = """
  mutation MyMutation {
  insert_forum_questions(objects: {answers: "$answer", creator_email: "${forumModel.creator_email}", creator_name: "${forumModel.creator_name}", id: "${forumModel.id}", question: "${forumModel.question}"}) {
    affected_rows
  }
}


        """;

    Map<String, dynamic> responseMap;
    try {
      print(query);
      responseMap = Map.castFrom(await hasura.mutation(query));
    } catch (error) {
      throw error;
    }
    Map<String, Map> dataMap;
    if (!responseMap.containsKey('data')) {
      return null;
    }
    dataMap = Map.castFrom(responseMap['data']);
    if (dataMap.entries.first.value.values.first == 1) {
      print("success");
    }
  }

  Future<void> saveScore({
    required ScoreModel scoreModel,
  }) async {
    String query = """
  mutation MyMutation {
  insert_score(objects: {id: "${scoreModel.id}", user_mail: "${scoreModel.user_mail}", score: "${scoreModel.score}", qid: "${scoreModel.qid}"}) {
    affected_rows
  }
}
          """;

    Map<String, dynamic> responseMap;
    try {
      print(query);
      responseMap = Map.castFrom(await hasura.mutation(query));
    } catch (error) {
      throw error;
    }
    Map<String, Map> dataMap;
    if (!responseMap.containsKey('data')) {
      return null;
    }
    dataMap = Map.castFrom(responseMap['data']);
    if (dataMap.entries.first.value.values.first == 1) {
      print("success");
    }
  }

// Future<List<ForumModel>?> getUserForumQuestions({required String email}) async {
//     print(email);
//     String query = """
// query MyQuery {
//   forum_questions(where: {creator_email: {_eq: "$email"}}) {
//     answers
//     creator_email
//     creator_name
//     id
//     question
//   }
// }

//   """;
//   Map<String, dynamic> responseMap;
//     try {
//       responseMap = Map.castFrom(await hasura.query(query));
//       }
//       catch (error) {
//       throw error;
//     }
//     Map<String, dynamic> dataMap = {};
//     if (!responseMap.containsKey('data')) {
//       return null;
//     } else {
//       dataMap = responseMap['data'];
//     }

//     dynamic dMap = dataMap['forum_questions'];
//     if (dMap != null) {
//       List<ForumMode> user = ForumModel.fromHasura(dMap);
//       if (user != null) {
//         return user;
//       } else {
//         return null;
//       }
//     } else {
//       return null;
//     }
//   }

  Future<List<ForumModel>> getUserForumQuestions(
      {required String email}) async {
    String query = """
query MyQuery {
   forum_questions(where: {creator_email: {_eq: "$email"}}) {
    answers
    creator_email
     creator_name
    id
     question
   }
 }

""";

    Map<String, dynamic> responseMap;
    try {
      responseMap = Map.castFrom(await hasura.query(query));
      Map<String, dynamic> dataMap = {};
      if (!responseMap.containsKey('data')) {
        return [];
      } else {
        dataMap = responseMap['data'];
      }
      List<dynamic> list = (dataMap['forum_questions']);
      List<ForumModel> topics =
          list.map((e) => ForumModel.fromHasura(e)).toList();
      return topics;
    } catch (error) {
      throw error;
    }
  }

  Future<List<ForumModel>> getAllForumQuestions({required String email}) async {
    String query = """
query MyQuery {
   forum_questions(where: {creator_email: {_neq: "$email"}}) {
    answers
    creator_email
     creator_name
    id
     question
   }
 }

""";

    Map<String, dynamic> responseMap;
    try {
      responseMap = Map.castFrom(await hasura.query(query));
      Map<String, dynamic> dataMap = {};
      if (!responseMap.containsKey('data')) {
        return [];
      } else {
        dataMap = responseMap['data'];
      }
      List<dynamic> list = (dataMap['forum_questions']);
      List<ForumModel> topics =
          list.map((e) => ForumModel.fromHasura(e)).toList();
      return topics;
    } catch (error) {
      throw error;
    }
  }

  Future updateAnswer(
      {required ForumModel forumModel, required List<String> ans}) async {
    String answer = """${json.encode(ans).replaceAll('"', '\\"')}""";

    String query = """
mutation MyMutation {
  update_forum_questions(where: {id: {_eq: "${forumModel.id}"}}, _set: {answers: "${answer}"}) {
    affected_rows
  }
}

""";

    Map<String, dynamic> responseMap;
    try {
      responseMap = Map.castFrom(await hasura.mutation(query));
    } catch (error) {
      throw error;
    }
    Map<String, Map> dataMap;
    if (!responseMap.containsKey('data')) {
      return null;
    }
    dataMap = Map.castFrom(responseMap['data']);
    if (dataMap.entries.first.value.values.first == 1) {}
  }

  Future<List<QuizModel>> getListOfQuizes() async {
    String query = """
query MyQuery {
  quiz_table {
    teacherName
    teacherEmail
    subject
    quizId
    topic
    qid
  }
}
""";
    Map<String, dynamic> responseMap;
    try {
      responseMap = Map.castFrom(await hasura.query(query));
      Map<String, dynamic> dataMap = {};
      if (!responseMap.containsKey('data')) {
        return [];
      } else {
        dataMap = responseMap['data'];
      }
      List<dynamic> list = (dataMap['quiz_table']);
      List<QuizModel> topics =
          list.map((e) => QuizModel.fromHasura(e)).toList();
      return topics;
    } catch (error) {
      throw error;
    }
  }

  Future<List<ScoreModel>> getListOfScores() async {
    String query = """
query MyQuery {
  score {
    user_mail
    score
    qid
    id
  }
}

""";
    Map<String, dynamic> responseMap;
    try {
      responseMap = Map.castFrom(await hasura.query(query));
      Map<String, dynamic> dataMap = {};
      if (!responseMap.containsKey('data')) {
        return [];
      } else {
        dataMap = responseMap['data'];
      }
      List<dynamic> list = (dataMap['score']);
      List<ScoreModel> topics =
          list.map((e) => ScoreModel.fromHasura(e)).toList();
      return topics;
    } catch (error) {
      throw error;
    }
  }

  Future<QuestionBankModel?> getQuestionFromHasura(
      {required String qid}) async {
    String query = """
query MyQuery {
   question_by_pk(id: "$qid") {
    answer
    id
    options
    question
    teacherName
    teacherEmail
    subject
  }
 }



  """;
    Map<String, dynamic> responseMap;
    try {
      responseMap = Map.castFrom(await hasura.query(query));
    } catch (error) {
      throw error;
    }
    Map<String, dynamic> dataMap = {};
    if (!responseMap.containsKey('data')) {
      return null;
    } else {
      dataMap = responseMap['data'];
    }

    dynamic dMap = dataMap['question_by_pk'];
    if (dMap != null) {
      QuestionBankModel user = QuestionBankModel.fromMap(dMap);
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future deleteForumQuestion({
    required String id,
  }) async {
    String query = """
mutation MyMutation {
  delete_forum_questions(where: {id: {_eq: "$id"}}) {
    affected_rows
  }
}
        """;

    Map<String, dynamic> responseMap;
    try {
      responseMap = Map.castFrom(await hasura.mutation(query));
    } catch (error) {
      throw error;
    }
    Map<String, Map> dataMap;
    if (!responseMap.containsKey('data')) {
      return null;
    }
    dataMap = Map.castFrom(responseMap['data']);
    if (dataMap.entries.first.value.values.first == 1) {}
  }
}
