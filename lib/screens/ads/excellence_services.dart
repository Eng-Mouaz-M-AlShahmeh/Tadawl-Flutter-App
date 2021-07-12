/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:tadawl_app/screens/ads/excellence_list.dart';

class ExcellenceServices extends StatelessWidget {
  ExcellenceServices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
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
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          AppLocalizations.of(context).excellenceServices,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).rule36,
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).advantages,
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context).rule37,
                                style: GoogleFonts.tajawal(
                                  fontSize: 10,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 250.0,
                          height: 250.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/images/img3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
        //            Navigator.push(
       //               context,
      //                MaterialPageRoute(builder: (context) => ExcellenceList()),
      //              );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                    child: Container(
                      width: mediaQuery.size.width * 0.4,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff3f9d28)),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context).submitDistinctionRequest,
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
          ],
        ),
      ),
    );
  }
}
