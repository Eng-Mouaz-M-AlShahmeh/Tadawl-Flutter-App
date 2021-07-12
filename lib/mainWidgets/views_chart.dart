/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:tadawl_app/models/views_series.dart';

class ViewsChart extends StatelessWidget {
  final List<ViewsSeriesModel> data;
  // ignore: sort_constructors_first
  ViewsChart({@required this.data});
  @override
  Widget build(BuildContext context) {
    var series = <charts.Series<ViewsSeriesModel, String>>[
      charts.Series(
        id: 'Views',
        data: data,
        domainFn: (ViewsSeriesModel series, _) => series.day,
        measureFn: (ViewsSeriesModel series, _) => series.views,
        colorFn: (ViewsSeriesModel series, _) => series.barColor,
      )
    ];
    return charts.BarChart(series, animate: true);
  }
}
