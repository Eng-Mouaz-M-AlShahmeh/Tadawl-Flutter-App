/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
class UserEstimateModel {
  String id_UE;
  String phone_user;
  String phone_user_estimated;
  String rate;
  String comment;
  String sum_estimates;
  String count_estimates;
  // ignore: sort_constructors_first
  UserEstimateModel({
    this.id_UE,
    this.phone_user,
    this.phone_user_estimated,
    this.rate,
    this.comment,
    this.sum_estimates,
    this.count_estimates,
  });
  // ignore: sort_constructors_first
  UserEstimateModel.fromJson(Map<String, dynamic> json) {
    id_UE = json['id_UE'];
    phone_user = json['phone_user'];
    phone_user_estimated = json['phone_user_estimated'];
    rate = json['rate'];
    comment = json['comment'];
    sum_estimates = json['SUM(`rate`)'];
    count_estimates = json['COUNT(`rate`)'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_UE'] = id_UE;
    data['phone_user'] = phone_user;
    data['phone_user_estimated'] = phone_user_estimated;
    data['rate'] = rate;
    data['comment'] = comment;
    data['SUM(`rate`)'] = sum_estimates;
    data['COUNT(`rate`)'] = count_estimates;
    return data;
  }
}
