/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/account/my_account.dart';

class UpdateMyInformation extends StatelessWidget {
  UpdateMyInformation({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> _updateMyInfoKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userUpdate, child) {
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
                userUpdate.getAvatarList(context, userUpdate.phone);
                userUpdate.getUserAdsList(context, userUpdate.phone);
                userUpdate.getEstimatesInfo(context, userUpdate.phone);
                userUpdate.getSumEstimatesInfo(context, userUpdate.phone);
                userUpdate.checkOfficeInfo(context, userUpdate.phone);
                userUpdate.getSession();

                Future.delayed(Duration(seconds: 1), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                });
              },
            ),
          ),
          title: Text(
            AppLocalizations.of(context).updateMyInfo,
            style: GoogleFonts.tajawal(
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color(0xff00cccc),
        ),
        backgroundColor: Color(0xffffffff),
        body: Form(
          key: _updateMyInfoKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              if (userUpdate.users.isEmpty)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: TextButton(
                                    onPressed: () {
                                      userUpdate.getImageUpdateProfile();
                                    },
                                    child: Container(
                                      width: mediaQuery.size.width * 0.9,
                                      height: mediaQuery.size.height * 0.3,
                                      child: Center(
                                          child: userUpdate
                                                      .imageUpdateProfile ==
                                                  null
                                              ? Container(
                                                  width: mediaQuery.size.width *
                                                      0.9,
                                                  height:
                                                      mediaQuery.size.height *
                                                          0.3,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: const AssetImage(
                                                          'assets/images/avatar.png'),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  width: mediaQuery.size.width *
                                                      0.9,
                                                  height:
                                                      mediaQuery.size.height *
                                                          0.4,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: FileImage(userUpdate
                                                          .imageUpdateProfile),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                )),
                                    ),
                                  ),
                                )
                              else
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: TextButton(
                                    onPressed: () {
                                      userUpdate.getImageUpdateProfile();
                                    },
                                    child: Container(
                                      width: mediaQuery.size.width * 0.9,
                                      height: mediaQuery.size.height * 0.3,
                                      child: Center(
                                          child: userUpdate
                                                      .imageUpdateProfile ==
                                                  null
                                              ? userUpdate.users.first.image ==
                                                      ''
                                                  ? Container(
                                                      width: mediaQuery
                                                              .size.width *
                                                          0.9,
                                                      height: mediaQuery
                                                              .size.height *
                                                          0.3,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: const AssetImage(
                                                              'assets/images/avatar.png'),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      width: mediaQuery
                                                              .size.width *
                                                          0.9,
                                                      height: mediaQuery
                                                              .size.height *
                                                          0.3,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              'https://tadawl.com.sa/API/assets/images/avatar/${userUpdate.users.first.image}'),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    )
                                              : Container(
                                                  width: mediaQuery.size.width *
                                                      0.9,
                                                  height:
                                                      mediaQuery.size.height *
                                                          0.4,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: FileImage(userUpdate
                                                          .imageUpdateProfile),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                )),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: mediaQuery.size.width * 0.8,
                                child: TextFormField(
                                  //controller: (userUpdate.usernameControllerUpdate..text) != null ? userUpdate.usernameController : userUpdate.usernameControllerUpdate,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.person,
                                        color: Color(0xff00cccc),
                                        size: 40,
                                      ),
                                      labelText:
                                          AppLocalizations.of(context).name),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: Color(0xff989696),
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context)
                                          .reqName;
                                    }
                                    return null;
                                  },
                                  //onChanged: (String value) {
                                  //  userUpdate.setUsernameControllerUpdate(value);
                                  //},
                                  onSaved: (String value) {
                                    //userUpdate.setUsernameController(value);
                                    userUpdate.setUsername(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: mediaQuery.size.width * 0.8,
                                child: TextFormField(
                                  //controller: userUpdate.emailController ?? TextEditingController(text: ''),
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Color(0xff00cccc),
                                        size: 40,
                                      ),
                                      labelText:
                                          AppLocalizations.of(context).email),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: Color(0xff989696),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context)
                                          .reqEmail;
                                    }
                                    return null;
                                  },
                                  onSaved: (String value) {
                                    userUpdate.setEmail(value);
                                    //userUpdate.setEmailController(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: mediaQuery.size.width * 0.8,
                                child: TextFormField(
                                  //controller: userUpdate.aboutController ?? TextEditingController(text: ''),
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.message_rounded,
                                        color: Color(0xff00cccc),
                                        size: 40,
                                      ),
                                      labelText:
                                          AppLocalizations.of(context).aboutMe),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: Color(0xff989696),
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context)
                                          .reqField;
                                    }
                                    return null;
                                  },
                                  onSaved: (String value) {
                                    userUpdate.setPersonalProfile(value);
                                    //userUpdate.setAboutController(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).memType,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: Color(0xff989696),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: mediaQuery.size.width,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ToggleButtons(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          AppLocalizations.of(context).company,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          AppLocalizations.of(context).marketer,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          AppLocalizations.of(context).owner,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          AppLocalizations.of(context).reSeeker,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .officeType,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                    onPressed: (int index) {
                                      userUpdate.updateMembershipType(index);
                                    },
                                    isSelected: userUpdate.membershipType,
                                    color: Color(0xff00cccc),
                                    selectedColor: Color(0xffffffff),
                                    fillColor: Color(0xff00cccc),
                                    borderWidth: 1,
                                    borderColor: Color(0xff00cccc),
                                    selectedBorderColor: Color(0xff00cccc),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (userUpdate.selectedMembership == 1)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: mediaQuery.size.width * 0.8,
                                  child: TextFormField(
                                    //controller: userUpdate.companyNameController ?? TextEditingController(text: ''),
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.business,
                                          color: Color(0xff00cccc),
                                          size: 40,
                                        ),
                                        labelText: AppLocalizations.of(context)
                                            .companyName),
                                    style: GoogleFonts.tajawal(
                                      fontSize: 13,
                                      color: Color(0xff989696),
                                    ),
                                    keyboardType: TextInputType.text,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return AppLocalizations.of(context)
                                            .reqField;
                                      }
                                      return null;
                                    },
                                    onSaved: (String value) {
                                      userUpdate.setCompanyName(value);
                                      //userUpdate.setCompanyNameController(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          if (userUpdate.selectedMembership == 5)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: mediaQuery.size.width * 0.8,
                                  child: TextFormField(
                                    //controller: userUpdate.OfficeNameController ?? TextEditingController(text: ''),
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.text_snippet_rounded,
                                          color: Color(0xff00cccc),
                                          size: 40,
                                        ),
                                        labelText: AppLocalizations.of(context)
                                            .officeTypeName),
                                    style: GoogleFonts.tajawal(
                                      fontSize: 13,
                                      color: Color(0xff989696),
                                    ),
                                    keyboardType: TextInputType.text,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return AppLocalizations.of(context)
                                            .reqField;
                                      }
                                      return null;
                                    },
                                    onSaved: (String value) {
                                      userUpdate.setOfficeNameUser(value);
                                      //userUpdate.setOfficeNameController(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: TextButton(
                              onPressed: () async {
                                if (!_updateMyInfoKey.currentState.validate()) {
                                  return;
                                }
                                _updateMyInfoKey.currentState.save();
                                await userUpdate.updateMyProfile(
                                    context,
                                    userUpdate.selectedMembership.toString(),
                                    userUpdate.userName,
                                    userUpdate.company_name,
                                    userUpdate.officeNameUser,
                                    userUpdate.email,
                                    userUpdate.personalProfile,
                                    userUpdate.phone,
                                    userUpdate.imageUpdateProfile);
                              },
                              child: Container(
                                width: mediaQuery.size.width * 0.5,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Color(0xff3f9d28), width: 1),
                                  color: Color(0xff3f9d28),
                                ),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context).save,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 15,
                                      color: Color(0xffffffff),
                                    ),
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
