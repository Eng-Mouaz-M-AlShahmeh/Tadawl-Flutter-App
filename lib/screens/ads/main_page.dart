/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/mainWidgets/search_drawer.dart';
import 'package:tadawl_app/mainWidgets/bottom_navigation_bar.dart';
import 'package:tadawl_app/mainWidgets/custom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/locale_provider.dart';
//import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/ads/ad_page.dart';
import 'package:tadawl_app/screens/general/regions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, mainPage, child) {
      var _lang =
          Provider.of<LocaleProvider>(context, listen: false).locale.toString();

      void _onMapCreated(GoogleMapController controller) {
        controller.setMapStyle(Utils.mapStyle);
        mainPage.setMapControllerMainPage(controller);
      }

      Future<bool> _onBackPressed() {
        return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  AppLocalizations.of(context).closeApp,
                  style: GoogleFonts.tajawal(
                    fontSize: 20,
                    color: const Color(0xff00cccc),
                  ),
                  textAlign: TextAlign.right,
                ),
                content: Text(
                  AppLocalizations.of(context).areYouSureCloseApp,
                  style: GoogleFonts.tajawal(
                    fontSize: 17,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.right,
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: GestureDetector(
                      onTap: () => SystemNavigator.pop(),
                      child: Text(
                        AppLocalizations.of(context).yes,
                        style: GoogleFonts.tajawal(
                          fontSize: 17,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: Text(
                        AppLocalizations.of(context).no,
                        style: GoogleFonts.tajawal(
                          fontSize: 17,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ) ??
            false;
      }

      mainPage.getLoc();
      //var _phone = Provider.of<UserProvider>(context, listen: false).phone;
      //mainPage.randomPosition(50);

      if(mainPage.inItMainPageDone == 0) {
        mainPage.setIdCategorySearch('0');
        mainPage.setFilterSearchDrawer(1);
        mainPage.setMenuMainFilterAds(2);
        mainPage.getAdsInfo(
          context,
          mainPage.idCategorySearch,
          mainPage.selectedCategory,
          mainPage.minPriceSearchDrawer,
          mainPage.maxPriceSearchDrawer,
          mainPage.minSpaceSearchDrawer,
          mainPage.maxSpaceSearchDrawer,
          mainPage.selectedTypeAqarSearchDrawer,
          mainPage.interfaceSelectedSearchDrawer,
          mainPage.selectedPlanSearchDrawer,
          mainPage.ageOfRealEstateSelectedSearchDrawer,
          mainPage.selectedApartmentsSearchDrawer,
          mainPage.floorSelectedSearchDrawer,
          mainPage.selectedLoungesSearchDrawer,
          mainPage.selectedRoomsSearchDrawer,
          mainPage.storesSelectedSearchDrawer,
          mainPage.streetWidthSelectedSearchDrawer,
          mainPage.selectedToiletsSearchDrawer,
          mainPage.treesSelectedSearchDrawer,
          mainPage.wellsSelectedSearchDrawer,
          mainPage.bool_feature1SearchDrawer.toString(),
          mainPage.bool_feature2SearchDrawer.toString(),
          mainPage.bool_feature3SearchDrawer.toString(),
          mainPage.bool_feature4SearchDrawer.toString(),
          mainPage.bool_feature5SearchDrawer.toString(),
          mainPage.bool_feature6SearchDrawer.toString(),
          mainPage.bool_feature7SearchDrawer.toString(),
          mainPage.bool_feature8SearchDrawer.toString(),
          mainPage.bool_feature9SearchDrawer.toString(),
          mainPage.bool_feature10SearchDrawer.toString(),
          mainPage.bool_feature11SearchDrawer.toString(),
          mainPage.bool_feature12SearchDrawer.toString(),
          mainPage.bool_feature13SearchDrawer.toString(),
          mainPage.bool_feature14SearchDrawer.toString(),
          mainPage.bool_feature15SearchDrawer.toString(),
          mainPage.bool_feature16SearchDrawer.toString(),
          mainPage.bool_feature17SearchDrawer.toString(),
          mainPage.bool_feature18SearchDrawer.toString(),
        );
        mainPage.setInItMainPageDone(1);
      }

      return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: const Color(0xffffffff),
          drawer: Drawer(
            child: SearchDrawer(),
          ),
          endDrawer: Drawer(
            child: CustomDrawer(),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color(0xffffffff), //Color(0xff1f2835),
                child: Center(
                  child: Stack(
                    children: [
                     // mainPage.initialCameraPosition != null ?
                      GoogleMap(
                              onTap: (d) {
                                mainPage.setShowDiogFalse();
                              },
                              initialCameraPosition: CameraPosition(
                                  target: mainPage.region_position ?? (mainPage.initialCameraPosition??
                                      LatLng(24.713704574942028, 46.68523302830853)),
                                  zoom: 15),
                              mapType: MapType.normal,
                              onMapCreated: _onMapCreated,
                              markers: mainPage.markersMainPage.toSet(),
                              myLocationEnabled: true,
                              myLocationButtonEnabled: true,
                              zoomGesturesEnabled: true,
                              zoomControlsEnabled: true,
                              scrollGesturesEnabled: true,
                              rotateGesturesEnabled: true,
                              onCameraMove: (Cameraposioion) {
                                if (Cameraposioion.zoom <= 5) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Regions()),
                                  );
                                }
                                mainPage.updateInfoWindow(
                                    context,
                                    mainPage.mapControllerMainPAge,
                                    LatLng(
                                        double.parse(mainPage
                                            .SelectedAdsModelMainPage.lat),
                                        double.parse(mainPage
                                            .SelectedAdsModelMainPage.lng)),
                                    250,
                                    170);
                              },
                            ),
                        //  : Container(),
                      mainPage.showDiaogSearchDrawer
                          ? Positioned(
                              top: mainPage.topMargin != null
                                  ? mainPage.topMargin - 20
                                  : 0,
                              left: mainPage.leftMargin,
                              child: Visibility(
                                visible: mainPage.showDiaogSearchDrawer,
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          mainPage.getAdsPageList(
                                              context,
                                              mainPage.SelectedAdsModelMainPage
                                                  .idDescription);
                                          mainPage.getImagesAdsPageList(
                                              context,
                                              mainPage.SelectedAdsModelMainPage
                                                  .idDescription);
                                          mainPage.getUserAdsPageInfo(
                                              context,
                                              mainPage.SelectedAdsModelMainPage
                                                  .idDescription);
                                          mainPage.getAdsVRInfo(
                                              context,
                                              mainPage.SelectedAdsModelMainPage
                                                  .idDescription);
                                          mainPage.getBFAdsPageList(
                                              context,
                                              mainPage.SelectedAdsModelMainPage
                                                  .idDescription);
                                          mainPage.getQFAdsPageList(
                                              context,
                                              mainPage.SelectedAdsModelMainPage
                                                  .idDescription);
                                          mainPage.getViewsChartInfo(
                                              context,
                                              mainPage.SelectedAdsModelMainPage
                                                  .idDescription);
                                          mainPage.getNavigationAdsPageList(
                                              context);
                                          mainPage.getSimilarAdsList(context, mainPage.SelectedAdsModelMainPage.idCategory, mainPage.SelectedAdsModelMainPage.idDescription);
                                          mainPage.setIdDescription(mainPage.SelectedAdsModelMainPage.idDescription);

                                          Future.delayed(Duration(seconds: 0),
                                              () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AdPage()),
                                            );
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          height: 150,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Stack(children: [
                                                Image.network(
                                                  'https://tadawl.com.sa/API/assets/images/ads/' +
                                                          mainPage
                                                              .SelectedAdsModelMainPage
                                                              .ads_image ??
                                                      '',
                                                  height: 150,
                                                  width: 180,
                                                  fit: BoxFit.cover,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      mainPage.randdLeft,
                                                      mainPage.randdTop,
                                                      5,
                                                      5),
                                                  child: Opacity(
                                                    opacity: 0.7,
                                                    child: Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: const NetworkImage(
                                                              'https://tadawl.com.sa/API/assets/images/logo22.png'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    mainPage.SelectedAdsModelMainPage
                                                            .title ??
                                                        '',
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        mainPage
                                                            .SelectedAdsModelMainPage
                                                            .price
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.tajawal(
                                                          fontSize: 16,
                                                          color:
                                                              Color(0xff00cccc),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 0, 5, 0),
                                                        child: Text(
                                                          'ريال',
                                                          style: GoogleFonts
                                                              .tajawal(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xff00cccc),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        mainPage
                                                            .SelectedAdsModelMainPage
                                                            .space,
                                                        style:
                                                            GoogleFonts.tajawal(
                                                          fontSize: 12,
                                                          color: Colors.black45,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 0, 5, 0),
                                                        child: Text(
                                                          'م2',
                                                          style: GoogleFonts
                                                              .tajawal(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black45,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (mainPage.SelectedAdsModelMainPage
                                                              .ads_city !=
                                                          null ||
                                                      mainPage.SelectedAdsModelMainPage
                                                              .ads_neighborhood !=
                                                          null)
                                                    Flexible(
                                                      child: Text(
                                                        '${mainPage.SelectedAdsModelMainPage.ads_city} - ${mainPage.SelectedAdsModelMainPage.ads_neighborhood}',
                                                        style:
                                                            GoogleFonts.tajawal(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black45,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Custom InfoWindow Widget ends here
                                ),
                              ),
                            )
                          : Container(),
                      mainPage.waitMainPage == false
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Center(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Color(0xff00cccc),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xff1f2835)),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              // map ....................................
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  mainAxisAlignment: _lang != 'en_US'
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (mainPage.slider_state == 0)
                      Container(
                        width: 80.0,
                        height: MediaQuery.of(context).size.height * 0.064,
                        decoration: BoxDecoration(
                          boxShadow: [],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: const Color(0xff00cccc),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  mainPage.setSliderState(1);
                                },
                                child: Icon(
                                    _lang != 'en_US'
                                        ? Icons.arrow_back_ios_rounded
                                        : Icons.arrow_forward_ios_rounded,
                                    color: Color(0xff1f2835),
                                    size: 30),
                              ),
                            ],
                          ),
                        ),
                      )
                    else if (mainPage.slider_state == 1)
                      Container(
                        width: 100.0,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                          boxShadow: [],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: const Color(0xff1f2835),
                        ),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                mainPage.setSliderState(0);
                              },
                              child: Icon(
                                  _lang != 'en_US'
                                      ? Icons.arrow_forward_ios_rounded
                                      : Icons.arrow_back_ios_rounded,
                                  color: Color(0xff00cccc),
                                  size: 30),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SizedBox(
                                  width: 100.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.73,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: const Color(0x00000000),
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            children: [
                                              if (_lang != 'en_US')
                                                Column(
                                                  children: [
                                                    for (var i = 0;
                                                        i <
                                                            mainPage.categories
                                                                .length;
                                                        i++)
                                                      TextButton(
                                                        onPressed: () {
                                                          mainPage.setIdCategorySearch(
                                                              mainPage.categories[
                                                                      i][
                                                                  'id_category']);
                                                          mainPage
                                                              .setFilterSearchDrawer(
                                                                  1);
                                                          mainPage.setMenuMainFilterAds(2);
                                                          mainPage.getAdsInfo(
                                                            context,
                                                            mainPage
                                                                .idCategorySearch,
                                                            mainPage
                                                                .selectedCategory,
                                                            mainPage
                                                                .minPriceSearchDrawer,
                                                            mainPage
                                                                .maxPriceSearchDrawer,
                                                            mainPage
                                                                .minSpaceSearchDrawer,
                                                            mainPage
                                                                .maxSpaceSearchDrawer,
                                                            mainPage
                                                                .selectedTypeAqarSearchDrawer,
                                                            mainPage
                                                                .interfaceSelectedSearchDrawer,
                                                            mainPage
                                                                .selectedPlanSearchDrawer,
                                                            mainPage
                                                                .ageOfRealEstateSelectedSearchDrawer,
                                                            mainPage
                                                                .selectedApartmentsSearchDrawer,
                                                            mainPage
                                                                .floorSelectedSearchDrawer,
                                                            mainPage
                                                                .selectedLoungesSearchDrawer,
                                                            mainPage
                                                                .selectedRoomsSearchDrawer,
                                                            mainPage
                                                                .storesSelectedSearchDrawer,
                                                            mainPage
                                                                .streetWidthSelectedSearchDrawer,
                                                            mainPage
                                                                .selectedToiletsSearchDrawer,
                                                            mainPage
                                                                .treesSelectedSearchDrawer,
                                                            mainPage
                                                                .wellsSelectedSearchDrawer,
                                                            mainPage
                                                                .bool_feature1SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature2SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature3SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature4SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature5SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature6SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature7SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature8SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature9SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature10SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature11SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature12SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature13SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature14SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature15SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature16SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature17SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature18SearchDrawer
                                                                .toString(),
                                                          );
                                                        },
                                                        child: Text(
                                                          mainPage.categories[i]
                                                              ['name'],
                                                          style: GoogleFonts
                                                              .tajawal(
                                                            fontSize: 13,
                                                            color: const Color(
                                                                0xffffffff),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                  ],
                                                )
                                              else
                                                for (var i = 0;
                                                    i <
                                                        mainPage.enCategories
                                                            .length;
                                                    i++)
                                                  Column(
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {
                                                          mainPage.setIdCategorySearch(
                                                              mainPage.enCategories[
                                                                      i][
                                                                  'id_category']);
                                                          mainPage
                                                              .setFilterSearchDrawer(
                                                                  1);
                                                          mainPage.setMenuMainFilterAds(2);
                                                          mainPage.getAdsInfo(
                                                            context,
                                                            mainPage
                                                                .idCategorySearch,
                                                            mainPage
                                                                .selectedCategory,
                                                            mainPage
                                                                .minPriceSearchDrawer,
                                                            mainPage
                                                                .maxPriceSearchDrawer,
                                                            mainPage
                                                                .minSpaceSearchDrawer,
                                                            mainPage
                                                                .maxSpaceSearchDrawer,
                                                            mainPage
                                                                .selectedTypeAqarSearchDrawer,
                                                            mainPage
                                                                .interfaceSelectedSearchDrawer,
                                                            mainPage
                                                                .selectedPlanSearchDrawer,
                                                            mainPage
                                                                .ageOfRealEstateSelectedSearchDrawer,
                                                            mainPage
                                                                .selectedApartmentsSearchDrawer,
                                                            mainPage
                                                                .floorSelectedSearchDrawer,
                                                            mainPage
                                                                .selectedLoungesSearchDrawer,
                                                            mainPage
                                                                .selectedRoomsSearchDrawer,
                                                            mainPage
                                                                .storesSelectedSearchDrawer,
                                                            mainPage
                                                                .streetWidthSelectedSearchDrawer,
                                                            mainPage
                                                                .selectedToiletsSearchDrawer,
                                                            mainPage
                                                                .treesSelectedSearchDrawer,
                                                            mainPage
                                                                .wellsSelectedSearchDrawer,
                                                            mainPage
                                                                .bool_feature1SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature2SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature3SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature4SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature5SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature6SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature7SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature8SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature9SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature10SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature11SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature12SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature13SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature14SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature15SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature16SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature17SearchDrawer
                                                                .toString(),
                                                            mainPage
                                                                .bool_feature18SearchDrawer
                                                                .toString(),
                                                          );
                                                        },
                                                        child: Text(
                                                          mainPage.enCategories[
                                                              i]['name'],
                                                          style: GoogleFonts
                                                              .tajawal(
                                                            fontSize: 13,
                                                            color: const Color(
                                                                0xffffffff),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              // slider ....................................
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 50, 20, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0x00000000),
                      ),
                      child: Row(
                        mainAxisAlignment: _lang != 'en_US'
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              _scaffoldKey.currentState.openDrawer();
                            },
                            child: Container(
                              width: 50,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0xff00cccc),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.search_rounded,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // search button .............................
            ],
          ),
          bottomNavigationBar: SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
              child: BottomNavigationBarApp()),
        ),
      );
    });
  }
}

class Utils {
  static String mapStyle = '''
 [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#242f3e"
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
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
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
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#263c3f"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6b9a76"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
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
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9ca5b3"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#1f2835"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f3d19c"
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
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2f3948"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#515c6d"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  }
]
  ''';
}
