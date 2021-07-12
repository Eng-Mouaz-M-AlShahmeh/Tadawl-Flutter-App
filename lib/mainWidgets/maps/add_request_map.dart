/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
/*import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddRequestMap extends StatelessWidget {

  final Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.defaultMarkerWithHue(180);
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
    setState(() {});
  }

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(24.741502, 46.648213),
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: GoogleMap(
          myLocationButtonEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          scrollGesturesEnabled: true,
          rotateGesturesEnabled: true,
          myLocationEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _initialPosition,
          onMapCreated: _onMapCreated,
          markers: Set.from(_markers),
          onTap: _handleTap,
        ),
      ),
    );
  }

  void _handleTap(LatLng tappedPoint) {
    setState(() {
      if (_markers.isEmpty) {
        _markers.add(Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          icon: mapMarker,
        ));
      } else {
        _markers.clear();

        _markers.add(Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          icon: mapMarker,
        ));
      }
    });
  }
}

class Utils {
  static String mapStyle = '''
  [
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
*/