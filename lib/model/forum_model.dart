
import 'dart:convert';

class ForumModel {
  final String? id;
  final String? question;
  final String? creator_email;
  final String? creator_name;
  final List<String>? answers;


  const ForumModel({
    required this.answers,
    required this.id,
    required this.question,
    required this.creator_email,
    required this.creator_name,
    
   
  });

  factory ForumModel.fromHasura(Map<String, dynamic> map) {
    return ForumModel(
      id: map.containsKey('id') ? map['id'] : null,
      question: map.containsKey('question') ? map['question'] : null,
      creator_email: map.containsKey('creator_email') ? map['creator_email'] : null,
      creator_name: map.containsKey('creator_name') ? map['creator_name'] : null,
      answers: map.containsKey('answers') ? List.castFrom(json.decode(map['answers'])): null,
    );
  }

  ForumModel copyWith({
    String? id,
    String? question,
    String? creator_email,
    String? creator_name,
    List<String>? answers,
    
  }) {
    return ForumModel(
      id: id ?? this.id,
      question: question ?? this.question,
      creator_email: creator_email ?? this.creator_email,
      creator_name: creator_name ?? this.creator_name,
      answers: answers ?? this.answers,
          );
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {};

 
  
    if (id != null && id!.isNotEmpty) {
      map['id'] = id;
    }
    if (question != null && question!.isNotEmpty) {
      map['question'] = question;
    }
    if (creator_email != null && creator_email!.isNotEmpty) {
      map['creator_email'] = creator_email;
    }
    if (creator_name != null && creator_name!.isNotEmpty) {
      map['creator_name'] = creator_name;
    }
    if (answers != null && answers!.isNotEmpty) {
      map['answers'] = answers;
    }
    
    
       return map;
  }
}
