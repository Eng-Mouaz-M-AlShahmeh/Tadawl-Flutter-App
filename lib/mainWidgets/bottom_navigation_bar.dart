/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/account/login.dart';
import 'package:tadawl_app/screens/account/discussion_list.dart';
import 'package:tadawl_app/screens/ads/main_page.dart';
import 'package:tadawl_app/screens/ads/menu.dart';
import 'package:tadawl_app/screens/account/real_estate_offices.dart';
import 'package:tadawl_app/screens/general/regions.dart';

class BottomNavigationBarApp extends StatelessWidget {
  BottomNavigationBarApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    Provider.of<UserProvider>(context, listen: false).getSession();
    var _phone = Provider.of<UserProvider>(context, listen: false).phone;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        height: mediaQuery.size.height * 0.11,
        width: mediaQuery.size.width,
        color: Color(0xff00cccc),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    Text(
                      AppLocalizations.of(context).myAccount,
                      style: GoogleFonts.tajawal(
                        fontSize: 12,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    Text(
                      AppLocalizations.of(context).myLocation,
                      style: GoogleFonts.tajawal(
                        fontSize: 12,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Regions()),
                  );
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.map,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    Text(
                      AppLocalizations.of(context).regions,
                      style: GoogleFonts.tajawal(
                        fontSize: 13,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RealEstateOffices()),
                  );
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.home_work,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    Flexible(
                      child: Text(
                        AppLocalizations.of(context).realEstateOffices,
                        style: GoogleFonts.tajawal(
                          fontSize: 12,
                          color: const Color(0xffffffff),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                 _phone != null
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiscussionList()),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );

                },
                child: Column(
                  children: [
                    Icon(
                      Icons.message_rounded,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    Flexible(
                      child: Text(
                        AppLocalizations.of(context).messages,
                        style: GoogleFonts.tajawal(
                          fontSize: 12,
                          color: const Color(0xffffffff),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu()),
                  );
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    Text(
                      AppLocalizations.of(context).menu,
                      style: GoogleFonts.tajawal(
                        fontSize: 12,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
