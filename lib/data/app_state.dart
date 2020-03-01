import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whisky_app/data/whisky.dart';

const FAVORITE_KEY = 'favoriteIds';

class AppState with ChangeNotifier {
  AppState() {
    _fetchData();
    _setFromStorage();
  }

  List<Whisky> _whiskies = [];
  List<String> _favoriteWhiskiesId = [];
  SharedPreferences _shared_prefs;

  Future<void> _fetchData() async {
    var databaseReference = FirebaseDatabase.instance.reference();
    var whiskies = databaseReference.child('whiskies');
    whiskies.once().then((DataSnapshot snapshot) {
      var whiskiesList = snapshot.value.toList();
      for (var whiskyItem in whiskiesList) {
        var jsonString = json.encode(whiskyItem);
        Whisky whisky = Whisky.fromJson(json.decode(jsonString));
        _whiskies.add(whisky);
      }

      notifyListeners();
    });
  }

  Future<void> _setFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    _shared_prefs = prefs;
    final favoriteIds = prefs.getStringList(FAVORITE_KEY) ?? [];
    for (var whiskyId in favoriteIds) {
      Whisky whisky = getWhisky(int.parse(whiskyId));
      whisky.isFavorite = true;
    }
  }

  List<Whisky> get allWhiskies => List<Whisky>.from(_whiskies);

  Whisky getWhisky(int id) => _whiskies.singleWhere((w) => w.id == id);

  List<Whisky> get favoriteWhiskies =>
      _whiskies.where((w) => w.isFavorite).toList();

  List<Whisky> searchWhiskies(String terms) => _whiskies
      .where((w) => w.name.toLowerCase().contains(terms.toLowerCase()))
      .toList();

  void setFavorite(int id, bool isFavorite) async {
    saveFavoriteInPrefs(id, isFavorite);

    Whisky whisky = getWhisky(id);
    whisky.isFavorite = isFavorite;
    notifyListeners();
  }

  void saveFavoriteInPrefs(int id, bool isFavorite) {
    if (isFavorite) {
      _favoriteWhiskiesId.add(id.toString());
    } else {
      _favoriteWhiskiesId.remove(id.toString());
    }
    _shared_prefs.setStringList(FAVORITE_KEY, _favoriteWhiskiesId);
  }
}
