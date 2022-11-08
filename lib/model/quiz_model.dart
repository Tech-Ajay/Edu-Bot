import 'dart:convert';

class QuizModel {

  final List<String>? qid;

  final String? subject;
    final String? topic;

  final String? teacherEmail;
  final String? teacherName;
  final String? quizId;
  


  const QuizModel({
    required this.subject,
        required this.topic,

    required this.qid,
    required this.teacherEmail,
    required this.teacherName,
    required this.quizId,
   
  });

  factory QuizModel.fromHasura(Map<String, dynamic> map) {
    return QuizModel(
          qid: map.containsKey('qid')
          ? List.castFrom(json.decode(map['qid'].toString()))
          : null,
      subject: map.containsKey('subject') ? map['subject'] : null,
            topic: map.containsKey('topic') ? map['topic'] : null,

      teacherEmail: map.containsKey('teacherEmail') ? map['teacherEmail'] : null,
      teacherName: map.containsKey('teacherName') ? map['teacherName'] : null,
      quizId: map.containsKey('quizId') ? map['quizId'] : null,
          );
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {};
    if (qid != null) {
      map['qid'] = qid;
    }
    if (subject != null && subject!.isNotEmpty) {
      map['subject'] = subject;
    }
    if (topic != null && topic!.isNotEmpty) {
      map['topic'] = topic;
    }
    if (teacherEmail != null && teacherEmail!.isNotEmpty) {
      map['teacherEmail'] = teacherEmail;
    }
    if (teacherName != null && teacherName!.isNotEmpty) {
      map['teacherName'] = teacherName;
    }
    if (quizId != null && quizId!.isNotEmpty) {
      map['quizId'] = quizId;
    }
    return map;
  }

  QuizModel copyWith({
        List<String>? qid,

    String? subject,
    String? teacherEmail,
    String? teacherName,
        String? topic,

        final String? quizId,
  }) {
    return QuizModel(
      qid: qid ?? this.qid,
      subject: subject ?? this.subject,
            topic: topic ?? this.topic,

      teacherEmail: teacherEmail ?? this.teacherEmail,
      teacherName: teacherName ?? this.teacherName,
       quizId: quizId ?? this.quizId,
    );
  }
}
