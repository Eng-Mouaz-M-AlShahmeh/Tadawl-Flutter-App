/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tadawl_app/provider/locale_provider.dart';
import 'package:tadawl_app/provider/request_provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';

class Requests extends StatelessWidget {
  Requests({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RequestProvider>(builder: (context, requests, child) {

      Provider.of<UserProvider>(context, listen: false).getSession();
      var _phone = Provider.of<UserProvider>(context, listen: false).phone;
      requests.getUserRequestsList(context, _phone);

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
            AppLocalizations.of(context).requests,
            style: GoogleFonts.tajawal(
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: IconButton(
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  color: Color(0xffffffff),
                  size: 40,
                ),
                onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => AddRequest()),
        //         );
                },
              ),
            ),
          ],
          backgroundColor: Color(0xff00cccc),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (requests.requests.isEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Text(
                        AppLocalizations.of(context).requestsHint,
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          color: const Color(0xff989696),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              else
                for (var i = 0; i < requests.countRequests(); i++)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                        trailing: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: Color(0xffff0000),
                            child: Center(
                              child: Icon(
                                Icons.delete_forever_rounded,
                                color: Color(0xffffffff),
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        title:
                            Provider.of<LocaleProvider>(context, listen: false)
                                        .locale
                                        .toString() !=
                                    'en_US'
                                ? Text('${requests.requests[i].category} .. ar',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20,
                                      color: Color(0xff000000),
                                    ))
                                : Text('${requests.requests[i].category} .. en',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20,
                                      color: Color(0xff000000),
                                    ))),
                  ),
            ],
          ),
        ),
      );
    });
  }
}
