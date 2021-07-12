/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:tadawl_app/mainWidgets/bottom_navigation_bar.dart';
import 'package:tadawl_app/mainWidgets/custom_drawer.dart';
import 'package:tadawl_app/mainWidgets/maps/regions_map.dart';

class Regions extends StatelessWidget {
  Regions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      endDrawer: Drawer(
        child: CustomDrawer(),
      ),
      body: Center(
        child: RegionsMap(),
      ),
      bottomNavigationBar: SizedBox(
          height: mediaQuery.size.height * 0.11,
          child: BottomNavigationBarApp()),
    );
  }
}
