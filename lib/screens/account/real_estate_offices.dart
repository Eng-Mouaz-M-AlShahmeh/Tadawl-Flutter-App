/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/mainWidgets/bottom_navigation_bar.dart';
import 'package:tadawl_app/mainWidgets/custom_drawer.dart';
import 'package:tadawl_app/mainWidgets/maps/real_estate_map.dart';
import 'package:tadawl_app/provider/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/account/login.dart';
import 'package:tadawl_app/screens/account/offices_Vr.dart';

class RealEstateOffices extends StatelessWidget {
  RealEstateOffices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Provider.of<UserProvider>(context, listen: false).getSession();
    var _phone = Provider.of<UserProvider>(context, listen: false).phone;

    var mediaQuery = MediaQuery.of(context);
    var provider = Provider.of<LocaleProvider>(context, listen: false);
    var _lang = provider.locale.toString();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      drawer: Container(),
      endDrawer: Drawer(
        child: CustomDrawer(),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            color: Color(0xffffffff),
            child: Center(
              child: RealEstateMap(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Row(
              mainAxisAlignment: _lang != 'en_US'
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                  if (_phone != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OfficesVR()));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    }
                  },
                  child: Container(
                    width: mediaQuery.size.width * 0.46,
                    height: mediaQuery.size.height * 0.09,
                    decoration: BoxDecoration(
                      boxShadow: [],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: const Color(0xff00cccc),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                    .officesAccreditation,
                                style: GoogleFonts.tajawal(
                                  fontSize: _lang != 'en_US' ? 13 : 13,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Icon(Icons.verified_user_rounded,
                                    color: Color(0xffffffff), size: 30),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            AppLocalizations.of(context).officesAccreditation2,
                            style: GoogleFonts.tajawal(
                              fontSize: _lang != 'en_US' ? 13 : 13,
                              color: const Color(0xffe6e600),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
          height: mediaQuery.size.height * 0.11,
          child: BottomNavigationBarApp()),
    );
  }
}
