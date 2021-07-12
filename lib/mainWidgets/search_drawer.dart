/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/locale_provider.dart';
import 'package:tadawl_app/screens/ads/main_page.dart';
import 'package:tadawl_app/screens/ads/search_ads.dart';

class SearchDrawer extends StatefulWidget {
  SearchDrawer({
    Key key,
  }) : super(key: key);
  @override
  _SearchDrawerState createState() => _SearchDrawerState();
}

class _SearchDrawerState extends State<SearchDrawer> {
  final GlobalKey<FormState> _searchDrawerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, searchDrawer, child) {

      Padding _buildCommercialHousing() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).commHousing,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).commercial,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).housing,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                onPressed: (int index) {
                  searchDrawer.setTypeAqarSearchDrawer(index);
                },
                isSelected: searchDrawer.typeAqarSearchDrawer,
                color: const Color(0xff00cccc),
                selectedColor: const Color(0xffffffff),
                fillColor: const Color(0xff00cccc),
                borderColor: const Color(0xff00cccc),
                selectedBorderColor: const Color(0xff00cccc),
                borderWidth: 1,
              ),
            ],
          ),
        );
      }

      Padding _buildPrice() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).maxPrice,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff989696),
                  ),
                  keyboardType: TextInputType.number,
                  minLines: 1,
                  maxLines: 1,
                  onSaved: (String value) {
                    searchDrawer.setMaxPriceSearchDrawer(value);
                  },
                ),
              ),
              Text(
                ' - ',
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).minPrice,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff989696),
                  ),
                  keyboardType: TextInputType.number,
                  minLines: 1,
                  maxLines: 1,
                  onSaved: (String value) {
                    searchDrawer.setMinPriceSearchDrawer(value);
                  },
                ),
              ),
            ],
          ),
        );
      }

      Padding _buildSpace() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).maxSpace,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff989696),
                  ),
                  keyboardType: TextInputType.number,
                  minLines: 1,
                  maxLines: 1,
                  onSaved: (String value) {
                    searchDrawer.setMaxSpaceSearchDrawer(value);
                  },
                ),
              ),
              Text(
                ' - ',
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).minSpace,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff989696),
                  ),
                  keyboardType: TextInputType.number,
                  minLines: 1,
                  maxLines: 1,
                  onSaved: (String value) {
                    searchDrawer.setMinSpaceSearchDrawer(value);
                  },
                ),
              ),
            ],
          ),
        );
      }

      Column _buildInterface() {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).interface,
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          hint: Text(
                            AppLocalizations.of(context).interface,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          value:
                              searchDrawer.interfaceSelectedSearchDrawer ?? '0',
                          onChanged: (String newValue) {
                            searchDrawer
                                .setInterfaceSelectedSearchDrawer(newValue);
                          },
                          items: Provider.of<LocaleProvider>(context,
                                          listen: false)
                                      .locale
                                      .toString() !=
                                  'en_US'
                              ? searchDrawer.Interface.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList()
                              : searchDrawer.EnInterface.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
      }

      Column _buildStreetWidth() {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).streetWidth,
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          hint: Text(
                            AppLocalizations.of(context).streetWidth,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          value: searchDrawer.streetWidthSelectedSearchDrawer ??
                              '0',
                          onChanged: (String newValue) {
                            searchDrawer
                                .setStreetWidthSelectedSearchDrawer(newValue);
                          },
                          items: Provider.of<LocaleProvider>(context,
                                          listen: false)
                                      .locale
                                      .toString() !=
                                  'en_US'
                              ? searchDrawer.StreetWidth.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList()
                              : searchDrawer.EnStreetWidth.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
      }

      Column _buildApartements() {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).apartments,
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButtons(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          '4',
                          style: GoogleFonts.tajawal(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          '3',
                          style: GoogleFonts.tajawal(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          '2',
                          style: GoogleFonts.tajawal(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          '1',
                          style: GoogleFonts.tajawal(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          '0',
                          style: GoogleFonts.tajawal(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          AppLocalizations.of(context).all,
                          style: GoogleFonts.tajawal(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                    onPressed: (int index) {
                      searchDrawer.setApartmentsSearchDrawer(index);
                    },
                    isSelected: searchDrawer.apartmentsSearchDrawer,
                    color: const Color(0xff00cccc),
                    selectedColor: const Color(0xffffffff),
                    fillColor: const Color(0xff00cccc),
                    borderColor: const Color(0xff00cccc),
                    selectedBorderColor: const Color(0xff00cccc),
                    borderWidth: 1,
                  ),
                ],
              ),
            ),
          ),
        ]);
      }

      Column _buildAgeOfRealEstate() {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).ageOfRealEstate,
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          hint: Text(
                            AppLocalizations.of(context).ageOfRealEstate,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          value: searchDrawer
                                  .ageOfRealEstateSelectedSearchDrawer ??
                              '0',
                          onChanged: (String newValue) {
                            searchDrawer.setAgeOfRealEstateSelectedSearchDrawer(
                                newValue);
                          },
                          items: Provider.of<LocaleProvider>(context,
                                          listen: false)
                                      .locale
                                      .toString() !=
                                  'en_US'
                              ? searchDrawer.AgeOfRealEstate.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList()
                              : searchDrawer.EnAgeOfRealEstate.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
      }

      Padding _buildRooms() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).moreRooms,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).fourRooms,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).threeRooms,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).twoRooms,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                onPressed: (int index) {
                  searchDrawer.setRoomsSearchDrawer(index);
                },
                isSelected: searchDrawer.roomsSearchDrawer,
                color: const Color(0xff00cccc),
                selectedColor: const Color(0xffffffff),
                fillColor: const Color(0xff00cccc),
                borderColor: const Color(0xff00cccc),
                selectedBorderColor: const Color(0xff00cccc),
                borderWidth: 1,
              ),
            ],
          ),
        );
      }

      Column _buildLounges() {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).lounges,
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        '+3',
                        style: GoogleFonts.tajawal(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        '+2',
                        style: GoogleFonts.tajawal(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        '+1',
                        style: GoogleFonts.tajawal(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        AppLocalizations.of(context).all,
                        style: GoogleFonts.tajawal(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    searchDrawer.setLoungesSearchDrawer(index);
                  },
                  isSelected: searchDrawer.loungesSearchDrawer,
                  color: const Color(0xff00cccc),
                  selectedColor: const Color(0xffffffff),
                  fillColor: const Color(0xff00cccc),
                  borderColor: const Color(0xff00cccc),
                  selectedBorderColor: const Color(0xff00cccc),
                  borderWidth: 1,
                ),
              ],
            ),
          ),
        ]);
      }

      Column _buildToilets() {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).toilets,
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        '+3',
                        style: GoogleFonts.tajawal(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        '+2',
                        style: GoogleFonts.tajawal(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        '+1',
                        style: GoogleFonts.tajawal(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        AppLocalizations.of(context).all,
                        style: GoogleFonts.tajawal(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    searchDrawer.setToiletsSearchDrawer(index);
                  },
                  isSelected: searchDrawer.toiletsSearchDrawer,
                  color: const Color(0xff00cccc),
                  selectedColor: const Color(0xffffffff),
                  fillColor: const Color(0xff00cccc),
                  borderColor: const Color(0xff00cccc),
                  selectedBorderColor: const Color(0xff00cccc),
                  borderWidth: 1,
                ),
              ],
            ),
          ),
        ]);
      }

      Padding _buildPlan() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).daily,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).monthly,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).annual,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                onPressed: (int index) {
                  searchDrawer.setPlanSearchDrawer(index);
                },
                isSelected: searchDrawer.planSearchDrawer,
                color: const Color(0xff00cccc),
                selectedColor: const Color(0xffffffff),
                fillColor: const Color(0xff00cccc),
                borderColor: const Color(0xff00cccc),
                selectedBorderColor: const Color(0xff00cccc),
                borderWidth: 1,
              ),
            ],
          ),
        );
      }

      Column _buildStores() {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).stores,
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          hint: Text(
                            AppLocalizations.of(context).stores,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          value: searchDrawer.storesSelectedSearchDrawer ?? '0',
                          onChanged: (String newValue) {
                            searchDrawer.setStoresSearchDrawer(newValue);
                          },
                          items: Provider.of<LocaleProvider>(context,
                                          listen: false)
                                      .locale
                                      .toString() !=
                                  'en_US'
                              ? searchDrawer.Stores.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList()
                              : searchDrawer.EnStores.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
      }

      Column _buildFloor() {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).floor,
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          hint: Text(
                            AppLocalizations.of(context).floor,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          value: searchDrawer.floorSelectedSearchDrawer ?? '0',
                          onChanged: (String newValue) {
                            searchDrawer.setFloorSearchDrawer(newValue);
                          },
                          items: Provider.of<LocaleProvider>(context,
                                          listen: false)
                                      .locale
                                      .toString() !=
                                  'en_US'
                              ? searchDrawer.Floor.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList()
                              : searchDrawer.EnFloor.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
      }

      Column _buildTrees() {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).trees,
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          hint: Text(
                            AppLocalizations.of(context).trees,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          value: searchDrawer.treesSelectedSearchDrawer ?? '0',
                          onChanged: (String newValue) {
                            searchDrawer.setTreesSearchDrawer(newValue);
                          },
                          items: Provider.of<LocaleProvider>(context,
                                          listen: false)
                                      .locale
                                      .toString() !=
                                  'en_US'
                              ? searchDrawer.Trees.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList()
                              : searchDrawer.EnTrees.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
      }

      Column _buildWells() {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).wells,
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          hint: Text(
                            AppLocalizations.of(context).wells,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          value: searchDrawer.wellsSelectedSearchDrawer ?? '0',
                          onChanged: (String newValue) {
                            searchDrawer.setWellsSearchDrawer(newValue);
                          },
                          items: Provider.of<LocaleProvider>(context,
                                          listen: false)
                                      .locale
                                      .toString() !=
                                  'en_US'
                              ? searchDrawer.Wells.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList()
                              : searchDrawer.EnWells.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map['id_type'].toString(),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            map['type'],
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
      }

      Padding _buildSingleFamily() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).family,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      AppLocalizations.of(context).single,
                      style: GoogleFonts.tajawal(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                onPressed: (int index) {
                  searchDrawer.setFamilyTypeSearchDrawer(index);
                },
                isSelected: searchDrawer.familyTypeSearchDrawer,
                color: const Color(0xff00cccc),
                selectedColor: const Color(0xffffffff),
                fillColor: const Color(0xff00cccc),
                borderColor: const Color(0xff00cccc),
                selectedBorderColor: const Color(0xff00cccc),
                borderWidth: 1,
              ),
            ],
          ),
        );
      }

      Padding _buildHallStaircase() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).hallStaircase,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature1SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature1SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildDriverRoom() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).driverRoom,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature2SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature2SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildMaidRoom() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).maidRoom,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature3SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature3SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildSwimmingPool() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).swimmingPool,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature4SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature4SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildFurnished() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).furnished,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature5SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature5SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildKitchen() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).kitchen,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature6SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature6SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildVerse() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).verse,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature7SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature7SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildYard() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).yard,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature8SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature8SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildAppendix() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).appendix,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature9SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature9SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildCarEntrance() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).carEntrance,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature10SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature10SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildCllar() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).cellar,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature11SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature11SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildElevator() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).elevator,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature12SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature12SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildDuplex() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).duplex,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature13SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature13SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildFootballCourt() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).footballCourt,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature14SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature14SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildVolleyballCourt() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).volleyballCourt,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature15SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature15SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildConditioner() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).conditioner,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature16SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature16SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildFamilyPartition() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).familyPartition,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature17SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature17SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      Padding _buildAmusementPark() {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).amusementPark,
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              FlutterSwitch(
                activeColor: const Color(0xff00cccc),
                width: 40.0,
                height: 20.0,
                valueFontSize: 15.0,
                toggleSize: 15.0,
                value: searchDrawer.bool_feature18SearchDrawer,
                borderRadius: 15.0,
                padding: 2.0,
                showOnOff: false,
                onToggle: (val) {
                  searchDrawer.setbool_feature18SearchDrawer(val);
                },
              ),
            ],
          ),
        );
      }

      return Scaffold(
        body: Form(
          key: _searchDrawerKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 75.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff00cccc),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff818181)),
                  ),
                ),
                // top cyan bar .................................

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: SearchMapPlaceWidget(
                      language: 'ar',
                      hasClearButton: true,
                      iconColor: Color(0xff00cccc),
                      placeType: PlaceType.address,
                      placeholder:
                          AppLocalizations.of(context).currentMapLocation,
                      apiKey: 'AIzaSyAaY9NEnamyi3zfnKhAZXxjLml_5gf1G7g',
                      onSelected: (Place place) async {
                        var geolocation = await place.geolocation;
                        searchDrawer.setRegionPosition(geolocation.coordinates);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                    ),
                  ),
                ),

                // choose location ..............................
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                hint: Text(
                                  AppLocalizations.of(context).chooseCategory,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff00cccc),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                value: searchDrawer.selectedCategory,
                                onChanged: (String newValue) {
                                  if (newValue == '0') {
                                    searchDrawer.setSelectedCategory(newValue);
                                  } else {
                                    searchDrawer.setSelectedCategory(newValue);
                                  }
                                },
                                items: Provider.of<LocaleProvider>(context,
                                                listen: false)
                                            .locale
                                            .toString() !=
                                        'en_US'
                                    ? searchDrawer.categories.map((Map map) {
                                        return DropdownMenuItem<String>(
                                          value: map['id_category'].toString(),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                child: Text(
                                                  map['name'],
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 15,
                                                    color:
                                                        const Color(0xff00cccc),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList()
                                    : searchDrawer.enCategories.map((Map map) {
                                        return DropdownMenuItem<String>(
                                          value: map['id_category'].toString(),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                child: Text(
                                                  map['name'],
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 15,
                                                    color:
                                                        const Color(0xff00cccc),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // choose category ..............................

                if (searchDrawer.selectedCategory == '0')
                  Container()
                else if (searchDrawer.selectedCategory == '1')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildLounges(),
                      _buildToilets(),
                      _buildStreetWidth(),
                      _buildRooms(),
                      _buildApartements(),
                      _buildAgeOfRealEstate(),
                      _buildHallStaircase(),
                      _buildDriverRoom(),
                      _buildMaidRoom(),
                      _buildSwimmingPool(),
                      _buildFurnished(),
                      _buildVerse(),
                      _buildYard(),
                      _buildKitchen(),
                      _buildAppendix(),
                      _buildCarEntrance(),
                      _buildCllar(),
                      _buildElevator(),
                      _buildDuplex(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '2')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCommercialHousing(),
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildStreetWidth(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '3')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCommercialHousing(),
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildStreetWidth(),
                      _buildApartements(),
                      _buildAgeOfRealEstate(),
                      _buildStores(),
                      _buildFurnished(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '4')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildLounges(),
                      _buildToilets(),
                      _buildStreetWidth(),
                      _buildRooms(),
                      _buildAgeOfRealEstate(),
                      _buildDriverRoom(),
                      _buildMaidRoom(),
                      _buildFurnished(),
                      _buildVerse(),
                      _buildYard(),
                      _buildKitchen(),
                      _buildAppendix(),
                      _buildCarEntrance(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '5')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildLounges(),
                      _buildToilets(),
                      _buildStreetWidth(),
                      _buildRooms(),
                      _buildAgeOfRealEstate(),
                      _buildSwimmingPool(),
                      _buildFootballCourt(),
                      _buildVolleyballCourt(),
                      _buildVerse(),
                      _buildAmusementPark(),
                      _buildFamilyPartition(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '6')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildTrees(),
                      _buildWells(),
                      _buildVerse(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '7')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildStreetWidth(),
                      _buildAgeOfRealEstate(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '8')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildLounges(),
                      _buildToilets(),
                      _buildStreetWidth(),
                      _buildRooms(),
                      _buildFloor(),
                      _buildAgeOfRealEstate(),
                      _buildFurnished(),
                      _buildKitchen(),
                      _buildAppendix(),
                      _buildCarEntrance(),
                      _buildElevator(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '9')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildLounges(),
                      _buildToilets(),
                      _buildStreetWidth(),
                      _buildRooms(),
                      _buildAgeOfRealEstate(),
                      _buildHallStaircase(),
                      _buildDriverRoom(),
                      _buildMaidRoom(),
                      _buildSwimmingPool(),
                      _buildFurnished(),
                      _buildVerse(),
                      _buildYard(),
                      _buildKitchen(),
                      _buildAppendix(),
                      _buildCarEntrance(),
                      _buildCllar(),
                      _buildElevator(),
                      _buildDuplex(),
                      _buildConditioner(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '10')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCommercialHousing(),
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildStreetWidth(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '11')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCommercialHousing(),
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildStreetWidth(),
                      _buildApartements(),
                      _buildAgeOfRealEstate(),
                      _buildStores(),
                      _buildFurnished(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '12')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildPlan(),
                      _buildLounges(),
                      _buildToilets(),
                      _buildRooms(),
                      _buildSwimmingPool(),
                      _buildFootballCourt(),
                      _buildVolleyballCourt(),
                      _buildVerse(),
                      _buildKitchen(),
                      _buildAmusementPark(),
                      _buildFamilyPartition(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '13')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildTrees(),
                      _buildWells(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '14')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildSingleFamily(),
                      _buildPlan(),
                      _buildLounges(),
                      _buildToilets(),
                      _buildRooms(),
                      _buildFloor(),
                      _buildAgeOfRealEstate(),
                      _buildFurnished(),
                      _buildKitchen(),
                      _buildAppendix(),
                      _buildCarEntrance(),
                      _buildElevator(),
                      _buildConditioner(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '15')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildLounges(),
                      _buildToilets(),
                      _buildRooms(),
                      _buildFloor(),
                      _buildAgeOfRealEstate(),
                      _buildFurnished(),
                      _buildCarEntrance(),
                      _buildConditioner(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '16')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildStreetWidth(),
                      _buildAgeOfRealEstate(),
                      _buildFurnished(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '17')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildPlan(),
                      _buildAgeOfRealEstate(),
                      _buildFurnished(),
                      _buildKitchen(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '18')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildStreetWidth(),
                      _buildAgeOfRealEstate(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '19')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildStreetWidth(),
                      _buildAgeOfRealEstate(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '20')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildPlan(),
                      _buildFamilyPartition(),
                    ],
                  )
                else if (searchDrawer.selectedCategory == '21')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildInterface(),
                      _buildStreetWidth(),
                      _buildAgeOfRealEstate(),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: searchDrawer.waitMainPage == true
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
                            ),
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            _searchDrawerKey.currentState.save();
                            searchDrawer.setFilterSearchDrawer(4);
                            searchDrawer.getAdsInfo(
                              context,
                              searchDrawer.idCategorySearch,
                              searchDrawer.selectedCategory,
                              searchDrawer.minPriceSearchDrawer,
                              searchDrawer.maxPriceSearchDrawer,
                              searchDrawer.minSpaceSearchDrawer,
                              searchDrawer.maxSpaceSearchDrawer,
                              searchDrawer.selectedTypeAqarSearchDrawer,
                              searchDrawer.interfaceSelectedSearchDrawer,
                              searchDrawer.selectedPlanSearchDrawer,
                              searchDrawer.ageOfRealEstateSelectedSearchDrawer,
                              searchDrawer.selectedApartmentsSearchDrawer,
                              searchDrawer.floorSelectedSearchDrawer,
                              searchDrawer.selectedLoungesSearchDrawer,
                              searchDrawer.selectedRoomsSearchDrawer,
                              searchDrawer.storesSelectedSearchDrawer,
                              searchDrawer.streetWidthSelectedSearchDrawer,
                              searchDrawer.selectedToiletsSearchDrawer,
                              searchDrawer.treesSelectedSearchDrawer,
                              searchDrawer.wellsSelectedSearchDrawer,
                              searchDrawer.bool_feature1SearchDrawer.toString(),
                              searchDrawer.bool_feature2SearchDrawer.toString(),
                              searchDrawer.bool_feature3SearchDrawer.toString(),
                              searchDrawer.bool_feature4SearchDrawer.toString(),
                              searchDrawer.bool_feature5SearchDrawer.toString(),
                              searchDrawer.bool_feature6SearchDrawer.toString(),
                              searchDrawer.bool_feature7SearchDrawer.toString(),
                              searchDrawer.bool_feature8SearchDrawer.toString(),
                              searchDrawer.bool_feature9SearchDrawer.toString(),
                              searchDrawer.bool_feature10SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature11SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature12SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature13SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature14SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature15SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature16SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature17SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature18SearchDrawer
                                  .toString(),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff00cccc)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        AppLocalizations.of(context).search,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff00cccc),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    searchDrawer.ads.isNotEmpty
                                        ? Center(
                                            child: Text(
                                              ' ${AppLocalizations.of(context).search}  ${searchDrawer.countMenuAds()}  ${AppLocalizations.of(context).advertisement}  ',
                                              style: GoogleFonts.tajawal(
                                                fontSize: 12,
                                                color: const Color(0xff00cccc),
                                              ),
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                // search button ................................
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          AppLocalizations.of(context).twoWeeksAgoAds,
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff818181),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlutterSwitch(
                        activeColor: const Color(0xff00cccc),
                        width: 40.0,
                        height: 20.0,
                        valueFontSize: 15.0,
                        toggleSize: 15.0,
                        value: searchDrawer.isTwoWeeksAgoSearchDrawer,
                        borderRadius: 15.0,
                        padding: 2.0,
                        showOnOff: false,
                        onToggle: (val) {
                          searchDrawer.setIsTwoWeekSearchDrawer(val);
                          if (searchDrawer.isTwoWeeksAgoSearchDrawer == true) {
                            searchDrawer.setFilterSearchDrawer(2);
                            searchDrawer.getAdsInfo(
                              context,
                              searchDrawer.idCategorySearch,
                              searchDrawer.selectedCategory,
                              searchDrawer.minPriceSearchDrawer,
                              searchDrawer.maxPriceSearchDrawer,
                              searchDrawer.minSpaceSearchDrawer,
                              searchDrawer.maxSpaceSearchDrawer,
                              searchDrawer.selectedTypeAqarSearchDrawer,
                              searchDrawer.interfaceSelectedSearchDrawer,
                              searchDrawer.selectedPlanSearchDrawer,
                              searchDrawer.ageOfRealEstateSelectedSearchDrawer,
                              searchDrawer.selectedApartmentsSearchDrawer,
                              searchDrawer.floorSelectedSearchDrawer,
                              searchDrawer.selectedLoungesSearchDrawer,
                              searchDrawer.selectedRoomsSearchDrawer,
                              searchDrawer.storesSelectedSearchDrawer,
                              searchDrawer.streetWidthSelectedSearchDrawer,
                              searchDrawer.selectedToiletsSearchDrawer,
                              searchDrawer.treesSelectedSearchDrawer,
                              searchDrawer.wellsSelectedSearchDrawer,
                              searchDrawer.bool_feature1SearchDrawer.toString(),
                              searchDrawer.bool_feature2SearchDrawer.toString(),
                              searchDrawer.bool_feature3SearchDrawer.toString(),
                              searchDrawer.bool_feature4SearchDrawer.toString(),
                              searchDrawer.bool_feature5SearchDrawer.toString(),
                              searchDrawer.bool_feature6SearchDrawer.toString(),
                              searchDrawer.bool_feature7SearchDrawer.toString(),
                              searchDrawer.bool_feature8SearchDrawer.toString(),
                              searchDrawer.bool_feature9SearchDrawer.toString(),
                              searchDrawer.bool_feature10SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature11SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature12SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature13SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature14SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature15SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature16SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature17SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature18SearchDrawer
                                  .toString(),
                            );
                          } else if (searchDrawer.isTwoWeeksAgoSearchDrawer ==
                              false) {
                            searchDrawer.setFilterSearchDrawer(null);
                            searchDrawer.getAdsInfo(
                              context,
                              searchDrawer.idCategorySearch,
                              searchDrawer.selectedCategory,
                              searchDrawer.minPriceSearchDrawer,
                              searchDrawer.maxPriceSearchDrawer,
                              searchDrawer.minSpaceSearchDrawer,
                              searchDrawer.maxSpaceSearchDrawer,
                              searchDrawer.selectedTypeAqarSearchDrawer,
                              searchDrawer.interfaceSelectedSearchDrawer,
                              searchDrawer.selectedPlanSearchDrawer,
                              searchDrawer.ageOfRealEstateSelectedSearchDrawer,
                              searchDrawer.selectedApartmentsSearchDrawer,
                              searchDrawer.floorSelectedSearchDrawer,
                              searchDrawer.selectedLoungesSearchDrawer,
                              searchDrawer.selectedRoomsSearchDrawer,
                              searchDrawer.storesSelectedSearchDrawer,
                              searchDrawer.streetWidthSelectedSearchDrawer,
                              searchDrawer.selectedToiletsSearchDrawer,
                              searchDrawer.treesSelectedSearchDrawer,
                              searchDrawer.wellsSelectedSearchDrawer,
                              searchDrawer.bool_feature1SearchDrawer.toString(),
                              searchDrawer.bool_feature2SearchDrawer.toString(),
                              searchDrawer.bool_feature3SearchDrawer.toString(),
                              searchDrawer.bool_feature4SearchDrawer.toString(),
                              searchDrawer.bool_feature5SearchDrawer.toString(),
                              searchDrawer.bool_feature6SearchDrawer.toString(),
                              searchDrawer.bool_feature7SearchDrawer.toString(),
                              searchDrawer.bool_feature8SearchDrawer.toString(),
                              searchDrawer.bool_feature9SearchDrawer.toString(),
                              searchDrawer.bool_feature10SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature11SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature12SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature13SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature14SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature15SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature16SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature17SearchDrawer
                                  .toString(),
                              searchDrawer.bool_feature18SearchDrawer
                                  .toString(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                // two weeks ago switch .........................
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchAds()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff3f9d28)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context).speedSearch,
                              style: GoogleFonts.tajawal(
                                fontSize: 17,
                                color: const Color(0xff3f9d28),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xff3f9d28),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // quick search button ..........................
              ],
            ),
          ),
        ),
      );
    });
  }
}
