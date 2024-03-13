class UserModel {
  String? name;
  String? uId;
  String? email;
  String? phone;

  UserModel({this.name, this.uId, this.email, this.phone});

  UserModel.fromJson(Map<String,dynamic>json) {
    name = json['name'];
    uId = json['uId'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,

    };
  }
}
