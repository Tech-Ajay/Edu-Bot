
class ScoreModel {
  final String? id;
  final String? qid;
  final String? user_mail;
  final int? score;

  const ScoreModel({
    required this.id,
    required this.qid,
    required this.user_mail,
    required this.score,
   
  });

  factory ScoreModel.fromHasura(Map<String, dynamic> map) {
    return ScoreModel(
      id: map.containsKey('id') ? map['id'] : null,
      qid: map.containsKey('qid') ? map['qid'] : null,
      user_mail: map.containsKey('user_mail') ? map['user_mail'] : null,
      score: map.containsKey('score') ? map['score'] : null,
    
    );
  }

  ScoreModel copyWith({
    String? id,
    String? qid,
    String? user_mail,
    int? score,
  
    
  }) {
    return ScoreModel(
      id: id ?? this.id,
      qid: qid ?? this.qid,
      user_mail: user_mail ?? this.user_mail,
      score: score ?? this.score,
     
    );
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {};

 
   
    if (id != null && id!.isNotEmpty) {
      map['id'] = id;
    }
    if (qid != null && qid!.isNotEmpty) {
      map['qid'] = qid;
    }
    if (user_mail != null && user_mail!.isNotEmpty) {
      map['user_mail'] = user_mail;
    }
    if (score != null) {
      map['score'] = score;
    }
       return map;
  }
}
