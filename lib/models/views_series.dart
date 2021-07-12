/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:charts_flutter/flutter.dart' as charts;

class ViewsSeriesModel {
  String day;
  String title;
  int views;
  charts.Color barColor;
  // ignore: sort_constructors_first
  ViewsSeriesModel({
    this.day,
    this.title,
    this.views,
    this.barColor,
  });
  // ignore: sort_constructors_first
  ViewsSeriesModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    title = json['title'];
    views = json['views'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['day'] = day;
    data['title'] = title;
    data['views'] = views;
    return data;
  }
}
