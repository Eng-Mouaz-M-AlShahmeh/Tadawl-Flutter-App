/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
class OfficeModel {
  String id_offices;
  String office_name;
  String office_lat;
  String office_lng;
  String sejel;
  String sejel_image;
  String state;
  String phone_user;
  // ignore: sort_constructors_first
  OfficeModel(
      {this.id_offices,
      this.office_name,
      this.office_lat,
      this.office_lng,
      this.sejel,
      this.sejel_image,
      this.state,
      this.phone_user});
  // ignore: sort_constructors_first
  OfficeModel.fromJson(Map<String, dynamic> json) {
    id_offices = json['id_offices'];
    office_name = json['office_name'];
    office_lat = json['office_lat'];
    office_lng = json['office_lng'];
    sejel = json['sejel'];
    sejel_image = json['sejel_image'];
    state = json['state'];
    phone_user = json['phone_user'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_offices'] = id_offices;
    data['office_name'] = office_name;
    data['office_lat'] = office_lat;
    data['office_lng'] = office_lng;
    data['sejel'] = sejel;
    data['sejel_image'] = sejel_image;
    data['state'] = state;
    data['phone_user'] = phone_user;
    return data;
  }
}
