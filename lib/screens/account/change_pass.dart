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
import 'package:tadawl_app/screens/account/my_account.dart';

class ChangePass extends StatelessWidget {
  ChangePass({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> _changePassKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, changePass, child) {
      var mediaQuery = MediaQuery.of(context);
      changePass.getSession();

      Widget _buildReNewPass() {
        return TextFormField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context).configNewPass),
          style: GoogleFonts.tajawal(
            fontSize: 15,
            color: const Color(0xff989696),
          ),
          keyboardType: TextInputType.visiblePassword,
          validator: (String value) {
            if (value.isEmpty) {
              return AppLocalizations.of(context).reqConfirmNewPass;
            } else if (value.length < 8) {
              return AppLocalizations.of(context).reqPassless8;
            } //else if (value != changePass.newPass) {
            //  return AppLocalizations.of(context).notMatch;
            //}
            return null;
          },
          onSaved: (String value) {
            changePass.setReNewPass(value);
          },
        );
      }

      Widget _buildNewPass() {
        return TextFormField(
          decoration:
          InputDecoration(labelText: AppLocalizations.of(context).newPass),
          style: GoogleFonts.tajawal(
            fontSize: 15,
            color: const Color(0xff989696),
          ),
          keyboardType: TextInputType.visiblePassword,
          validator: (String value) {
            if (value.isEmpty) {
              return AppLocalizations.of(context).reqNewPass;
            } else if (value.length < 8) {
              return AppLocalizations.of(context).reqPassless8;
            }
            return null;
          },
          onSaved: (String value) {
            changePass.setNewPass(value);
          },
        );
      }

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
            AppLocalizations
                .of(context)
                .changePass,
            style: GoogleFonts.tajawal(
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color(0xff00cccc),
        ),
        backgroundColor: const Color(0xffffffff),
        body: Form(
          key: _changePassKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: mediaQuery.size.width * 0.7,
                        child: _buildNewPass(),
                      ),
                      Icon(
                        Icons.vpn_key_rounded,
                        color: Color(0xff00cccc),
                        size: 40,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: mediaQuery.size.width * 0.7,
                        child: _buildReNewPass(),
                      ),
                      Icon(
                        Icons.vpn_key_outlined,
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
                      if (!_changePassKey.currentState.validate()) {
                        return;
                      } else {
                        _changePassKey.currentState.save();
                        var url =
                            'https://tadawl.com.sa/API/api_app/login/change_pass.php';
                        var response = await http.post(url, body: {
                          'phone': changePass.phone,
                          'newPass': changePass.newPass,
                          'reNewPass': changePass.reNewPass,
                        });
                        var data = json.decode(response.body);
                        if (data == 'nomatch') {
                          await Fluttertoast.showToast(
                              msg: 'كلمة المرور والتأكيد غير متطابقان',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 15.0);
                        }

                        else if (data == 'error') {
                          await Fluttertoast.showToast(
                              msg: 'هناك خطاء راجع الإدارة',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 15.0);
                        } else if (data == 'successful') {
                          await Fluttertoast.showToast(
                              msg: 'لقد تم تغيير كلمة المرور بنجاح',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 15.0);

                          changePass.getAvatarList(context, changePass.phone);
                          changePass.getUserAdsList(context, changePass.phone);
                          changePass.getEstimatesInfo(context, changePass.phone);
                          changePass.getSumEstimatesInfo(context, changePass.phone);
                          changePass.checkOfficeInfo(context, changePass.phone);

                          changePass.setUserPhone(changePass.phone);

                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyAccount()),
                            );
                          });
                        }
                      }
                    },
                    child: Container(
                      width: mediaQuery.size.width * 0.8,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: const Color(0xff3f9d28), width: 2),
                        color: const Color(0xffffffff),
                      ),
                      child: Center(
                        child: Text(
                            AppLocalizations
                                .of(context)
                                .changePass,
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
