
class UserModel {
  final String? email;
  final String? name;
  final String? phone;
  final String? photoUrl;
  final String? gender;
  final DateTime? dateOfBirth;
    final String? password;


  const UserModel({
    required this.password,
    required this.email,
    required this.name,
    required this.phone,
    required this.photoUrl,
    required this.gender,
    required this.dateOfBirth,
   
  });

  factory UserModel.fromHasura(Map<String, dynamic> map) {
    return UserModel(
      password: map.containsKey('password') ? map['password'] : null,
      email: map.containsKey('email') ? map['email'] : null,
      name: map.containsKey('name') ? map['name'] : null,
      phone: map.containsKey('phone') ? map['phone'] : null,
      photoUrl: map.containsKey('photoUrl') ? map['photoUrl'] : null,
      gender: map.containsKey('gender') ? map['gender'] : null,
      dateOfBirth: map.containsKey('dateOfBirth')
          ? DateTime.parse(map['dateOfBirth'])
          : null,
    );
  }

  UserModel copyWith({
    String? password,
    String? email,
    String? name,
    String? phone,
    String? photoUrl,
    String? gender,
    DateTime? dateOfBirth,
    
  }) {
    return UserModel(
      password
: password
 ?? this.password
,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      gender: gender ?? this.gender,
      
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {};

 
    if (password != null && password!.isNotEmpty) {
      map['password'] = password;
    }
    if (email != null && email!.isNotEmpty) {
      map['email'] = email;
    }
    if (name != null && name!.isNotEmpty) {
      map['name'] = name;
    }
    if (phone != null && phone!.isNotEmpty) {
      map['phone'] = phone;
    }
    if (photoUrl != null && photoUrl!.isNotEmpty) {
      map['photoUrl'] = photoUrl;
    }
    if (gender != null && gender!.isNotEmpty) {
      map['gender'] = gender;
    }
    
    if (dateOfBirth != null) {
      map['dateOfBirth'] = dateOfBirth;
    }
       return map;
  }
}
