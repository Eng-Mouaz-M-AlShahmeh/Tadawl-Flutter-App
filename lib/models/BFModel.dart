/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
class BFModel {
  String id_BF_aqar;
  String state;
  String id_description;
  String id_BFAT;
  String title;
  String eng_title;
  // ignore: sort_constructors_first
  BFModel({
    this.id_BF_aqar,
    this.state,
    this.id_description,
    this.id_BFAT,
    this.title,
    this.eng_title,
  });
  // ignore: sort_constructors_first
  BFModel.fromJson(Map<String, dynamic> json) {
    id_BF_aqar = json['id_BF_aqar'];
    state = json['state'];
    id_description = json['id_description'];
    id_BFAT = json['id_BFAT'];
    title = json['title'];
    eng_title = json['eng_title'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_BF_aqar'] = id_BF_aqar;
    data['state'] = state;
    data['id_description'] = id_description;
    data['id_BFAT'] = id_BFAT;
    data['title'] = title;
    data['eng_title'] = eng_title;
    return data;
  }
}
