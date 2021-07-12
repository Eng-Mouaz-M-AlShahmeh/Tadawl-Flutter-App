/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
class CategoryModel {
  String id_category;
  String name;
  String en_name;
  // ignore: sort_constructors_first
  CategoryModel({
    this.id_category,
    this.name,
    this.en_name,
  });
  // ignore: sort_constructors_first
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id_category = json['id'];
    name = json['name'];
    en_name = json['en_name'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id_category;
    data['name'] = name;
    data['en_name'] = en_name;
    return data;
  }
}
