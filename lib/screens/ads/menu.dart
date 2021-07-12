/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/mainWidgets/bottom_navigation_bar.dart';
import 'package:tadawl_app/mainWidgets/custom_drawer.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/mainWidgets/search_drawer.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/screens/ads/ad_page.dart';

class Menu extends StatelessWidget {
  Menu({
    Key key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, menu, child) {
      var mediaQuery = MediaQuery.of(context);
      menu.setInitMenu();

      //menu.randomPosition(50);
      menu.setFilterSearchDrawer(null);
      menu.setMenuMainFilterAds(1);


      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          actions: [
            TextButton(
              child: Icon(
                Icons.refresh,
                color: Color(0xff00cccc),
                size: 40,
              ),
              onPressed: () {
                menu.setFilterSearchDrawer(null);
                menu.setMenuMainFilterAds(1);
                menu.getAdsInfo(
                  context,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                );
              },
            ),
          ],
          leadingWidth: 100,
          toolbarHeight: 100,
          backgroundColor: Color(0xffffffff),
          title: ToggleButtons(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
                  AppLocalizations.of(context).latestDate,
                  style: GoogleFonts.tajawal(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            onPressed: (int index) {
              menu.setIsSelectedMenu(index);
              menu.setFilterSearchDrawer(null);
              menu.setMenuMainFilterAds(1);
              menu.getAdsInfo(
                context,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
              );
            },
            isSelected: menu.isSelectedMenu,
            color: const Color(0xff8d8d8d),
            selectedColor: const Color(0xffffffff),
            fillColor: const Color(0xff00cccc),
            borderRadius: BorderRadius.circular(30),
            borderWidth: 0.5,
            borderColor: const Color(0xff00cccc),
            selectedBorderColor: const Color(0xffdddddd),
          ),
          leading: TextButton(
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: Icon(
              Icons.search_rounded,
              color: Color(0xff00cccc),
              size: 40,
            ),
          ),
        ),
        drawer: Drawer(
          child: SearchDrawer(),
        ),
        endDrawer: Drawer(
          child: CustomDrawer(),
        ),
        body: RefreshIndicator(
          // ignore: missing_return
          onRefresh: () async {
            menu.setFilterSearchDrawer(null);
            menu.setMenuMainFilterAds(1);
            menu.getAdsInfo(
              context,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
            );
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: menu.waitMenu == true
                      ? Padding(
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
                          )),
                        )
                      : Column(
                          children: [
                            if (menu.menuAds.isNotEmpty)
                              for (int i = 0; i < menu.countMenuAds(); i++)
                                TextButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   wait = true;
                                    // });
                                    menu.getAdsPageList(
                                        context, menu.menuAds[i].idDescription);
                                    menu.getImagesAdsPageList(
                                        context, menu.menuAds[i].idDescription);
                                    menu.getUserAdsPageInfo(
                                        context, menu.menuAds[i].idDescription);
                                    menu.getAdsVRInfo(
                                        context, menu.menuAds[i].idDescription);
                                    menu.getBFAdsPageList(
                                        context, menu.menuAds[i].idDescription);
                                    menu.getQFAdsPageList(
                                        context, menu.menuAds[i].idDescription);
                                    menu.getViewsChartInfo(
                                        context, menu.menuAds[i].idDescription);
                                    menu.getNavigationAdsPageList(context);

                                    menu.getSimilarAdsList(context, menu.menuAds[i].idCategory, menu.menuAds[i].idDescription);
                                    menu.setIdDescription(menu.menuAds[i].idDescription);

                                    Future.delayed(Duration(seconds: 0), () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AdPage()),
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: mediaQuery.size.width,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff8d8d8d),
                                          offset: const Offset(
                                            0.0,
                                            0.0,
                                          ),
                                          blurRadius: 0.0,
                                          spreadRadius: 1.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(children: [
                                          Container(
                                            width: 180.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    'https://tadawl.com.sa/API/assets/images/ads/' +
                                                            menu.menuAds[i]
                                                                .ads_image ??
                                                        ''),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                menu.randdLeft,
                                                menu.randdTop,
                                                5,
                                                5),
                                            child: Opacity(
                                              opacity: 0.7,
                                              //opacity: 0.7,
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
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    menu.menuAds[i].title,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 20,
                                                      color: const Color(
                                                          0xff000000),
                                                    ),
                                                  ),
                                                  if (menu.menuAds[i]
                                                          .idSpecial ==
                                                      '1')
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          5, 0, 10, 0),
                                                      child: Icon(
                                                        Icons.verified,
                                                        color:
                                                            Color(0xffe6e600),
                                                        size: 30,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    menu.menuAds[i].price,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 15,
                                                      color: const Color(
                                                          0xff00cccc),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 5, 0),
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .rial,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff00cccc),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    menu.menuAds[i].space,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 15,
                                                      color: const Color(
                                                          0xff000000),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 5, 0),
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .m2,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 10, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (menu.menuAds[i]
                                                                .ads_city !=
                                                            null ||
                                                        menu.menuAds[i]
                                                                .ads_neighborhood !=
                                                            null)
                                                      Text(
                                                        '${menu.menuAds[i].ads_city} - ${menu.menuAds[i].ads_neighborhood}',
                                                        style:
                                                            GoogleFonts.tajawal(
                                                          fontSize: 10,
                                                          color: const Color(
                                                              0xff000000),
                                                        ),
                                                      ),
                                                    if (menu.menuAds[i].video
                                                        .isNotEmpty)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 0, 5, 0),
                                                        child: Icon(
                                                          Icons
                                                              .videocam_outlined,
                                                          color:
                                                              Color(0xff00cccc),
                                                          size: 30,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            else
                              Container(),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
            height: mediaQuery.size.height * 0.11,
            child: BottomNavigationBarApp()),
      );
    });
  }
}
