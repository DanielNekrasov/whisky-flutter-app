import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:whisky_app/data/whisky.dart';

class AppState with ChangeNotifier {
  AppState() {
    _fetchData();
  }

  List<Whisky> _whiskies = [];

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

  List<Whisky> get allWhiskies => List<Whisky>.from(_whiskies);

  Whisky getWhisky(int id) => _whiskies.singleWhere((w) => w.id == id);

  List<Whisky> get favoriteWhiskies =>
      _whiskies.where((w) => w.isFavorite).toList();

  List<Whisky> searchWhiskies(String terms) => _whiskies
      .where((w) => w.name.toLowerCase().contains(terms.toLowerCase()))
      .toList();

  void setFavorite(int id, bool isFavorite) {
    Whisky whisky = getWhisky(id);
    whisky.isFavorite = isFavorite;
    notifyListeners();
  }
}
