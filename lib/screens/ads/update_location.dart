/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/ads/ad_page.dart';

class UpdateLocation extends StatelessWidget {
  UpdateLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, updateLoc, child) {
      var mediaQuery = MediaQuery.of(context);
      Provider.of<UserProvider>(context, listen: false).getLoc();
      // ignore: omit_local_variable_types
      Map data = {};
      data = ModalRoute.of(context).settings.arguments;
      var _id_description = data['id_description'];

      void _onMapCreated(GoogleMapController controller) {
        controller.setMapStyle(Utils.mapStyle);
      }


      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xffffffff),
                size: 40,
              ),
              onPressed: () {
                updateLoc.getAdsPageList(context, _id_description);
                updateLoc.getImagesAdsPageList(context, _id_description);
                updateLoc.getUserAdsPageInfo(context, _id_description);
                updateLoc.getAdsVRInfo(context, _id_description);
                updateLoc.getBFAdsPageList(context, _id_description);
                updateLoc.getQFAdsPageList(context, _id_description);
                updateLoc.getViewsChartInfo(context, _id_description);
                updateLoc.getNavigationAdsPageList(context);
                updateLoc.setIdDescription(_id_description);

                Future.delayed(Duration(seconds: 1), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdPage()),
                  );
                });
              },
            ),
          ),
          title: Text(
            AppLocalizations.of(context).updateLocation,
            style: GoogleFonts.tajawal(
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color(0xff00cccc),
        ),
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    updateLoc.ads_city == null
                        ? Text(
                            AppLocalizations.of(context).city,
                            style: GoogleFonts.tajawal(
                              fontSize: 13,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          )
                        : Text(
                            AppLocalizations.of(context).city +
                                ' ${updateLoc.ads_city}',
                            style: GoogleFonts.tajawal(
                              fontSize: 13,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                    updateLoc.ads_neighborhood == null
                        ? Text(
                            AppLocalizations.of(context).neighborhood,
                            style: GoogleFonts.tajawal(
                              fontSize: 13,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          )
                        : Text(
                            AppLocalizations.of(context).neighborhood +
                                ' ${updateLoc.ads_neighborhood}',
                            style: GoogleFonts.tajawal(
                              fontSize: 13,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                  ],
                ),
              ),
              if (updateLoc.AdsUpdateLoc.isNotEmpty)
                SizedBox(
                  height: 500,
                  child: Stack(
                    children: [
                      Provider.of<UserProvider>(context, listen: false)
                                  .initialCameraPosition !=
                              null
                          ? GoogleMap(
                              myLocationButtonEnabled: true,
                              zoomGesturesEnabled: true,
                              zoomControlsEnabled: true,
                              scrollGesturesEnabled: true,
                              rotateGesturesEnabled: true,
                              myLocationEnabled: true,
                              mapType: MapType.normal,
                              initialCameraPosition: CameraPosition(
                                  target: Provider.of<UserProvider>(context,
                                          listen: false)
                                      .initialCameraPosition,
                                  zoom: 13),
                              onMapCreated: _onMapCreated,
                              onCameraMove: (CameraPosition position) {
                                updateLoc.handleCameraMoveUpdateLoc(position);
                              },
                            )
                          : Container(),
                      Center(
                        child: Icon(
                          Icons.my_location_rounded,
                          color: Color(0xff00cccc),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              TextButton(
                onPressed: () {
                  if (updateLoc.ads_cordinates == null) {
                    Fluttertoast.showToast(
                        msg: 'تعديل موقع العقار مطلوب',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 15.0);
                  } else {
                    updateLoc.updateLocation(
                        context,
                        _id_description,
                        updateLoc.ads_city,
                        updateLoc.ads_neighborhood,
                        updateLoc.ads_road,
                        updateLoc.ads_cordinates_lat.toString(),
                        updateLoc.ads_cordinates_lng.toString());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Container(
                    width: mediaQuery.size.width * 0.6,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff3f9d28)),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).edit,
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          color: const Color(0xff3f9d28),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class Utils {
  static String mapStyle = '''[]''';
}
