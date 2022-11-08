
class RecoredModel {
   final String? subject;
  final String? topic;
  final String? asset;
    

  const RecoredModel({
    required this.subject,
    required this.topic,
        required this.asset,
  });
  
  factory RecoredModel.fromHasura(Map<String, dynamic> map) {
    return RecoredModel(
      subject: map.containsKey('subject') ? map['subject'] : null,
      topic: map.containsKey('topic') ? map['topic'] : null,
      asset: map.containsKey('asset') ? map['asset'] : null,
    
    );
  }

  RecoredModel copyWith({
    String? subject,
    String? topic,
    String? asset,

    
  }) {
    return RecoredModel(
      subject
: subject
 ?? this.subject
,
      topic: topic ?? this.topic,
      asset: asset ?? this.asset,
    
    );
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {};

 
    if (subject != null && subject!.isNotEmpty) {
      map['subject'] = subject;
    }
    if (topic != null && topic!.isNotEmpty) {
      map['topic'] = topic;
    }
    if (asset != null && asset!.isNotEmpty) {
      map['asset'] = asset;
    
    }
       return map;
  }
}
