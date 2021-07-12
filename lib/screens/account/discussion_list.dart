/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/mainWidgets/bottom_navigation_bar.dart';
import 'package:tadawl_app/mainWidgets/custom_drawer.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/ads/main_page.dart';
import 'discussion_edit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscussionList extends StatelessWidget {
  DiscussionList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, convList, child) {

      var mediaQuery = MediaQuery.of(context);
      convList.getSession();
      var _phone = convList.phone;
      //convList.getConvInfo(context);

      return Scaffold(
        backgroundColor: const Color(0xffffffff),
        endDrawer: Drawer(
          child: CustomDrawer(),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            convList.getConvInfo(context);
            return Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiscussionList()),
            );
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height * 0.15,
                  decoration: BoxDecoration(
                    color: const Color(0xff00cccc),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xffffffff),
                              size: 40,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            AppLocalizations.of(context).messages,
                            style: GoogleFonts.tajawal(
                              fontSize: 20,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        TextButton(
                          child: Icon(
                            Icons.refresh,
                            color: Color(0xffffffff),
                            size: 40,
                          ),
                          onPressed: () {
                            convList.getConvInfo(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiscussionList()),
                            );
                          },
                        ),
                        TextButton(
                          child: Icon(
                            Icons.edit,
                            color: Color(0xffffffff),
                            size: 40,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiscussionEdit()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height * 0.75,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        convList.conv.isNotEmpty
                            ? Column(
                                children: [
                                  for (int i = 0; i < convList.countConvs(); i++)
                                    if (convList.conv[i].state_conv_sender != '0')
                                      TextButton(
                                        onPressed: () {
                                          convList.initScrollDown();
                                          convList.setRecAvatarUserName(convList.conv[i].username);
                                          Navigator.pushNamed(
                                              context, '/main/discussion_main',
                                              arguments: {
                                                'phone_user': convList.conv[i].phone,
                                              });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 10,
                                              bottom: 5,
                                              top: 5,
                                              left: 10),
                                          padding: EdgeInsets.all(13),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 0),
                                                child: Icon(
                                                  Icons.navigate_before_rounded,
                                                  color:
                                                  convList.conv[i].phone_user_sender ==
                                                              _phone
                                                          ? Color(0xff707070)
                                                          : Color(0xffffffff),
                                                  size: 50,
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          'https://tadawl.com.sa/API/assets/images/avatar/${convList.conv[i].image}'),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    convList.conv[i].username ??
                                                        'UserName',
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 13,
                                                      color:
                                                      convList.conv[i].phone_user_sender ==
                                                                  _phone
                                                              ? Color(0xff00cccc)
                                                              : Color(0xffffffff),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                                .fromLTRB(
                                                            5, 0, 15, 0),
                                                        child: Text(
                                                          DateFormat('yyyy-MM-dd')
                                                              .format(DateTime
                                                                  .parse(convList.conv[i]
                                                                      .timeAdded)),
                                                          style:
                                                              GoogleFonts.tajawal(
                                                            fontSize: 10,
                                                            color: convList.conv[i]
                                                                        .phone_user_sender ==
                                                                    _phone
                                                                ? Color(
                                                                    0xff848282)
                                                                : Color(
                                                                    0xffffffff),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    convList.conv[i].comment ?? '',
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 13,
                                                      color:
                                                      convList.conv[i].phone_user_sender ==
                                                                  _phone
                                                              ? Color(0xff848282)
                                                              : Color(0xffffffff),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            color: convList.conv[i].phone_user_sender ==
                                                    _phone
                                                ? Colors.grey[100]
                                                : Color(0xff00cccc),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight: Radius.circular(15)),
                                          ),
                                        ),
                                      )
                                ],
                              )
                            : Center(
                                child: Text(
                                  AppLocalizations.of(context).noMessages,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: Color(0xff848282),
                                  ),
                                ),
                              ),
                      ],
                    ),
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
  }
    );
  }
}
