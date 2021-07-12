/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/account/new_account.dart';
import 'package:tadawl_app/screens/account/verifyAccount.dart';

String pattternPhone = r'(^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$)';
RegExp regExpPhone = RegExp(pattternPhone);

class RestorationPass extends StatelessWidget {
  RestorationPass({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> _restorationPassKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, restorationPass, child) {

      var mediaQuery = MediaQuery.of(context);

      Widget _buildCurrentPhone() {
        return TextFormField(
          decoration:
          InputDecoration(labelText: AppLocalizations.of(context).mobileNumber),
          style: GoogleFonts.tajawal(
            fontSize: 15,
            color: const Color(0xff989696),
          ),
          keyboardType: TextInputType.phone,
          validator: (String value) {
            if (value.isEmpty) {
              return AppLocalizations.of(context).reqMob;
            } else if (!regExpPhone.hasMatch(value)) {
              return AppLocalizations.of(context).reqSaudiMob;
            }
            return null;
          },
          onSaved: (String value) {
            restorationPass.setCurrentPhone(value);
          },
        );
      }

      return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Form(
          key: _restorationPassKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: mediaQuery.size.width,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff00cccc),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(15, 0, 15, 5),
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

                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(15, 0, 15, 5),
                                  child: Text(
                                    AppLocalizations
                                        .of(context)
                                        .restorationPass,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20,
                                      color: const Color(0xffffffff),
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: mediaQuery.size.width * 0.7,
                        child: _buildCurrentPhone(),
                      ),
                      Icon(
                        Icons.phone_enabled,
                        color: Color(0xff00cccc),
                        size: 40,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: TextButton(
                    onPressed: () async {
                      if (!_restorationPassKey.currentState.validate()) {
                        return;
                      }
                      _restorationPassKey.currentState.save();
                      var url =
                          'https://www.tadawl.com.sa/API/api_app/login/restoration_pass.php';
                      var response = await http.post(url, body: {
                        'phone': restorationPass.currentPhone,
                      });
                      var data = json.decode(response.body);
                      if (data == 'false') {
                        await Fluttertoast.showToast(
                            msg:
                            'رقم الجوال غير موجود، لماذا لا تجرب تسجيل حساب جديد',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 15.0);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewAcount()),
                        );
                      } else if (data == 'succesful') {
                        await Fluttertoast.showToast(
                            msg: 'لقد تم إرسال رمز اتفعيل إلى رقم جوالك',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 15.0);
                        restorationPass.saveSession(restorationPass.currentPhone);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyAccount()),
                        );
                      }
                    },
                    child: Container(
                      width: mediaQuery.size.width * 0.8,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: const Color(0xff3f9d28), width: 1),
                        color: const Color(0xffffffff),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations
                              .of(context)
                              .restorationPass,
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff3f9d28),
                          ),
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
    }
    );
  }
}
