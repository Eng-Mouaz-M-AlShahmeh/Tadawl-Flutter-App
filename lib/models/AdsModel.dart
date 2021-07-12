/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
class AdsModel {
  String idDescription;
  String lat;
  String lng;
  String ads_city;
  String ads_neighborhood;
  String ads_road;
  String video;
  String space;
  String price;
  String description;
  String idTypeRes;
  String idTypeAqar;
  String idInterface;
  String idAdderRelation;
  String idMarketerRelation;
  String idAdsImages;
  String ads_image;
  String idAds;
  String title;
  String timeAdded;
  String timeUpdated;
  String views;
  String idSpecial;
  String idCategory;
  String idUser;
  String idCity;
  String id_fav;
  String isFav;
  String id_ads;
  String phone_faved_user;
  String state_aqar;
  String vr_id_description;
  bool isClicked;
  // ignore: sort_constructors_first
  AdsModel(
      {this.idDescription,
      this.lat,
      this.lng,
      this.ads_city,
      this.ads_neighborhood,
      this.ads_road,
      this.video,
      this.space,
      this.price,
      this.description,
      this.idTypeRes,
      this.idTypeAqar,
      this.idInterface,
      this.idAdderRelation,
      this.idMarketerRelation,
      this.idAdsImages,
      this.ads_image,
      this.idAds,
      this.title,
      this.timeAdded,
      this.timeUpdated,
      this.views,
      this.idSpecial,
      this.idCategory,
      this.idUser,
      this.idCity,
      this.id_fav,
      this.isFav,
      this.id_ads,
      this.phone_faved_user,
      this.state_aqar,
      this.vr_id_description,
      this.isClicked});
  // ignore: sort_constructors_first
  AdsModel.fromJson(Map<String, dynamic> json) {
    idDescription = json['id_description'];
    lat = json['lat'];
    lng = json['lng'];
    ads_city = json['ads_city'];
    ads_neighborhood = json['ads_neighborhood'];
    ads_road = json['ads_road'];
    video = json['video'];
    space = json['space'];
    price = json['price'];
    description = json['description'];
    idTypeRes = json['id_typeRes'];
    idTypeAqar = json['id_type_aqar'];
    idInterface = json['id_interface'];
    idAdderRelation = json['id_adder_relation'];
    idMarketerRelation = json['id_marketer_relation'];
    idAdsImages = json['id'];
    ads_image = json['ads_image'];
    idAds = json['id'];
    title = json['title'];
    timeAdded = json['timeAdded'];
    timeUpdated = json['timeUpdated'];
    views = json['views'];
    idSpecial = json['id_special'];
    idCategory = json['id_category'];
    idUser = json['id_user'];
    idCity = json['id_city'];
    id_fav = json['id_fav'];
    isFav = json['isFav'];
    id_ads = json['id'];
    phone_faved_user = json['phone_faved_user'];
    state_aqar = json['state_aqar'];
    vr_id_description = json['vr_id_description'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_description'] = idDescription;
    data['lat'] = lat;
    data['lng'] = lng;
    data['ads_city'] = ads_city;
    data['ads_neighborhood'] = ads_neighborhood;
    data['ads_road'] = ads_road;
    data['video'] = video;
    data['space'] = space;
    data['price'] = price;
    data['description'] = description;
    data['id_typeRes'] = idTypeRes;
    data['id_type_aqar'] = idTypeAqar;
    data['id_interface'] = idInterface;
    data['id_adder_relation'] = idAdderRelation;
    data['id_marketer_relation'] = idMarketerRelation;
    data['id'] = idAdsImages;
    data['ads_image'] = ads_image;
    data['id'] = idAds;
    data['title'] = title;
    data['timeAdded'] = timeAdded;
    data['timeUpdated'] = timeUpdated;
    data['views'] = views;
    data['id_special'] = idSpecial;
    data['id_category'] = idCategory;
    data['id_user'] = idUser;
    data['id_city'] = idCity;
    data['id_fav'] = id_fav;
    data['isFav'] = isFav;
    data['id'] = id_ads;
    data['phone_faved_user'] = phone_faved_user;
    data['state_aqar'] = state_aqar;
    data['vr_id_description'] = vr_id_description;
    return data;
  }
}
