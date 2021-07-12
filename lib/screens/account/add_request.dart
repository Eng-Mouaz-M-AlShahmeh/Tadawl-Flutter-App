/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
/*
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/locale_provider.dart';

class AddRequest extends StatelessWidget {
  AddRequest({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> _addRequestKey = GlobalKey<FormState>();

  var wait = false;
  String _selected = '0',
      selectedTypeAqar = '0',
      interfaceSelected = '0',
      streetWidthSelected = '0',
      ageOfRealEstateSelected = '0',
      maxPrice = '0',
      minPrice = '0',
      maxSpace = '0',
      minSpace = '0',
      selectedLounges = '0',
      selectedToilets = '0',
      selectedRooms = '0',
      selectedApartments = '0',
      selectedPlan = '0',
      storesSelected = '0',
      floorSelected = '0',
      selectedFamilyType = '0',
      treesSelected = '0',
      wellsSelected = '0';
  bool isTwoWeeksAgo = false,
      bool_feature1 = false,
      bool_feature2 = false,
      bool_feature3 = false,
      bool_feature4 = false,
      bool_feature5 = false,
      bool_feature6 = false,
      bool_feature7 = false,
      bool_feature8 = false,
      bool_feature9 = false,
      bool_feature10 = false,
      bool_feature11 = false,
      bool_feature12 = false,
      bool_feature13 = false,
      bool_feature14 = false,
      bool_feature15 = false,
      bool_feature16 = false,
      bool_feature17 = false,
      bool_feature18 = false;
  List<bool> typeAqar = List.generate(3, (_) => false);
  List<bool> plan = List.generate(3, (_) => false);
  List<bool> lounges = List.generate(4, (_) => false);
  List<bool> toilets = List.generate(4, (_) => false);
  List<bool> rooms = List.generate(4, (_) => false);
  List<bool> apartments = List.generate(6, (_) => false);
  List<bool> familyType = List.generate(2, (_) => false);
  final List<Map> Interface = [
    {'id_type': '0', 'type': 'الكل'},
    {'id_type': '1', 'type': 'شمال'},
    {'id_type': '2', 'type': 'شرق'},
    {'id_type': '3', 'type': 'غرب'},
    {'id_type': '4', 'type': 'جنوب'},
    {'id_type': '5', 'type': 'شمال شرقي'},
    {'id_type': '6', 'type': 'جنوب شرقي'},
    {'id_type': '7', 'type': 'جنوب غربي'},
    {'id_type': '8', 'type': 'شمال غربي'},
    {'id_type': '9', 'type': 'جنوبي شمالي'},
    {'id_type': '10', 'type': 'شرقي غربي'},
    {'id_type': '11', 'type': '3 شوارع'},
    {'id_type': '12', 'type': '4 شوارع'},
  ];
  final List<Map> EnInterface = [
    {'id_type': '0', 'type': 'All'},
    {'id_type': '1', 'type': 'North'},
    {'id_type': '2', 'type': 'East'},
    {'id_type': '3', 'type': 'West'},
    {'id_type': '4', 'type': 'South'},
    {'id_type': '5', 'type': 'Eastnorth'},
    {'id_type': '6', 'type': 'Eastsouth'},
    {'id_type': '7', 'type': 'Westsouth'},
    {'id_type': '8', 'type': 'Westnorth'},
    {'id_type': '9', 'type': 'South North'},
    {'id_type': '10', 'type': 'East West'},
    {'id_type': '11', 'type': '3 Roads'},
    {'id_type': '12', 'type': '4 Roads'},
  ];
  final List<Map> Stores = [
    {'id_type': '0', 'type': 'الكل'},
    {'id_type': '1', 'type': '1'},
    {'id_type': '2', 'type': '2'},
    {'id_type': '3', 'type': '3'},
    {'id_type': '4', 'type': '4'},
  ];
  final List<Map> Trees = [
    {'id_type': '0', 'type': 'الكل'},
    {'id_type': '100', 'type': 'أقل من 100 أشجار'},
    {'id_type': '200', 'type': 'أقل من 200 أشجار'},
    {'id_type': '500', 'type': 'أقل من 500 أشجار'},
    {'id_type': '1000', 'type': 'أقل من 1000 أشجار'},
    {'id_type': '2000', 'type': 'أقل من 2000 أشجار'},
    {'id_type': '5000', 'type': 'أقل من 5000 أشجار'},
    {'id_type': '10000', 'type': 'أقل من 10000 أشجار'},
  ];
  final List<Map> Wells = [
    {'id_type': '0', 'type': 'الكل'},
    {'id_type': '1', 'type': '1'},
    {'id_type': '2', 'type': '2'},
    {'id_type': '3', 'type': '3'},
    {'id_type': '4', 'type': '4'},
    {'id_type': '5', 'type': '5'},
    {'id_type': '6', 'type': '6'},
    {'id_type': '7', 'type': '7'},
    {'id_type': '8', 'type': '8'},
    {'id_type': '9', 'type': '9'},
    {'id_type': '10', 'type': '10'},
  ];
  final List<Map> Floor = [
    {'id_type': '0', 'type': 'الكل'},
    {'id_type': '1', 'type': 'دور أرضي'},
    {'id_type': '2', 'type': 'دور علوي'},
    {'id_type': '3', 'type': '3'},
    {'id_type': '4', 'type': '4'},
    {'id_type': '5', 'type': '5'},
    {'id_type': '6', 'type': '6'},
    {'id_type': '7', 'type': '7'},
    {'id_type': '8', 'type': '8'},
    {'id_type': '9', 'type': '9'},
    {'id_type': '10', 'type': '10'},
    {'id_type': '11', 'type': '11'},
    {'id_type': '12', 'type': '12'},
    {'id_type': '13', 'type': '13'},
    {'id_type': '14', 'type': '14'},
    {'id_type': '15', 'type': '15'},
  ];
  final List<Map> StreetWidth = [
    {'id_type': '0', 'type': 'الكل'},
    {'id_type': '5', 'type': 'أكثر من 5'},
    {'id_type': '10', 'type': 'أكثر من 10'},
    {'id_type': '15', 'type': 'أكثر من 15'},
    {'id_type': '20', 'type': 'أكثر من 20'},
    {'id_type': '25', 'type': 'أكثر من 25'},
    {'id_type': '30', 'type': 'أكثر من 30'},
    {'id_type': '35', 'type': 'أكثر من 35'},
    {'id_type': '40', 'type': 'أكثر من 40'},
    {'id_type': '45', 'type': 'أكثر من 45'},
    {'id_type': '50', 'type': 'أكثر من 50'},
  ];
  final List<Map> AgeOfRealEstate = [
    {'id_type': '0', 'type': 'الكل'},
    {'id_type': '1', 'type': 'أقل من سنة'},
    {'id_type': '2', 'type': 'أقل من 2 سنة'},
    {'id_type': '3', 'type': 'أقل من 3 سنة'},
    {'id_type': '4', 'type': 'أقل من 4 سنة'},
    {'id_type': '5', 'type': 'أقل من 5 سنة'},
    {'id_type': '6', 'type': 'أقل من 6 سنة'},
    {'id_type': '7', 'type': 'أقل من 7 سنة'},
    {'id_type': '8', 'type': 'أقل من 8 سنة'},
    {'id_type': '9', 'type': 'أقل من 9 سنة'},
    {'id_type': '10', 'type': 'أقل من 10 سنة'},
    {'id_type': '11', 'type': 'أقل من 11 سنة'},
    {'id_type': '12', 'type': 'أقل من 12 سنة'},
    {'id_type': '13', 'type': 'أقل من 13 سنة'},
    {'id_type': '14', 'type': 'أقل من 14 سنة'},
    {'id_type': '15', 'type': 'أقل من 15 سنة'},
    {'id_type': '16', 'type': 'أقل من 16 سنة'},
    {'id_type': '17', 'type': 'أقل من 17 سنة'},
    {'id_type': '18', 'type': 'أقل من 18 سنة'},
    {'id_type': '19', 'type': 'أقل من 19 سنة'},
    {'id_type': '20', 'type': 'أقل من 20 سنة'},
  ];

  final List<Map> EnStores = [
    {'id_type': '0', 'type': 'All'},
    {'id_type': '1', 'type': '1'},
    {'id_type': '2', 'type': '2'},
    {'id_type': '3', 'type': '3'},
    {'id_type': '4', 'type': '4'},
  ];
  final List<Map> EnTrees = [
    {'id_type': '0', 'type': 'All'},
    {'id_type': '100', 'type': 'Less than 100 trees'},
    {'id_type': '200', 'type': 'Less than 200 trees'},
    {'id_type': '500', 'type': 'Less than 500 trees'},
    {'id_type': '1000', 'type': 'Less than 1000 trees'},
    {'id_type': '2000', 'type': 'Less than 2000 trees'},
    {'id_type': '5000', 'type': 'Less than 5000 trees'},
    {'id_type': '10000', 'type': 'Less than 10000 trees'},
  ];
  final List<Map> EnWells = [
    {'id_type': '0', 'type': 'All'},
    {'id_type': '1', 'type': '1'},
    {'id_type': '2', 'type': '2'},
    {'id_type': '3', 'type': '3'},
    {'id_type': '4', 'type': '4'},
    {'id_type': '5', 'type': '5'},
    {'id_type': '6', 'type': '6'},
    {'id_type': '7', 'type': '7'},
    {'id_type': '8', 'type': '8'},
    {'id_type': '9', 'type': '9'},
    {'id_type': '10', 'type': '10'},
  ];
  final List<Map> EnFloor = [
    {'id_type': '0', 'type': 'All'},
    {'id_type': '1', 'type': 'Ground Floor'},
    {'id_type': '2', 'type': 'Upstairs'},
    {'id_type': '3', 'type': '3'},
    {'id_type': '4', 'type': '4'},
    {'id_type': '5', 'type': '5'},
    {'id_type': '6', 'type': '6'},
    {'id_type': '7', 'type': '7'},
    {'id_type': '8', 'type': '8'},
    {'id_type': '9', 'type': '9'},
    {'id_type': '10', 'type': '10'},
    {'id_type': '11', 'type': '11'},
    {'id_type': '12', 'type': '12'},
    {'id_type': '13', 'type': '13'},
    {'id_type': '14', 'type': '14'},
    {'id_type': '15', 'type': '15'},
  ];
  final List<Map> EnStreetWidth = [
    {'id_type': '0', 'type': 'All'},
    {'id_type': '5', 'type': 'More than 5'},
    {'id_type': '10', 'type': 'More than 10'},
    {'id_type': '15', 'type': 'More than 15'},
    {'id_type': '20', 'type': 'More than 20'},
    {'id_type': '25', 'type': 'More than 25'},
    {'id_type': '30', 'type': 'More than 30'},
    {'id_type': '35', 'type': 'More than 35'},
    {'id_type': '40', 'type': 'More than 40'},
    {'id_type': '45', 'type': 'More than 45'},
    {'id_type': '50', 'type': 'More than 50'},
  ];
  final List<Map> EnAgeOfRealEstate = [
    {'id_type': '0', 'type': 'All'},
    {'id_type': '1', 'type': 'Less than 1 years'},
    {'id_type': '2', 'type': 'Less than 2 years'},
    {'id_type': '3', 'type': 'Less than 3 years'},
    {'id_type': '4', 'type': 'Less than 4 years'},
    {'id_type': '5', 'type': 'Less than 5 years'},
    {'id_type': '6', 'type': 'Less than 6 years'},
    {'id_type': '7', 'type': 'Less than 7 years'},
    {'id_type': '8', 'type': 'Less than 8 years'},
    {'id_type': '9', 'type': 'Less than 9 years'},
    {'id_type': '10', 'type': 'Less than 10 years'},
    {'id_type': '11', 'type': 'Less than 11 years'},
    {'id_type': '12', 'type': 'Less than 12 years'},
    {'id_type': '13', 'type': 'Less than 13 years'},
    {'id_type': '14', 'type': 'Less than 14 years'},
    {'id_type': '15', 'type': 'Less than 15 years'},
    {'id_type': '16', 'type': 'Less than 16 years'},
    {'id_type': '17', 'type': 'Less than 17 years'},
    {'id_type': '18', 'type': 'Less than 18 years'},
    {'id_type': '19', 'type': 'Less than 19 years'},
    {'id_type': '20', 'type': 'Less than 20 years'},
  ];
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
              if (mounted) {
                setState(() {
                  for (var buttonIndex = 0;
                      buttonIndex < typeAqar.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      typeAqar[buttonIndex] = true;
                      selectedTypeAqar = (buttonIndex + 1).toString();
                    } else {
                      typeAqar[buttonIndex] = false;
                    }
                  }
                });
              }
            },
            isSelected: typeAqar,
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
                maxPrice = value;
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
                minPrice = value;
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
                maxSpace = value;
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
                minSpace = value;
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
                      value: interfaceSelected ?? '0',
                      onChanged: (String newValue) {
                        setState(() {
                          interfaceSelected = newValue;
                        });
                      },
                      items: Provider.of<LocaleProvider>(context, listen: false)
                                  .locale
                                  .toString() !=
                              'en_US'
                          ? Interface.map((Map map) {
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
                          : EnInterface.map((Map map) {
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
                      value: streetWidthSelected ?? '0',
                      onChanged: (String newValue) {
                        setState(() {
                          streetWidthSelected = newValue;
                        });
                      },
                      items: Provider.of<LocaleProvider>(context, listen: false)
                                  .locale
                                  .toString() !=
                              'en_US'
                          ? StreetWidth.map((Map map) {
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
                          : EnStreetWidth.map((Map map) {
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
                  setState(() {
                    for (var buttonIndex = 0;
                        buttonIndex < apartments.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        apartments[buttonIndex] = true;
                        selectedApartments = (buttonIndex + 1).toString();
                      } else {
                        apartments[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: apartments,
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
                      value: ageOfRealEstateSelected ?? '0',
                      onChanged: (String newValue) {
                        setState(() {
                          ageOfRealEstateSelected = newValue;
                        });
                      },
                      items: Provider.of<LocaleProvider>(context, listen: false)
                                  .locale
                                  .toString() !=
                              'en_US'
                          ? AgeOfRealEstate.map((Map map) {
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
                          : EnAgeOfRealEstate.map((Map map) {
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
              setState(() {
                for (var buttonIndex = 0;
                    buttonIndex < rooms.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    rooms[buttonIndex] = true;
                    selectedRooms = (buttonIndex + 1).toString();
                  } else {
                    rooms[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: rooms,
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
                setState(() {
                  for (var buttonIndex = 0;
                      buttonIndex < lounges.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      lounges[buttonIndex] = true;
                      selectedLounges = (buttonIndex + 1).toString();
                    } else {
                      lounges[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: lounges,
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
                setState(() {
                  for (var buttonIndex = 0;
                      buttonIndex < toilets.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      toilets[buttonIndex] = true;
                      selectedToilets = (buttonIndex + 1).toString();
                    } else {
                      toilets[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: toilets,
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
              setState(() {
                for (var buttonIndex = 0;
                    buttonIndex < plan.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    plan[buttonIndex] = true;
                    selectedPlan = (buttonIndex + 1).toString();
                  } else {
                    plan[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: plan,
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
                      value: storesSelected ?? '0',
                      onChanged: (String newValue) {
                        setState(() {
                          storesSelected = newValue;
                        });
                      },
                      items: Provider.of<LocaleProvider>(context, listen: false)
                                  .locale
                                  .toString() !=
                              'en_US'
                          ? Stores.map((Map map) {
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
                          : EnStores.map((Map map) {
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
                      value: floorSelected ?? '0',
                      onChanged: (String newValue) {
                        setState(() {
                          floorSelected = newValue;
                        });
                      },
                      items: Provider.of<LocaleProvider>(context, listen: false)
                                  .locale
                                  .toString() !=
                              'en_US'
                          ? Floor.map((Map map) {
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
                          : EnFloor.map((Map map) {
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
                      value: treesSelected ?? '0',
                      onChanged: (String newValue) {
                        setState(() {
                          treesSelected = newValue;
                        });
                      },
                      items: Provider.of<LocaleProvider>(context, listen: false)
                                  .locale
                                  .toString() !=
                              'en_US'
                          ? Trees.map((Map map) {
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
                          : EnTrees.map((Map map) {
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
                      value: wellsSelected ?? '0',
                      onChanged: (String newValue) {
                        setState(() {
                          wellsSelected = newValue;
                        });
                      },
                      items: Provider.of<LocaleProvider>(context, listen: false)
                                  .locale
                                  .toString() !=
                              'en_US'
                          ? Wells.map((Map map) {
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
                          : EnWells.map((Map map) {
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
              setState(() {
                for (var buttonIndex = 0;
                    buttonIndex < familyType.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    familyType[buttonIndex] = true;
                    selectedFamilyType = (buttonIndex + 1).toString();
                    if (familyType[0] == true) {
                      setState(() {
                        bool_feature17 = true;
                      });
                    }
                  } else {
                    familyType[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: familyType,
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
            value: bool_feature1,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature1 = val;
              });
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
            value: bool_feature2,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature2 = val;
              });
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
            value: bool_feature3,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature3 = val;
              });
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
            value: bool_feature4,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature4 = val;
              });
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
            value: bool_feature5,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature5 = val;
              });
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
            value: bool_feature6,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature6 = val;
              });
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
            value: bool_feature7,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature7 = val;
              });
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
            value: bool_feature8,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature8 = val;
              });
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
            value: bool_feature9,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature9 = val;
              });
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
            value: bool_feature10,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature10 = val;
              });
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
            value: bool_feature11,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature11 = val;
              });
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
            value: bool_feature12,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature12 = val;
              });
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
            value: bool_feature13,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature13 = val;
              });
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
            value: bool_feature14,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature14 = val;
              });
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
            value: bool_feature15,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature15 = val;
              });
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
            value: bool_feature16,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature16 = val;
              });
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
            value: bool_feature17,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature17 = val;
              });
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
            value: bool_feature18,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                bool_feature18 = val;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, requests, child) {
      return Scaffold(
        backgroundColor: const Color(0xffffffff),
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
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            AppLocalizations.of(context).addRequest,
            style: GoogleFonts.tajawal(
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color(0xff00cccc),
        ),
        body: Form(
          key: _addRequestKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                                value: _selected,
                                onChanged: (String newValue) {
                                  if (newValue == '0') {
                                    setState(() {
                                      _selected = newValue;
                                    });
                                  } else {
                                    setState(() {
                                      _selected = newValue;
                                    });
                                  }
                                },
                                items: Provider.of<LocaleProvider>(context,
                                                listen: false)
                                            .locale
                                            .toString() !=
                                        'en_US'
                                    ? requests.categories.map((Map map) {
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
                                    : requests.enCategories.map((Map map) {
                                        return DropdownMenuItem<String>(
                                          value: map['id_category'].toString(),
                                          // value: _mySelection,
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

                if (_selected == '0')
                  Container()
                else if (_selected == '1')
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
                else if (_selected == '2')
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
                else if (_selected == '3')
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
                else if (_selected == '4')
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
                else if (_selected == '5')
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
                else if (_selected == '6')
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
                else if (_selected == '7')
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
                else if (_selected == '8')
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
                else if (_selected == '9')
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
                else if (_selected == '10')
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
                else if (_selected == '11')
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
                else if (_selected == '12')
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
                else if (_selected == '13')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildTrees(),
                      _buildWells(),
                    ],
                  )
                else if (_selected == '14')
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
                else if (_selected == '15')
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
                else if (_selected == '16')
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
                else if (_selected == '17')
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
                else if (_selected == '18')
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
                else if (_selected == '19')
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
                else if (_selected == '20')
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildPrice(),
                      _buildSpace(),
                      _buildPlan(),
                      _buildFamilyPartition(),
                    ],
                  )
                else if (_selected == '21')
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
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: wait == true
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
                            _addRequestKey.currentState.save();
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
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        AppLocalizations.of(context).addRequest,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff00cccc),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                // search button ................................
              ],
            ),
          ),
        ),
      );
    });
  }
}
*/