class UserModel {
  String userId, email, name, pic;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> map) {
    return UserModel(
      userId: map["userId"],
      email: map["email"],
      name: map["name"],
      pic: map["pic"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
