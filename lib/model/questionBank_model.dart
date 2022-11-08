import 'dart:convert';

class QuestionBankModel {
  final String? id;
  final String? question;
  final String? answer;
  final List<String>? options;
  final String? subject;
  final String? teacherEmail;
  final String? teacherName;

  const QuestionBankModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.options,
    required this.subject,
    required this.teacherEmail,
    required this.teacherName,
   
  });

  factory QuestionBankModel.fromMap(Map<String, dynamic> map) {
    return QuestionBankModel(
      id: map.containsKey('id') ? map['id'] : null,
      question: map.containsKey('question')
          ? map['question'].toString().replaceAll('&nl;', '\n')
          : null,
      answer: map.containsKey('answer') ? map['answer'] : null,
      options: map.containsKey('options')
          ? List.castFrom(json.decode(map['options']))
          : null,
      subject: map.containsKey('subject') ? map['subject'] : null,
      teacherEmail: map.containsKey('teacherEmail') ? map['teacherEmail'] : null,
      teacherName: map.containsKey('teacherName') ? map['teacherName'] : null,
          );
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {};
    if (id != null && id!.isNotEmpty) {
      map['id'] = id;
    }
    if (question != null && question!.isNotEmpty) {
      map['question'] = question!.replaceAll('\n', '&nl;');
    }
    if (answer != null && answer!.isNotEmpty) {
      map['answer'] = answer;
    }
    if (options != null && options!.isNotEmpty) {
      map['options'] = options;
    }
    if (subject != null && subject!.isNotEmpty) {
      map['subject'] = subject;
    }
    if (teacherEmail != null && teacherEmail!.isNotEmpty) {
      map['teacherEmail'] = teacherEmail;
    }
    if (teacherName != null && teacherName!.isNotEmpty) {
      map['teacherName'] = teacherName;
    }
    return map;
  }

  QuestionBankModel copyWith({
    String? id,
    String? question,
    String? answer,
    List<String>? options,
    String? subject,
    String? teacherEmail,
    String? teacherName,
  }) {
    return QuestionBankModel(
      id: id ?? this.id,
      question: question?.toString().replaceAll('\n', '&nl;') ??
          this.question.toString().replaceAll('\n', '&nl;'),
      answer: answer ?? this.answer,
      options: options ?? this.options,
      subject: subject ?? this.subject,
      teacherEmail: teacherEmail ?? this.teacherEmail,
      teacherName: teacherName ?? this.teacherName,
    );
  }
}
