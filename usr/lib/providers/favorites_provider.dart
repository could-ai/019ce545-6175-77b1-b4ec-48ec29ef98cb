import 'package:flutter/material.dart';
import '../models/tip.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Tip> _favorites = [];

  List<Tip> get favorites => _favorites;

  bool isFavorite(Tip tip) => _favorites.contains(tip);

  void addFavorite(Tip tip) {
    if (!_favorites.contains(tip)) {
      _favorites.add(tip);
      notifyListeners();
    }
  }

  void removeFavorite(Tip tip) {
    _favorites.remove(tip);
    notifyListeners();
  }
}