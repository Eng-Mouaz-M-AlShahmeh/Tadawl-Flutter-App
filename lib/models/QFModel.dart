/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
class QFModel {
  String id_QF_aqar;
  String quantity;
  String id_description;
  String id_QFAT;
  String title;
  String eng_title;
  // ignore: sort_constructors_first
  QFModel({
    this.id_QF_aqar,
    this.quantity,
    this.id_description,
    this.id_QFAT,
    this.title,
    this.eng_title,
  });
  // ignore: sort_constructors_first
  QFModel.fromJson(Map<String, dynamic> json) {
    id_QF_aqar = json['id_QF_aqar'];
    quantity = json['quantity'];
    id_description = json['id_description'];
    id_QFAT = json['id_QFAT'];
    title = json['title'];
    eng_title = json['eng_title'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_QF_aqar'] = id_QF_aqar;
    data['quantity'] = quantity;
    data['id_description'] = id_description;
    data['id_QFAT'] = id_QFAT;
    data['title'] = title;
    data['eng_title'] = eng_title;
    return data;
  }
}
