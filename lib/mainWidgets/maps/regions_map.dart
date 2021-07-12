/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/provider/region_provider.dart';

class RegionsMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegionProvider>(builder: (context, region, child) {

      void _onMapCreated(GoogleMapController controller) {
        controller.setMapStyle(Utils.mapStyle);
      }

      region.getRegionMapList(context);

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: GoogleMap(
            scrollGesturesEnabled: false,
            zoomGesturesEnabled: false,
            zoomControlsEnabled: false,
            tiltGesturesEnabled: false,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(26.0612158, 42.8204527),
              zoom: 5,
            ),
            onMapCreated: _onMapCreated,
            markers: region.markers.toSet(),
          ),
        ),
      );
    });
  }
}

class Utils {
  static String mapStyle = '''
  [
  {
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.neighborhood",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
]
  ''';
}
