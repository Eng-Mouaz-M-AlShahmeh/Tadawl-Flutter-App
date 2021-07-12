/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/mainWidgets/Gist.dart';
import 'package:tadawl_app/models/RegionModel.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/screens/ads/main_page.dart';
import 'locale_provider.dart';

class RegionProvider extends ChangeNotifier {

  var _markers = <Marker>[];

  List<Widget> markerWidgets() {
    return cities.map((c) => _getMarkerWidget(c.name)).toList();
  }

  List<Widget> enMarkerWidgets() {
    return engCities.map((e) => _getEnMarkerWidget(e.name)).toList();
  }

  Widget _getMarkerWidget(String name) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
        decoration: BoxDecoration(
          color: const Color(0xff00cccc),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            name,
            style: GoogleFonts.tajawal(
              fontSize: 13,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _getEnMarkerWidget(String name) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
        decoration: BoxDecoration(
          color: const Color(0xff00cccc),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            name,
            style: GoogleFonts.tajawal(
              fontSize: 13,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void getRegionMapList(BuildContext context) {

    var provider = Provider.of<LocaleProvider>(context, listen: false);
    var _lang = provider.locale.toString();

    List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
      var markersList = <Marker>[];
      bitmaps.asMap().forEach((i, bmp) {
        final city = _lang == 'en_US' ? cities[i] : engCities[i];
        markersList.add(Marker(
            consumeTapEvents: true,
            markerId: MarkerId(city.name),
            position: city.position,
            onTap: () {
              Provider.of<AdsProvider>(context, listen: false).setRegionPosition(city.position);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
            },
            icon: BitmapDescriptor.fromBytes(bmp)));
      });
      return markersList;
    }

    if (_lang != 'en_US') {
      MarkerGenerator(markerWidgets(), (bitmaps) {
        _markers = mapBitmapsToMarkers(bitmaps);
        notifyListeners();
      }).generate(context);
    } else if (_lang == 'en_US') {
      MarkerGenerator(enMarkerWidgets(), (bitmaps) {
        _markers = mapBitmapsToMarkers(bitmaps);
        notifyListeners();
      }).generate(context);
    }
  }

  List<Marker> get markers => _markers;

}