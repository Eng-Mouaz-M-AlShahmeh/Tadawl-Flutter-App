/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
  static Future<void> openMap(double latitude, double longitude) async {
    var googleUrl =
        'https://www.google.com/maps/search/?provider.api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
