import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  void addFavorite(Map<String, dynamic> recipe) {
    _favorites.add(recipe);
    notifyListeners();
  }

  void removeFavorite(Map<String, dynamic> recipe) {
    _favorites.remove(recipe);
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> recipe) {
    return _favorites.contains(recipe);
  }
}