import 'package:flutter/cupertino.dart';

import '../models/anime.dart';

class AppStateProvider extends ChangeNotifier{
  List<Anime> _favorites = [];

  List<Anime> get favorites => _favorites;

  bool isFavorite(String animeId) {
    return _favorites.any((anime) => anime.id == animeId);
  }

  void toggleFavorite(Anime anime) {
    if (isFavorite(animeId)) {
      removeFavorite(anime.id);
    } else {
      addFavorite(anime);
    }
  }

  void addFavorite(Anime anime) {
    if (!isFavorite(anime.id)) {
      _favorites.add(anime);
      _saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(String animeId) {
    _favorites.removeWhere((anime) => anime.id == animeId);
    _saveFavorites();
    notifyListeners();
  }


}