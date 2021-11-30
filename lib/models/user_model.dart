class UserModel {
  String? uid;
  String? fullName;
  int? phone;
  String? email;

  UserModel({this.uid, this.fullName, this.phone, this.email});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      phone: map['phone'],
      email: map['email'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'phone': phone,
      'email': email,
    };
  }
}
