class DoctorModel {
  String? text;
  String? name;
  String? location;
  String? image;
  String? uId;

  DoctorModel({this.text, this.name, this.location, this.image,this.uId});

  DoctorModel.fromJson(json) {
    text = json['text'];
    name = json['name'];
    location = json['location'];
    image = json['image'];
    uId = json['uId'];

  }
}
