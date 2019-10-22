import 'package:flutter/foundation.dart';
import 'package:whisky_app/data/local_whisky_provider.dart';
import 'package:whisky_app/data/whisky.dart';

class AppState with ChangeNotifier {
  List<Whisky> _whiskies = LocalWhiskyProvider.whiskies;

  List<Whisky> get allWhiskies => List<Whisky>.from(_whiskies);

  Whisky getWhisky(int id) => _whiskies[id];

  List<Whisky> get favoriteWhiskies =>
      _whiskies.where((w) => w.isFavorite).toList();

  List<Whisky> searchVeggies(String terms) => _whiskies
      .where((w) => w.name.toLowerCase().contains(terms.toLowerCase()))
      .toList();

  void setFavorite(int id, bool isFavorite) {
    Whisky whisky = getWhisky(id);
    whisky.isFavorite = isFavorite;
    notifyListeners();
  }
}
