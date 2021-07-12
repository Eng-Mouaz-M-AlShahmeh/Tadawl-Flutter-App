/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tadawl_app/provider/user_provider.dart';

class OfficesVR extends StatelessWidget {
  OfficesVR({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> _officesVRKey = GlobalKey<FormState>();

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, officesVR, child) {
      var mediaQuery = MediaQuery.of(context);
      Widget _buildOfficeName() {
        return TextFormField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context).realEstateOfficesName),
          style: GoogleFonts.tajawal(
            fontSize: 10,
            color: const Color(0xffababab),
          ),
          keyboardType: TextInputType.text,
          validator: (String value) {
            if (value.isEmpty) {
              officesVR.setButtonClicked(null);
              return AppLocalizations.of(context).reqRealEstateOfficesName;
            }
            return null;
          },
          onSaved: (String value) {
            officesVR.setOfficeName(value);
          },
        );
      }

      Widget _buildCRNumber() {
        return TextFormField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context).enterSejel10),
          style: GoogleFonts.tajawal(
            fontSize: 10,
            color: const Color(0xffababab),
          ),
          keyboardType: TextInputType.number,
          validator: (String value) {
            if (value.isEmpty) {
              officesVR.setButtonClicked(null);
              return AppLocalizations.of(context).reqSejel;
            } else if (value.length < 10) {
              officesVR.setButtonClicked(null);
              return AppLocalizations.of(context).reqLess10Sejel;
            }
            return null;
          },
          onSaved: (String value) {
            officesVR.setCRNumber(value);
          },
        );
      }


      officesVR.getSession();
      var phone = officesVR.phone;
      officesVR.getLoc();

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
                if (officesVR.currentStageOfficeVR == null) {
                  Navigator.pop(context);
                } else {
                  officesVR.setCurrentStageOfficeVR(null);
                }
              },
            ),
          ),
          title: Text(
            AppLocalizations.of(context).officesAccreditation,
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
          physics: officesVR.currentStageOfficeVR == 1
              ? NeverScrollableScrollPhysics()
              : ScrollPhysics(),
          child: Form(
            key: _officesVRKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                if (officesVR.currentStageOfficeVR == null)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .realEstateOfficesName,
                              style: GoogleFonts.tajawal(
                                fontSize: 15,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: _buildOfficeName(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).sejelNumber,
                              style: GoogleFonts.tajawal(
                                fontSize: 15,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: _buildCRNumber(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).sejelImage,
                              style: GoogleFonts.tajawal(
                                fontSize: 13,
                                color: const Color(0xff989696),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              officesVR.getImageOfficesVR();
                            },
                            child: Container(
                              width: mediaQuery.size.width * 0.9,
                              height: mediaQuery.size.height * 0.3,
                              child: Center(
                                child: officesVR.imageOfficeVR == null
                                    ? Container(
                                        width: mediaQuery.size.width * 0.9,
                                        height: mediaQuery.size.height * 0.25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/images/img4.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: mediaQuery.size.width * 0.9,
                                        height: mediaQuery.size.height * 0.3,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(
                                                officesVR.imageOfficeVR),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: TextButton(
                          onPressed: () async {
                            if (!_officesVRKey.currentState.validate()) {
                              return;
                            }
                            _officesVRKey.currentState.save();
                            if (officesVR.imageOfficeVR == null) {
                              await Fluttertoast.showToast(
                                  msg: 'صورة السجل التجاري مطلوبة',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                            } else {
                              officesVR.setCurrentStageOfficeVR(1);
                            }
                          },
                          child: Container(
                            width: 150,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: const Color(0xff00cccc), width: 1),
                              color: const Color(0xffffffff),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context).next,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xff00cccc),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (officesVR.currentStageOfficeVR == 1)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).reLocation,
                              style: GoogleFonts.tajawal(
                                fontSize: 13,
                                color: const Color(0xff989696),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 500,
                        child: Stack(
                          children: [
                            officesVR.initialCameraPosition != null
                                ? GoogleMap(
                                    myLocationButtonEnabled: true,
                                    zoomGesturesEnabled: true,
                                    zoomControlsEnabled: true,
                                    scrollGesturesEnabled: true,
                                    rotateGesturesEnabled: true,
                                    myLocationEnabled: true,
                                    mapType: MapType.normal,
                                    initialCameraPosition: CameraPosition(
                                        target: officesVR.initialCameraPosition,
                                        zoom: 13),
                                    onMapCreated: _onMapCreated,
                                    onCameraMove: (CameraPosition position) {
                                      officesVR
                                          .handleCameraMoveOfficesVR(position);
                                    })
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
                      if (officesVR.buttonClicked == null)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                          child: TextButton(
                            onPressed: () async {
                              officesVR.setButtonClicked(1);
                              if (!_officesVRKey.currentState.validate()) {
                                return;
                              }
                              _officesVRKey.currentState.save();
                              if (officesVR.office_cordinates == null) {
                                await Fluttertoast.showToast(
                                    msg:
                                        'حرك الخريطة للوصول لموقع المكتب المطلوب',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 15.0);
                              } else {
                                await officesVR.sendOfficesVRInfo(
                                    context,
                                    phone,
                                    officesVR.CRNumber,
                                    officesVR.officeName,
                                    officesVR.office_cordinates_lat.toString(),
                                    officesVR.office_cordinates_lng.toString(),
                                    officesVR.imageOfficeVR);
                              }
                            },
                            child: Container(
                              width: 200,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: const Color(0xff00cccc), width: 1),
                                color: const Color(0xffffffff),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  AppLocalizations.of(context)
                                      .officesAccreditation,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff00cccc),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (officesVR.buttonClicked == 1)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                          child: Container(
                            width: 200,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: const Color(0xff989898), width: 1),
                              color: const Color(0xffffffff),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)
                                    .officesAccreditation,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xff989898),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class Utils {
  static String mapStyle = '''
[]
  ''';
}
