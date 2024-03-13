class MessageModel {
  String? senderName;
  String? location;
  String? uId;

  MessageModel({this.senderName, this.location, this.uId});

  MessageModel.fromJson(json) {
    senderName = json['senderName'];
    location = json['location'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'senderName': senderName,
      'location': location,
      'uId': uId,
    };
  }
}
