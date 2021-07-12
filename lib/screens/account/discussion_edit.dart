/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/mainWidgets/bottom_navigation_bar.dart';
import 'package:tadawl_app/mainWidgets/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/account/discussion_list.dart';

class DiscussionEdit extends StatelessWidget {
  DiscussionEdit({
    Key key,
  }) : super(key: key);

  Future _deleteConv(String phone_user_recipient, String phone_user_sender) async {
    var res = await http.post(
        'https://www.tadawl.com.sa/API/api_app/conversations/delete_conv.php',
        body: {
          'phone_user_recipient': phone_user_recipient,
          'phone_user_sender': phone_user_sender,
        });
    var jsonx = json.decode(res.body);
    if (jsonx == 'false') {
      await Fluttertoast.showToast(
          msg: 'هناك خطاء لم يتم الحذف ، راجع الإدارة',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      await Fluttertoast.showToast(
          msg: 'تم حذف المراسلة',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, convEdit, child) {
      var mediaQuery = MediaQuery.of(context);
      //convEdit.getConvInfo(context);

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiscussionList()),
                );
              },
            ),
          ),
          title: Text(
            AppLocalizations.of(context).messages,
            style: GoogleFonts.tajawal(
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          actions: [Text('')],
          backgroundColor: Color(0xff00cccc),
        ),
        backgroundColor: const Color(0xffffffff),
        endDrawer: Drawer(
          child: CustomDrawer(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.75,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      convEdit.conv.isNotEmpty
                          ? Column(
                              children: [
                                for (int i = 0; i < convEdit.countConvs(); i++)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.remove_circle_rounded,
                                              color: Color(0xffFF0000),
                                              size: 50,
                                            ),
                                            onPressed: () {
                                              _deleteConv(
                                                  convEdit.conv[i].phone_user_recipient,
                                                  convEdit.conv[i].phone_user_sender);
                                            },
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          convEdit.setRecAvatarUserName(convEdit.conv[i].username);
                                          Navigator.pushNamed(
                                              context, '/main/discussion_main',
                                              arguments: {
                                                'phone_user': convEdit.conv[i].phone,
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
                                                  color: Color(0xff707070),
                                                  size: 40,
                                                ),
                                              ),
                                              Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          'https://tadawl.com.sa/API/assets/images/avatar/${convEdit.conv[i].image}'),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    convEdit.conv[i].username ??
                                                        'UserName',
                                                    textAlign: TextAlign.right,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 12,
                                                      color: Color(0xff00cccc),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                                .fromLTRB(
                                                            5, 0, 10, 0),
                                                        child: Text(
                                                          DateFormat('yyyy-MM-dd')
                                                              .format(DateTime
                                                                  .parse(convEdit.conv[i]
                                                                      .timeAdded)), //hh:mm a
                                                          textAlign:
                                                              TextAlign.left,
                                                          style:
                                                              GoogleFonts.tajawal(
                                                            fontSize: 8,
                                                            color:
                                                                Color(0xff848282),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    convEdit.conv[i].comment,
                                                    textAlign: TextAlign.right,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 12,
                                                      color: Color(0xff848282),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight: Radius.circular(15)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
        bottomNavigationBar: SizedBox(
            height: mediaQuery.size.height * 0.11,
            child: BottomNavigationBarApp()),
      );
  }
    );
  }
}
