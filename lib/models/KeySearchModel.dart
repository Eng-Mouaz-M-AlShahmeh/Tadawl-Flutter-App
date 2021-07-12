/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
class KeySearchModel {
  String id_ads;
  String id_description;
  String id_user;
  String phone;
  // ignore: sort_constructors_first
  KeySearchModel({this.id_ads, this.id_description, this.id_user, this.phone});
  // ignore: sort_constructors_first
  KeySearchModel.fromJson(Map<String, dynamic> json) {
    id_ads = json['id'];
    id_description = json['id_description'];
    id_user = json['id'];
    phone = json['phone'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id_ads;
    data['id_description'] = id_description;
    data['id'] = id_user;
    data['phone'] = phone;
    return data;
  }
}
