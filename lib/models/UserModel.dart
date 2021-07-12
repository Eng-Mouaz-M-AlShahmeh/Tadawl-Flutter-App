/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
class UserModel {
  String id_user;
  String username;
  String company_name;
  String office_name;
  String phone;
  String email;
  String password;
  String rePassword;
  String timeRegistered;
  String lastActive;
  String verCode;
  String verified;
  String about;
  String image;
  String id_card;
  String id_mem;
  String id_AF;
  // ignore: sort_constructors_first
  UserModel({
    this.id_user,
    this.username,
    this.company_name,
    this.office_name,
    this.phone,
    this.email,
    this.password,
    this.rePassword,
    this.timeRegistered,
    this.lastActive,
    this.verCode,
    this.verified,
    this.about,
    this.image,
    this.id_card,
    this.id_mem,
    this.id_AF,
  });
  // ignore: sort_constructors_first
  UserModel.fromJson(Map<String, dynamic> json) {
    id_user = json['id'];
    username = json['username'];
    company_name = json['company_name'];
    office_name = json['office_name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    timeRegistered = json['timeRegistered'];
    lastActive = json['lastActive'];
    verCode = json['verCode'];
    verified = json['verified'];
    about = json['about'];
    image = json['image'];
    id_card = json['id_card'];
    id_mem = json['id_mem'];
    id_AF = json['id_AF'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id_user;
    data['username'] = username;
    data['company_name'] = company_name;
    data['office_name'] = office_name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['rePassword'] = rePassword;
    data['timeRegistered'] = timeRegistered;
    data['lastActive'] = lastActive;
    data['verCode'] = verCode;
    data['verified'] = verified;
    data['about'] = about;
    data['image'] = image;
    data['id_card'] = id_card;
    data['id_mem'] = id_mem;
    data['id_AF'] = id_AF;
    return data;
  }
}
