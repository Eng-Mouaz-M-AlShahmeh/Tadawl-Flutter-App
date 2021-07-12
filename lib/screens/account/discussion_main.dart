/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';

class Constants {
  static const String banMessaging = 'حظر المراسلة';
  static const List<String> choices = <String>[
    banMessaging,
  ];
}

class Discussion extends StatelessWidget {
  Discussion({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> _messageKey = GlobalKey<FormState>();
  void choiceAction(String choice) {}

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, mainChat, child) {
      var mediaQuery = MediaQuery.of(context);
      var phone_user;
      // ignore: omit_local_variable_types
      Map data = {};
      Provider.of<UserProvider>(context, listen: false).getSession();
      var _phone = Provider.of<UserProvider>(context, listen: false).phone;
      data = ModalRoute.of(context).settings.arguments;
      phone_user = data['phone_user'];


      mainChat.getConvInfo(context);
      mainChat.getCommentUser(context, phone_user);
      //mainChat.initScrollDown();

      return Scaffold(
        body: Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: AppBar(
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
                  //mainChat.closeStreamChat();
                  Navigator.pop(context);
                },
              ),
            ),
            title: Row(
              children: [
                      Text(
                        mainChat.recAvatarUserName,
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          color: const Color(0xffffffff),
                        ),
                        textAlign: TextAlign.center,
                      ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: PopupMenuButton<String>(
                  icon: Icon(
                    Icons.settings,
                    color: Color(0xffffffff),
                    size: 40,
                  ),
                  onSelected: choiceAction,
                  itemBuilder: (BuildContext context) {
                    return Constants.choices.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(
                          choice,
                          style: GoogleFonts.tajawal(
                            fontSize: 20,
                            color: const Color(0xffff0000),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList();
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
                Container(
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height * 0.75,
                  child:
                  StreamBuilder(
                    stream: mainChat.streamChatController.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          controller: mainChat.scrollChatController,
                          children: snapshot.data.map<Widget>((document) {
                            return document['phone_user_sender'] != _phone
                                ? Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 100,
                                                  bottom: 5,
                                                  top: 5,
                                                  left: 20),
                                              padding: EdgeInsets.all(13),
                                              child: Text(
                                                document['comment'],
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.tajawal(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.blueGrey[100],
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 0, 0),
                                            child: Text(
                                              DateFormat('yyyy-MM-dd  hh:mm a')
                                                  .format(DateTime.parse(
                                                      document['timeAdded'])),
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.tajawal(
                                                  fontSize: 8,
                                                  color: Color(0xffb1b1b1)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: 20,
                                                bottom: 5,
                                                top: 5,
                                                left: 100),
                                            padding: EdgeInsets.all(13),
                                            child: Text(
                                              document['comment'],
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.tajawal(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xff00cccc),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 20, 0),
                                          child: Text(
                                            DateFormat('yyyy-MM-dd  hh:mm a')
                                                .format(DateTime.parse(
                                                    document['timeAdded'])),
                                            textAlign: TextAlign.right,
                                            style: GoogleFonts.tajawal(
                                                fontSize: 8,
                                                color: Color(0xffb1b1b1)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]);
                          }).toList(),
                        );
                      }

                      return Center(child: Text('Loading...'));
                    },
                  ) ,
                ),
                // list comments ..............................
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: mainChat.atBottom == false
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 80),
                  child: FloatingActionButton(
                      backgroundColor: Color(0xff00cccc),
                      child: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Color(0xffffffff),
                        size: 40,
                      ),
                      onPressed: () {
                        mainChat.scrollDownButtun();
                      }),
                )
              : Container(),
          bottomNavigationBar: SizedBox(
            height: 90,
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    key: _messageKey,
                    child: Container(
                      width: mediaQuery.size.width,
                      height: mediaQuery.size.height,
                      decoration: BoxDecoration(
                        color: const Color(0xfff2f2f2),
                        border: Border.all(
                            width: 1.0, color: const Color(0xfff2f2f2)),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: mediaQuery.size.width * 0.7,
                                height: mediaQuery.size.height * 0.9,
                                child: TextFormField(
                                  onFieldSubmitted: (_) {
                                    if (mainChat.messageController.text.isEmpty) {
                                      return;
                                    }
                                    _messageKey.currentState.save();
                                    mainChat.sendMess(
                                        context,
                                        mainChat.messageController.text,
                                        phone_user);
                                  },
                                  controller: mainChat.messageController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff00cccc),
                                  ),
                                  keyboardType: TextInputType.text,
                                  onSaved: (String value) {
                                    mainChat.setMessageController(value);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: 50.0,
                              child: InkWell(
                                onTap: () {
                                  if (mainChat.messageController.text.isEmpty) {
                                    return;
                                  }
                                  _messageKey.currentState.save();
                                  mainChat.sendMess(
                                      context,
                                      mainChat.messageController.text,
                                      phone_user);
                                },
                                child: Icon(
                                  Icons.send_rounded,
                                  color: Color(0xff00cccc),
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
