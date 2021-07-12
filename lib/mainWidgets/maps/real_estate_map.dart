/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/models/RegionModel.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/general/regions.dart';

class RealEstateMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      controller.setMapStyle(Utils.mapStyle);
    }

    return Consumer<UserProvider>(builder: (context, realEstate, child) {
      realEstate.getOfficeListMap(context);

      return Scaffold(
        body: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(24.7790412871858, 46.767165544575), zoom: 13),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            markers: realEstate.markers.toSet(),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onCameraMove: (cameraPosition) {
              if (cameraPosition.zoom <= 5) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Regions()),
                );
              }
            }),
      );
    });
  }
}
