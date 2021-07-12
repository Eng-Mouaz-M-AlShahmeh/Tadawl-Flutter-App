/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dcache/dcache.dart';

class CacheMarkerModel extends ChangeNotifier {
  Cache chache = SimpleCache<String, String>(
      storage: InMemoryStorage<String, String>(200));
  void updateCache(BuildContext context, String id_ads) {
    chache.set(id_ads, id_ads);
    notifyListeners();
  }

  String getCache(BuildContext context, String id_ads) {
    return chache.get(id_ads);
  }

}
